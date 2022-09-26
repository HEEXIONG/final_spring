package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

// Page494 UploadController에는 GET 방식으로 첨부파일을 업로드할 수 있는 화면을
// 처리하는 메서드와 POST 방식으로 첨부파일 업로드를 처리하는 메서드를 추가합니다.
// UploadController에는 클래스 선언부에 @RequestMapping을 적용하지 않기 때문에
// WEB-INF/views 폴더에 uploadForm.jsp 파일을 추가합니다.
// Page497 : 스프링 MVC에는 MultipartFile 타입을 제공해서 업로드되는 파일 데이터를 쉽게
//           처리할 수 있습니다. 
@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	// Page497 파일 처리는 스프링에서 제공하는 MultipartFile 타입(형식)을 이용합니다.
	// 화면에서 첨부파일을 여러개 선택할 수 있으므로, 배열 타입으로 설정한 후 파일을 업로드해
	// 봅니다. (아직 파일 이름이 한글인 경우에 대한 설정이 없는 상태이므로, 영문 이름의 파일만
	// 업로드해서 테스트해 봅니다)
	@PostMapping("/uploadFormAction")
	public void uploadformPost(MultipartFile[] uploadFile, Model model) {
		
		// Page499 파일 저장 : 업로드되는 파일을 저장하는 방법은 간단히
		// transferTo() 메서드를 이용해서 처리할 수 있습니다.
		// 우선 파일이 업로드되는 location(공간)인 C드라이브의 upload 폴더를 설정해줍니다.
		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile)  {
			log.info("===================================");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			// transferTo() 메서드의 파라미터로는 java.io.File 객체를 지정하면
			// 되기 때문에 업로드 되는 원래 파일의 이름으로 C드라이브 upload 폴더에 저장됩니다. 앞서, test01.jpg, test02.jpg, test03.jpg 3개 파일을 업로드해 봅니다.
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {        // transferTo() 메서드로 업로드되는 파일을 저장 처리합니다.
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch			
		} // end for
	}
	
	// Page500 Ajax를 이용하는 파일 업로드 처리
	// Ajax를 이용하는 첨부파일 처리는 FormData라는 객체를 이용하는데
	// IE의 경우 10이후의 버전부터 지원되므로 브라우저에 제약은 있을 수 있습니다.
	// UploadController에 GET 방식으로 첨부파일을 업로드하는 페이지를 제작합니다.
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}

	// Page508 중복된 이름의 첨부파일 처리
	  // 첫번째로 중복된 이름의 파일 처리할 때, 현재 시간을 밀리세컨드(천분의 1초단위)까지 구분해서
	  // 파일 이름을 생성해서 저장하거나 UUID를 이용해서 중복이 발생할 가능성이 거의 없는 문자열을
	  // 생성해서 처리합니다. 두번째로 하나의 폴더에 생성될 수 있는 파일의 개수에 대한 문제 해결을
	  // 위해, 한 폴더에 너무 많은 파일이 있는 경우 속도의 저하와 개수의 제한 문제가 생기는 것을
	  // 방지해야 합니다. 이에 대한 해결책으로 보통 '년/월/일' 단위의 폴더를 생성해서
	  // 파일을 저장 처리합니다.
		
	  // Page508 년/월/일 폴더의 생성 : 첨부파일을 보관하는 폴더를 생성하는 작업은 한번에 폴더를
	  // 생성하거나 존재하는 폴더를 이용하는 방식을 사용합니다. java.io.File에 존재하는
	  // mkdirs()를 이용하면 필요한 상위 폴더까지 한 번에 생성할 수 있으므로 간단히 처리할 수 있습니다.
	  private String getFolder() {
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  Date date = new Date();
		  String str = sdf.format(date);
		  return str.replace("-", File.separator);
	  }
	
	// Page504 uploadAjaxAction 소스 코딩	
	// Page510 중복 방지를 위한 UUID 적용 : 파일 이름을 생성할 때 동일한 이름으로
	// 업로드되면 기존 파일을 지우게 되므로 java.util.UUID의 값을 이용해서 처리합니다.
	// Page517 UploadController에 AttachFileDTO으 리스트 반환 구조 변경 처리
	// uploadAjaxPost()메서드는 기존과 달리 ResponseEntity<List<AttachFileDTO>>를 반환하는 형태로 수정하고, JSON 데이터를
	// 반환하도록 변경합니다. 내부에서는 각 파일에 맞게 AttachFileDTO를 생성해서
    // 전달하는 구조로 변경합니다.
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	// Page517 소스 수정 코딩
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<AttachFileDTO> list = new ArrayList<>();

	// Page517 소스 수정할 때는 아래 1줄 소스는 주석처리합니다.	
	// public void uploadAjaxPost(MultipartFile[] uploadFile) {
		
		 log.info("update ajax post.........");
		 String uploadFolder = "C:\\upload";
		 
		 // Page517 아래에 1줄 소스 코딩 추가
		 String uploadFolderPath = getFolder();
		 
		 // make folder ==================
		 // getFolder() 메서드는 오늘 날짜의 경로를 문자열로 생성합니다.
		 // 생성된 경로는 폴더 경로로 수정된 뒤에 반환합니다.
		 // uploadAjaxPost() 메서드에서는 해당 경로가 있는지 검사하고,
		 // 폴더를 생성합니다. 이후 생성된 폴더로 파일을 저장하게 합니다.
		 // 폴더를 생성한 후 기존과 달리 uploadPath 경로에 파일을 저장하게 되면
		 // 자동으로 폴더가 생성되면서 파일이 지정되는 것을 볼 수 있습니다.
		 // Page517 소스 코딩할 때 아래 1줄 소스 주석 처리
