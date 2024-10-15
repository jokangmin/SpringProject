package user.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import user.bean.UserUploadDTO;
import user.service.ObjectStorageService;
import user.service.UserService;

@Controller
public class UserUploadController {
	@Autowired
	private UserService userService;
	@Autowired
	private ObjectStorageService objectStorageService;
	
	private String bucketName = "bitcamp-9th-bucket-141";
	
	@RequestMapping(value="/upload/text")
	public String text() {
		return "upload/text";
	}
	
	@RequestMapping(value="/upload/uploadForm")
	public String uploadForm() {
		return "upload/uploadForm";
	}
	
	@RequestMapping(value="/upload/uploadAJaxForm")
	public String uploadAJaxForm() {
		return "upload/uploadAJaxForm";
	}
	
	@RequestMapping(value="/upload/uploadUpdateForm")
	public String uploadUpdateForm(@RequestParam String seq, Model model) {
		UserUploadDTO userUploadDTO = userService.getUploadDTO(seq);
		model.addAttribute("userUploadDTO",userUploadDTO);
		return "upload/uploadUpdateForm";
	}
	
	@RequestMapping(value="/upload/uploadUpdate")
	@ResponseBody
	public String uploadUpdate(@ModelAttribute UserUploadDTO userUploadDTO,
					      @RequestParam("img") MultipartFile img){
		userService.uploadUpdate(userUploadDTO, img);
		return "이미지 수정 완료";
	}
	
	
	@RequestMapping(value="/upload/uploadView")
	public String uploadView(@RequestParam String seq, Model model) {
		UserUploadDTO userUploadDTO = userService.getUploadDTO(seq);
		model.addAttribute("userUploadDTO",userUploadDTO);
		return "upload/uploadView";
	}
	
	@RequestMapping(value="/upload/uploadList", method=RequestMethod.GET)
	public String uploadList(@RequestParam(required = false, defaultValue="1") String pg, Model model) {
		Map<String, Object> map2 = userService.getImageList(pg);
		
		map2.put("pg", pg);
		
		model.addAttribute("map2",map2);
		
		
		return "upload/uploadList";
	}
	
	@RequestMapping(value="/upload/uploadDelete")
	public String uploadDelete(@RequestParam String seqs) {
		System.out.println("seqs = " + seqs);
		userService.uploadDelete(seqs);
		return "redirect:/upload/uploadList";
	}

	
	/*현재 데이터가 한 개만 넘어올 때.
	 * 
	@RequestMapping(value="/upload/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam MultipartFile img,
						 HttpSession session) { //이미지 img 는 없기 때문에 가지고 오기, 스프링 컨테이너를 이용해서 세션값을 불러오기
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		String imageOriginalFileName = img.getOriginalFilename();
		
		File file = new File(filePath, imageOriginalFileName);
		
		try {
			img.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String result = "<span>"+
							"<img src='/spring/storage/" + imageOriginalFileName + "' width='300' height='300'>"+
					    "</span>";
		
		System.out.println("userUploadDTO = " + userUploadDTO.getImageName() + 
				userUploadDTO.getImageContent() + userUploadDTO.getImageFileName() + userUploadDTO.getImageOriginalFileName());
		
		userUploadDTO.setImageOriginalFileName(imageOriginalFileName);
		
		//DB
		
		
		return result;
	}
	*/ 
	/*
	//2개 이상
	@RequestMapping(value="/upload/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam MultipartFile[] img,
						 HttpSession session) { //이미지 img 는 없기 때문에 가지고 오기, 스프링 컨테이너를 이용해서 세션값을 불러오기
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		String imageOriginalFileName;
		File file;
		String result;
		
		//---------------------------
		
		imageOriginalFileName = img[0].getOriginalFilename();
		file = new File(filePath, imageOriginalFileName);
		
		try {
			img[0].transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		result = "<span>"+
							"<img src='/spring/storage/" + imageOriginalFileName + "' width='300' height='300'>"+
					    "</span>";
		
		//---------------------------
		
		imageOriginalFileName = img[1].getOriginalFilename();
		file = new File(filePath, imageOriginalFileName);
		
		try {
			img[1].transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		result += "<span>"+
							"<img src='/spring/storage/" + imageOriginalFileName + "' width='300' height='300'>"+
					    "</span>";
		
		
		//DB
		
		
		return result;
	}
	*/
	
	//1개 또는 여러개 ( 드래그 등 )
	@RequestMapping(value="/upload/upload", method=RequestMethod.POST, produces="text/html; charset=UTF-8") //produces 파일명 공백과 한글을 인식하기 위해서
	@ResponseBody
	public void upload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam("img[]") List<MultipartFile> list, //한번에 하나 혹은 여러 개 가지고오기
						 HttpSession session) {
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		String imageOriginalFileName;
		String imageFileName;
		File file;
		String result = "";
		
		//파일들을 모아서 DB로 보내기
		List<UserUploadDTO> imageUploadList = new ArrayList<>();
		
		for(MultipartFile img  : list) {
			//imageFileName = UUID.randomUUID().toString();
			
			//네이버 클라우드 Object Storage ------------------------------------
			imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
			//---------------------------------------------------------------
			
			
			imageOriginalFileName = img.getOriginalFilename();
			file = new File(filePath, imageOriginalFileName);
			
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			result += "<span>"+
					  "<img src='/spring/storage/" + 
					  //URLEncoder.encode(imageOriginalFileName, "UTF-8") + //이건 공백은 업로드 안된다.
					  imageOriginalFileName + 
					  "' width='300' height='300'>"+
					  "</span>";
			
			//filename get	
			
			
			UserUploadDTO dto = new UserUploadDTO();
			dto.setImageName(userUploadDTO.getImageName());
			dto.setImageContent(userUploadDTO.getImageContent());
			dto.setImageFileName(imageFileName);
			dto.setImageOriginalFileName(imageOriginalFileName);
			
			imageUploadList.add(dto);
			
		}//for
		
		//DB
		for (UserUploadDTO dto : imageUploadList) {
			userService.imageWrite(dto);
        }
		
	}
	
	@RequestMapping(value="/upload/basicupload", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public String basicupload(@ModelAttribute UserUploadDTO userUploadDTO,
						 @RequestParam("img[]") List<MultipartFile> list,
						 HttpSession session) {
		
		//실제폴더
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		String imageOriginalFileName;
		String imageFileName;
		File file;
		String result = "";
		
		//파일들을 모아서 DB로 보내기
		List<UserUploadDTO> imageUploadList = new ArrayList<>();
		
		for(MultipartFile img  : list) {
			imageFileName = UUID.randomUUID().toString();
			
			imageOriginalFileName = img.getOriginalFilename();
			file = new File(filePath, imageOriginalFileName);
			
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			result += "<span>"+
					  "<img src='/spring/storage/" + 
					  //URLEncoder.encode(imageOriginalFileName, "UTF-8") + //이건 공백은 업로드 안된다.
					  imageOriginalFileName + 
					  "' width='300' height='300'>"+
					  "</span>";
			
			//filename get	
			
			
			UserUploadDTO dto = new UserUploadDTO();
			dto.setImageName(userUploadDTO.getImageName());
			dto.setImageContent(userUploadDTO.getImageContent());
			dto.setImageFileName(imageFileName);
			dto.setImageOriginalFileName(imageOriginalFileName);
			
			imageUploadList.add(dto);
			
		}//for
		
		//DB
		for (UserUploadDTO dto : imageUploadList) {
			userService.imageWrite(dto);
        }
		
		return "upload/uploadForm";
		
	}
}
