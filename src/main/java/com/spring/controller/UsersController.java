package com.spring.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.head;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AttachImageVO;
import com.spring.domain.UsersVO;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/users/*")
@Log4j
public class UsersController {
	
	@Autowired
	UsersService userserivce;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	
	
	
	
	
	//===============================================================


	//회원가입페이지(get)
	@GetMapping("/insert")
	public void insertget() {
		log.warn("회원가입 페이지");
		log.info("info");
	}
	//회원가입페이지(post)
	@PostMapping("/insert")
	public String insertpost(UsersVO uservo) {
		String originPw = "";
		String bcryptPw = "";
		
		originPw = uservo.getUSER_PW();
		bcryptPw = pwEncoder.encode(originPw);
		uservo.setUSER_PW(bcryptPw);
		
		
		log.info("유저정보"+uservo);
		userserivce.userInsert(uservo);
		//log.warn("회원가입 완료");
		return "redirect:/";
	}
	
	@GetMapping("/display")      
	                             //파일경로 + 파일이름을 전달받아야하기 String타입으로
	public ResponseEntity<byte[]> getimage(String fileName){
		File file = new File("c:\\Finalimage\\"+fileName);
		
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile.........."+fileName);
		//초기화
		File file = null;
		try {
			//썸네일 파일 삭제
			file = new File("c:\\Finalimage\\"+URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_","");
			log.info("originFileName : " + originFileName );
			file = new File(originFileName);
			file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail",HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	
	
	//한글이름일경우를 대비해서 utf-8로 인코딩
	@PostMapping(value = "/uploadAjaxAction",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	//MultipartFile은 뷰에서 전송한 multipart 타입의 파일을 다룰 수 있게 해줌.
	//파일 이름 , 사이즈 반환 ,파일을 특정경로에  저장할 수 있게 해줌.
	//uploadFile은 view단의 formdata key값이랑 맞춰줌
	//[]유무 : 파일 여러개 받을지
	public ResponseEntity<List<AttachImageVO>> imageuploadAjax(MultipartFile[] uploadFile) {
		
		for (MultipartFile multipartFile : uploadFile) {
			//이미지 타입이 맞는지 체크
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			try {				
				type = Files.probeContentType(checkfile.toPath());
				log.info("mime type: "+type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")) {
				List<AttachImageVO>list = null;
				return new ResponseEntity<List<AttachImageVO>>(list,HttpStatus.BAD_REQUEST);
			}
		}
		
		//파일 저장 위치 설정 - yyyy-MM-dd
		String uploadFolder = "C:\\"; 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//문자열 형식 지정
		Date date = new Date();//오늘의 날짜 데이터 얻기위해 사용
		String str = sdf.format(date); //문자열 형식에 오늘의 날짜 삽입
		String datePath = str.replace("-", File.separator);//-를 경로 구분자로 설정
		//파일 저장 위치 설정 -Finalimage
		String datePath1 = "Finalimage";
		
		
		//폴더를 생성하기 위해 사용한 클래스 = File
		//uploadPath에 1번인자로uploadFolder 2번인자로datePath 사용
		File uploadPath = new File(uploadFolder,datePath1);
		//로컬에 폴더가 이미 있을경우를 대비해 if문 작성
		if(uploadPath.exists() == false) {			
		uploadPath.mkdirs();
		log.info("저장폴더를 생성했습니다");
		}
		//이미지 정보를 담을 객체
		List<AttachImageVO> list = new ArrayList<AttachImageVO>();
		
		for (MultipartFile multipartFile : uploadFile) {
			
		log.warn("파일 이름" + multipartFile.getOriginalFilename());
		log.warn("파일 타입" + multipartFile.getContentType());
		log.warn("파일 이름" + multipartFile.getSize());
		
		//파일 이름 
		String uploadFileName = multipartFile.getOriginalFilename();
		//파일이름 중복을 막기위해 uuid 설정
		String uuid = UUID.randomUUID().toString();
		//파일이름앞에 uuid_ 를 추가함
		uploadFileName = uuid+"_"+uploadFileName;
		
		AttachImageVO vo = new AttachImageVO();
		vo.setFileName(uploadFileName);//파일이름
		vo.setUploadPath(datePath1);//파일경로
		vo.setUuid(uuid);//uuid
		
		//savfile에 1번인자로 uploadPath 2번인자로 uploadFileName 사용
		File savefile = new File(uploadPath,uploadFileName);
		try {
			//수신된 파일(multipartFile)을 지정된 대상 파일(savefile)로 전송합니다
			multipartFile.transferTo(savefile);	
			log.info("save file 경로 "+savefile);
			log.info("파일을 저장했습니다.");
			//썸네일 저장파일 이름
			File thumbnailFile = new File(uploadPath,"s_"+uploadFileName);
			/*1번 방법
			//ImageIO의 read메서드를 사용해서 savefile 읽어와서 BufferedImage 의 변수에 대입
			BufferedImage bo_image = ImageIO.read(savefile);
			//비율
			double ratio = 3;
			//넓이 설정
			int width = (int)(bo_image.getWidth()/ratio);
			//높이 설정
			int height = (int)(bo_image.getHeight()/ratio);
			//일종의 크기를 지정하여 흰색 도화지를 만든다고 생각 width(넓이)height(높이)BufferedImage.TYPE_3BYTE_BGR(타입)
			BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
			//도화지에 그림을 그릴수 있게 하기 위한 과정
			Graphics2D graphic = bt_image.createGraphics();
			//도화지에 그림을 그림(그리고자하는이미지 좌상단 0,0부터 그리기시작/width넓이/height높이/일반적인경우null)
			graphic.drawImage(bo_image,0,0,width,height,null);
			//bt_image를 jpg형식으로 thumbnailFile에따라 저장
			ImageIO.write(bt_image, "jpg", thumbnailFile);
			*/
			BufferedImage bo_image = ImageIO.read(savefile);
			//비율
			double ratio = 3;
			//넓이 설정
			int width = (int)(bo_image.getWidth()/ratio);
			//높이 설정
			int height = (int)(bo_image.getHeight()/ratio);
			
			Thumbnails.of(savefile).size(width, height).toFile(thumbnailFile);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		list.add(vo);
			
		} //for문 끝
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list,HttpStatus.OK);
		return result;
	}
	
	
	//아이디중복확인
	@PostMapping("/userIdChk")
	@ResponseBody
	public String userIdChk(String userId) {
		//log.warn("useridchk 진입");
		int result = userserivce.idCheck(userId);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}//아이디 중복 확인 종료
	//닉네임 중복 확인
	@PostMapping("/usernickChk")
	@ResponseBody
	public String usernickChk(String usernick) {
		//log.warn("useridchk 진입");
		int result = userserivce.nickCheck(usernick);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

}