//		 File uploadPath = new File(uploadFolder, getFolder());
		 
		 // Page517 아래 1줄 소스 코딩
		 File uploadPath = new File(uploadFolder, uploadFolderPath);		 
		 
		 log.info("upload path : " + uploadPath);
		 
		 if(uploadPath.exists() == false) {
			 uploadPath.mkdirs();
		 } // make yyyy/MM/dd folder 폴더 생성 처리
		
		 for (MultipartFile multipartFile : uploadFile) {
			 
			 // Page518 아래 1줄 소스 코딩
			 AttachFileDTO attachDTO = new AttachFileDTO();
		
		 log.info("-------------------------------------");
		 log.info("Upload File Name: " + multipartFile.getOriginalFilename());
		 log.info("Upload File Size: " + multipartFile.getSize());
		
		 String uploadFileName = multipartFile.getOriginalFilename();
		
		// IE has file path
		// IE의 경우에는 전체 파일 경로가 전송되므로,
 	    // 마지막'\'를 기준으로 잘라낸 문자열이 실제 파일 이름이 됩니다.
		 uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +
		 1);
		 log.info("only file name: " + uploadFileName);
		 
		 // Page518 아래 1줄 소스 코딩 추가
		 attachDTO.setFileName(uploadFileName);
		
		 // Page509 소스 코딩할 때 아래 1줄 소스는 주석 처리해 줌.
