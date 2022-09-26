package com.spring.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.domain.BoardAttachVO;
import com.spring.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Setter(onMethod_ = { @Autowired })
	private BoardAttachMapper attachMapper;

	private String getFolderYesterDay() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.DATE, 0);   // 데이터베이스에서 오늘 사용된 파일의 목록을 얻어옵니다.
		// cal.add(Calendar.DATE, -1);   // 데이터베이스에서 어제 사용된 파일의 목록을 얻어옵니다.

		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);
	}

	@Scheduled(cron = "0 0 2 * * *") // FileCheckTask의 checkFiles()는 매일 새벽 2시에 동작하게 설정했습니다.
	// @Scheduled(cron = "0 * * * * *") // FileCheckTask의 checkFiles()는 매분 0초마다 한 번씩 동작하게 설정했습니다.
	public void checkFiles() throws Exception {

		log.warn("File Check Task run.................");
		log.warn(new Date());
		// file list in database
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();

		// ready for check file in directory with database file list
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());

		// image file has thumnail file
		fileList.stream().filter(vo -> vo.isFileType() == true)
				.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));

		log.warn("===========================================");

		fileListPaths.forEach(p -> log.warn(p));

		// files in yesterday directory
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();

		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

		log.warn("-----------------------------------------");
		for (File file : removeFiles) {

			log.warn(file.getAbsolutePath());

			file.delete();

		}
	}
}

// 실행 확인
// 서버(프로젝트) 실행 후 http://localhost:9005/board/register 에서
// Title, Text area, Writer에는 내용을 넣지 말고,
// 파일 선택 버튼 클릭해서 이미지 파일(또는 일반 파일)을 선택합니다.
// 이러면, DB에는 첨부파일 내역이 생성되지 않는데, 서버 upload 폴더 안에 연/월/일 폴더 안에 파일이 잘못 생성됩니다.
// C드라이브에 upload 폴더 안에 연/월/일 폴더 안에 생성된 이미지 파일/섬네일 파일(또는 일반 파일)을 확인합니다.
// SQLDEVELOPER 에서 select * from tbl_attach; 쿼리문 확인을 해봅니다.
// C드라이브 upload 폴더 안에 연/월/일 폴더 안에 있는 데이터 내역이 DB에는 없는 것을 확인합니다.
// FileCheckTask 클래스에 있는 cal.add(Calendar.DATE, 0);   // 데이터베이스에서 오늘 사용된 파일의 목록을 얻어옵니다.
// 잠시후 (@Scheduled(cron = "0 * * * * *") // FileCheckTask의 checkFiles()는 매분 0초마다 한 번씩 동작하게 설정했습니다.
// 다음과 같이 매분 0초에 STS 콘솔에 다음의 로그(log) 메시지가 나타나는지 확인해 봅니다.
// ~~ 위에 생략 ~~



// ~~ 아래 생략 ~~
// SQLDEVELOPER 에서 select * from tbl_attach; 쿼리문 확인을 해봅니다. DB에는 변화가 없지만,
// C드라이브 upload 폴더 안에 연/월/일 폴더 안에 있는 데이터들이 사라진 것을 확인합니다.