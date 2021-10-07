package com.myspring.kmpetition.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.kmpetition.board.vo.UploadVO;

// 컨텍스트만으로 접속 시 메인으로 보내주는 컨트롤러. 
// 모든 컨트롤러에 상속되어 viewForm의 기능을 더해주는 컨트롤러.

@Controller("mainController")
//@EnableAspectJAutoProxy  넣어야하나?
//@RequestMapping(value = "/main")
public class MainController {
	private final String Path = "C:\\test";

	@RequestMapping(value = "/main/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      System.out.println("Main컨의 main");
	      HttpSession session;
	      ModelAndView mav = new ModelAndView();
	      String viewName = "/main/main";
	      String req = "main";
	      mav = networkGraph(req, mav);
	      mav.setViewName(viewName);
	      return mav;
	   }

//	contextPath만 입력하고 접속했을 때 자동으로 메인 화면으로 리다이렉트 하기 위한 메서드
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void home(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Main컨의 home");
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("main/main.do");

	}

	@RequestMapping(value = { "/*.do" }, method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Main컨의 viewForm - /*.do");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	
	@RequestMapping(value = "/main/timeDetail.do", method = { RequestMethod.GET })
	   public ModelAndView timeDetail(HttpServletRequest request, HttpServletResponse response) {

	      ModelAndView mav = new ModelAndView();
	      String viewName = "/timeDetail";
	      String req = "time_series";

	      mav = networkGraph(req, mav);
	      mav.setViewName(viewName);

	      return mav;
	   }
	   
	   @RequestMapping(value = "/main/networkDetail.do", method = { RequestMethod.GET })
	   public ModelAndView networkDetail(HttpServletRequest request, HttpServletResponse response) {

	      ModelAndView mav = new ModelAndView();
	      String viewName = "/networkDetail";
	      String req = "network";
	      Map<String, String> config = new HashMap<String, String>();
	      String month = request.getParameter("month");
	      String category = request.getParameter("category");
	      String[] categoryName = {"전체", "기타", "정치개혁", "행정", "일자리", "보건복지", "인권/성평등", "안전/환경", "농산어촌", "교통/건축/국토", "육아/교육", "외교/통일/국방", "문화/예술/체육/언론", "미래", "반려동물", "경제민주화", "성장동력", "저출산/고령화대책"};
	      
	      if (month == null) {
	      
	         month = "9";
	      }
	      
	      if(category == null){
	         
	         category = "0";
	      }
	      
	      req += "-" + month + "-" + category;
	      config.put("month", month);
	      config.put("category", categoryName[Integer.parseInt(category)]);
	      mav = networkGraph(req, mav);
	      mav.addObject("config", config);
	      mav.setViewName(viewName);

	      return mav;
	   }

	//   네트워크 그래프를 그리기 위한 메서드
	   public ModelAndView networkGraph(String req, ModelAndView mav) {

	      Socket soc = null;
	      BufferedReader br = null;
	      PrintWriter pw = null;
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	      System.out.println("process started at " + sdf.format(new Date()));

	      try {

	         soc = new Socket("192.168.0.37", 9999);

	         InputStream input = soc.getInputStream();
	         br = new BufferedReader(new InputStreamReader(input));
	         OutputStream output = soc.getOutputStream();
	         pw = new PrintWriter(output);
	         pw.print(req);
	         pw.flush();

	         String line = br.readLine();
	         String json_str = line.replace('"', '\"');
	         if (req.equals("main")) {

	            String[] json_array = json_str.split("/asdf/");
	            System.out.println(json_array.length);
	            int i = 1;
	            int j = 1;
	            int k = 1;
	            for (String jstr : json_array) {

	               // json4는 현재 top10, json5는 이전 top10
	               if (jstr.startsWith("top:")) {

	                  String array_str = jstr.replace("top:", "");
	                  String[] top_array = array_str.split(",");
	                  mav.addObject("top_list" + i, top_array);
	                  i += 1;

	               }

	               else if (jstr.startsWith("pie:")) {

	                  String[] array = jstr.replace("pie:", "").split(", ");

	                  List<String> val_list = new ArrayList<String>();

	                  for (int c = 0; c < array.length; c++) {

	                     val_list.add(array[c].replace("[", "").replace("]", ""));

	                  }
	                  mav.addObject("pie" + j, val_list);
	                  j++;
	               }

	               else if (jstr.startsWith("time:")) {

	                  jstr = jstr.replace("time:", "");
	                  String[] data = jstr.split("/time/");
	                  JSONParser parser = new JSONParser();
	                  Object obj = parser.parse(data[1]);
	                  JSONObject json = (JSONObject) obj;

	                  // json1은 pie graph, json2는 time_series graph
	                  // json3는 network graph
	                  mav.addObject("time" + k, json);
	                  k += 1;

	               }

	               else if (jstr.startsWith("net:")) {

	                  jstr = jstr.replace("net:", "");
	                  JSONParser parser = new JSONParser();
	                  Object obj = parser.parse(jstr);
	                  JSONObject json = (JSONObject) obj;

	                  mav.addObject("net", json);
	               }
	            }

	         }

	         else if (req.startsWith("network")) {

	               JSONParser parser = new JSONParser();
	               Object obj = parser.parse(json_str);
	               JSONObject json = (JSONObject) obj;

	               mav.addObject("net", json);
	            }


	         else if (req.equals("time_series")) {

	            Map<String, String> timeMap = new HashMap<String, String>();
	            String[] json_array = json_str.split("/asdf/");
	            int i = 1;

	            for (String jstr : json_array) {

	               String[] data = jstr.split("/time/");
	               
	               JSONParser parser = new JSONParser();
	               Object obj = parser.parse(data[1]);
	               JSONObject json = (JSONObject) obj;

	               // json1은 pie graph, json2는 time_series graph
	               // json3는 network graph
	               timeMap.put("time" + i, data[0]);
	               mav.addObject("time" + i, json);
	               i += 1;
	            }
	            
	            mav.addObject("timeMap", timeMap);
	         }
	      }

	      catch (Exception e) {

	         e.printStackTrace();
	      }

	      finally {

	         try {

	            if (soc != null) {

	               soc.close();
	            }

	            if (br != null) {

	               br.close();
	            }
	            if (pw != null) {

	               pw.close();
	            }
	         }

	         catch (Exception e) {

	            e.printStackTrace();
	         }
	      }

	      System.out.println("process ended at " + sdf.format(new Date()));

	      return mav;
	   }
	
	
	
	// 파일 업로드 메소드
	// 파일 이름 형식 'articleNO'_'fileName'.'확장자'
	// 중복파일 이름 형식 'articleNO'_'fileName'('num').'확장자'
	public List<UploadVO> uploadFile(int articleNO, List<String> nameList, MultipartHttpServletRequest request) {

		if (nameList == null) {
			nameList = new ArrayList<String>();
		}

		List<UploadVO> uploadList = new ArrayList<UploadVO>();

		// 첨부 파일 이름을 iterator 형식으로 가져오기
		Iterator<String> fileNames = request.getFileNames();

		// 문의 글 번호에 해당하는 경로 생성
		if (!new File(Path).exists()) {
			new File(Path).mkdirs();
		}

		// 모든 첨부파일에 대해 저장작업
		while (fileNames.hasNext()) {

			// request로부터 파일 이름과 첨부파일 가져오기
			String tagName = fileNames.next();

			System.out.println("파일이름? " + tagName);

			MultipartFile file = request.getFile(tagName);
			String fileName = file.getOriginalFilename();
			int dot = fileName.lastIndexOf("."); // 마지막 .의 인덱스
			int end = fileName.length(); // 파일이름의 총 길이
			String saveFileName = articleNO + "_" + fileName; // 파일의 저장될 이름(글번호_파일이름)
			String name = fileName.substring(0, dot); // 이름은 마지막. 전까지(확장자 제외)
			String extension = fileName.substring(dot, end); // 확장자이름 (예: .txt)

			// 중복된 파일 이름 변경하기
			int i = 1;

			while (nameList.contains(saveFileName)) {
				i += 1;
				saveFileName = articleNO + "_" + name + "(" + i + ")" + extension;
			}

			// 확정된 파일 이름 저장
			nameList.add(saveFileName);

			// 파일 생성위치 지정
			File target = new File(Path, saveFileName);

			// 문의 글 경로에 파일 생성
			try {
				FileCopyUtils.copy(file.getBytes(), target);
			} catch (Exception e) {
				e.printStackTrace();
			}

			UploadVO uploadVO = new UploadVO();
			uploadVO.setArticleNO(articleNO);
			uploadVO.setUploadfile(saveFileName);
			uploadList.add(uploadVO);
		}
		return uploadList;
	}

//	첨부파일 다운로드
	@RequestMapping(value = "/downloadFile.do")
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		System.out.println("Main의 downloadFile 진입");
//		파일 경로
		Resource resource = new FileSystemResource(Path + "\\" + fileName);
		if (!resource.exists())
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);

//		다운로드 이름
		String resourceName = resource.getFilename();

		HttpHeaders headers = new HttpHeaders();
		try { // 한글파일명 인코딩
			String downloadName = null;
			if (userAgent.contains("Trident")) { // internet explore 일 때
				downloadName = URLEncoder.encode(resourceName, "utf-8");
			} else {
				downloadName = new String(resourceName.getBytes("utf-8"), "iso-8859-1");
			}
			// 헤더 설정
			headers.add("content-disposition", "attachment; filename=" + downloadName);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러발생");
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

//	파일 삭제
	public List<UploadVO> deleteFile(List<String> fileList) {

		List<UploadVO> deleteList = new ArrayList<UploadVO>();

		for (String fileName : fileList) {

			File target = new File(Path, fileName);

			try {

				target.delete();
				UploadVO upload = new UploadVO();
				int articleNO = Integer.parseInt(fileName.substring(0, fileName.indexOf('_')));
				upload.setArticleNO(articleNO);
				upload.setUploadfile(fileName);
				deleteList.add(upload);
			}

			catch (Exception e) {

				e.printStackTrace();
			}
		}

		return deleteList;
	}

//	파이썬 자동으로 돌리기 위한 코드
	@Scheduled(cron = "0 37 11 * * *")
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public void test2() {

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		System.out.println("스케줄러 테스트 시간 : " + time);
		try {

			Socket soc = new Socket("192.168.0.37", 9999);
			OutputStream out = soc.getOutputStream();
			PrintWriter pw = new PrintWriter(out);
			InputStream in = soc.getInputStream();
			InputStreamReader isr = new InputStreamReader(in);
			BufferedReader br = new BufferedReader(isr);

			pw.write("스케줄러 시작");
			pw.flush();

			System.out.println(br.readLine());

			pw.close();

		}

		catch (Exception e) {

			e.printStackTrace();
		}

		System.out.println(sdf.format(new Date()) + " 통신 완료");
	}

}