//		 File saveFile = new File(uploadFolder, uploadFileName);
		 
		 // Page511 UUID 추가
		 UUID uuid = UUID.randomUUID(); 
		 // Page511 첨부파일은 randomUUID() 메서드를 이용해서 임의의 값으로 생성합니다.
		 // 생성된 값은 원래의 파일 이름과 구분할 수 있도록 중간에 '_'를 추가합니다.
		 // 나중에 앞에서부터 '_'를 기준으로 분리하면 원래의 파일 이름을 파악할 수 있습니다.
		 // 이제 첨부파일을 업로드하면 UUID가 생성된 파일이 생기므로, 원본 이름과 같더라도
		 // 다른 이름의 파일로 생성되는 것을 확인해 봅니다.
		 uploadFileName = uuid.toString() + "_" + uploadFileName;
		 
		 try {
			 // Page509 소스  수정 코딩 추가
			 File saveFile = new File(uploadPath, uploadFileName);		 
			 multipartFile.transferTo(saveFile);
			 
			 // Page518 아래 2줄 소스 코딩 추가
			 attachDTO.setUuid(uuid.toString());
			 attachDTO.setUploadPath(uploadFolderPath);
			 
			 // Page514 check image type file : 만약에 이미지 타입이라면
			 // 섬네일을 생성하도록 uploadAjaxPost() 메서드의 코드를 수정합니다.
			 if (checkImageType(saveFile)) {
				 
				 // Page518 아래 1줄 소스 코딩 추가
				 attachDTO.setImage(true);				 
				 
				 // Page514 : /uploadAjax를 이용해서 이미지 파일을 업로드하면 원본 파일은 그대로
				 // 저장되고, 파일 이름이 's_'로 시작하는 섬네일 파일이 생성되는 것을
				 // 확인해 봅니다. 반면 일반 파일(예시: test.pdf)의 경우에는
				 // 그냥 파일만 업로드되는 것을 확인해 봅니다.
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				
				// Thumbnailator는 InputStream과 java.io.File 객체를 이용해서
				// 파일을 생성할 수 있고, 뒤에 사이즈에 대한 부분을 파라미터로
				// width와 height를 지정할 수 있습니다.
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}
			 
			 // Page518 : add to List (아래 1줄 소스 코딩 추가)
			 list.add(attachDTO);
			 
		} catch (Exception e) {
			e.printStackTrace();
		} // end catch
		
	 } // end for
		 // Page518 아래 1줄 소스 코딩 추가
		 return new ResponseEntity<>(list, HttpStatus.OK);
  }
	// Page513 특정한 파일이 이미지 타입인지를 검사하는 checkImageType() 메서드 선언
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
  
	// Page526 UploadController에서 섬네일 데이터 전송하기
	// UploadController에서는 특정한 파일 이름을 받아서 이미지 데이터를 전송하는 코드를
	// 우선 생성합니다.
	@GetMapping("/display")
	@ResponseBody
	// getFile() 메서드는 문자열로 파일의 경로가 포함된 fileName을 파라미터로 받고
	//  byte[]를 전송합니다. byte[]로 이미지 파일의 데이터를 전송할 때 신경 쓰이는 것은
	// 브라우저에 보내주는 MIME 타입이 파일의 종류에 따라 달라지는 점입니다. 이부분 해결을 위해
	// probeContentType() 메서드를 이용해서 적절한 MIME 타입 데이터를 Http의 헤더
	// 메시지에 포함할 수 있도록 처리합니다.
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName : " + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// Page531 첨부파일의 다운로드 소스 코딩 시작
	// MIME 타입은 다운로드를 할 수 잇는 'application/octet-stream'으로 지정하고	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)	
	@ResponseBody
	// ResponseEntity<>의 타입은 byte[] 등을 사용할 수 있지만,
	// 이번에는 org.springframework.core.io.Resource 타입(형식)을 이용해서
	// 좀 더 간단하게 처리해 보겠습니다.
	// Page533 소스 코딩할 때 아래 1줄 소스는 주석 처리함.
	// public ResponseEntity<Resource> downloadFile(String fileName){
	// Page533 아래 1줄 소스 코딩
	// downloadFile() 메서드에서 @RequestHeader를 이용해서 필요한 HTTP 헤더
	// 메시지의 내용을 수집할 수 있습니다. 이를 이용해서 "User-Agent"의 정보를 파악하고,
	// 값이 "MSIE" 혹은 'Trident'(IE 브라우저의 엔진 이름 - IE11처리)인 경우에는
	// 다른 방식으로 처리하도록 합니다.
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){

		log.info("download file : " + fileName);
		
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		// Page534 아래 2줄 소스 코딩 추가
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		log.info("resource : " + resource);
		String resourceName = resource.getFilename();
		
		// Page539 아래 1줄 소스 코딩 추가 : remove UUID
		// Page540 위에 참고 : 아래 추가된 소스는 resourceOriginalName을 생성해서
		// UUID 부분을 잘라낸 상태의 일반 파일 이름으로 저장하도록 하는 것입니다.
		// 브라우저에서 순수한 일반 파일 이름으로 다운로드 되는 것을 확인해 보시기 바랍니다.
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);		
		
		HttpHeaders headers = new HttpHeaders();
		try {
			// Page534 아래 소스 코딩 시작
			String downloadName = null;
			if(userAgent.contains("Trident")) {
				log.info("IE browser");
				// Page539 소스 코딩할 때 아래 1줄 소스는 주석 처리 해줍니다.
				// downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", " ");
				// Page539 아래 1줄 소스 코딩 추가
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if (userAgent.contains("Edge")) {
				log.info("Edge browser");
				// Page539 소스 코딩할 때 아래 1줄 소스는 주석 처리 해줍니다.
				// downloadName = URLEncoder.encode(resourceName, "UTF-8");
				// Page539 아래 1줄 소스 코딩 추가
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
				log.info("Edge name : " + downloadName);
			} else {
				log.info("Chrome browser");
				// Page539 소스 코딩할 때 아래 1줄 소스는 주석 처리 해줍니다.
				// downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
				// Page539 아래 1줄 소스 코딩 추가
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			} 
			// Page534 소스 코딩 끝
			
		// Page532 다운로드 시 저장되는 이름은 'Content-Disposition'을 이용해서
		// 지정합니다. 파일 이름에 대한 문자열 처리는 파일 이름이 한글인 경우 저장할 때
		// 깨지는 문제를 막기 위해서입니다.
		// Page534 소스 코딩할 때 아래 1줄 소스 코딩 주석 처리함
		// headers.add("Content-Disposition", "attachment; filename=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		// Page534 아래 1줄 소스 코딩 추가
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return	new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}	
	// Page531 첨부파일의 다운로드 소스 코딩 끝
	
	// Page548 서버에서 첨부파일의 삭제 처리 : 서버 측에서 첨부파일은 전달되는 파라미터의
	// 이름과 종류를 파악해서 처리합니다.
	@PostMapping("/deleteFile")
	@ResponseBody
	// Page548 deleteFile()은 브라우저에서 전송하는 파일 이름과 종류를 파라미터로 받아서
	// 파일의 종류에 따라 다르게 동작합니다. 
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("deleteFile : " + fileName);
		
		File file;
		
		try {
			// 브라우저에서 전송되는 파일 이름은 '경로  + UUID + _ + 파일 이름'으로
			// 구성되어 있으므로, 일반 파일의 경우에는 파일만을
			// 삭제 처리 합니다.
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			// 만약, 이미지의 경우 섬네일이 존재하므로, 파일 이름의 중간에 's_'가 들어가
			// 있습니다. 일반 이미지 파일의 경우 's_'가 없도록 되어 있으므로, 이 부분을
			// 고려해서 원본 이미지 파일도 같이 삭제하도록 처리 합니다.
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFileName : " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
}
