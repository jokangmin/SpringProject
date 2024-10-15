package user.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import user.bean.UserDTO;
import user.bean.UserImagePaging;
import user.bean.UserPaging;
import user.bean.UserUploadDTO;
import user.dao.UserDAO;
import user.service.ObjectStorageService;
import user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserPaging userPaging;
	
	@Autowired
	private UserImagePaging userImagePaging;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ObjectStorageService objectStorageService;
	
	private String bucketName = "bitcamp-9th-bucket-141";
	
	@Override
	public String checkIdAvailability(String id) {
		if(userDAO.checkId(id) == null) {
			return "null";
		}
		else return userDAO.checkId(id);
	}

	@Override
	public void write(UserDTO userDTO) {
		userDAO.write(userDTO);
	}

	@Override
	public Map<String, Object> getUserList(String pg) {
		//1페이지 당 5개
		int endNum = 5;
		int startNum = Integer.parseInt(pg) * 5 - 5;  //테이블의 시작위치 (mysql 0부터 시작)
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		//DB
		List<UserDTO> getUserList = userDAO.getUserList(map);
		
		//paging 처리
		int totalA = userDAO.getTotalA();
		userPaging.setCurrentPage(Integer.parseInt(pg));
		userPaging.setPageBlock(3);
		userPaging.setPageSize(5);
		userPaging.setTotalA(totalA);
		userPaging.makePagingHTML();
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("getUserList", getUserList);
		map2.put("userPaging", userPaging);
		
		return map2;
	}

	@Override
	public void update(UserDTO userDTO) {
		userDAO.update(userDTO);
	}

	@Override
	public void delete(String id) {
		userDAO.delete(id);
	}

	//image upload
	@Override
	public void imageWrite(UserUploadDTO dto) {
		userDAO.imageWrite(dto);
	}

	@Override
	public Map<String, Object> getImageList(String pg) {
		//1페이지 당 5개
		int endNum = 5;
		int startNum = Integer.parseInt(pg) * 5 - 5;  //테이블의 시작위치 (mysql 0부터 시작)
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		//DB
		List<UserUploadDTO> getImageList = userDAO.getImageList(map);
		
		//paging 처리
		int totalB = userDAO.getTotalB();
		userImagePaging.setCurrentPage(Integer.parseInt(pg));
		userImagePaging.setPageBlock(3);
		userImagePaging.setPageSize(5);
		userImagePaging.setTotalA(totalB);
		userImagePaging.makePagingHTML();
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("getImageList", getImageList);
		map2.put("userImagePaging", userImagePaging);
		
		return map2;
	}

	@Override
	public UserUploadDTO getUploadDTO(String seq) {
		
		return userDAO.getUploadDTO(seq);
	}

	@Override
	public void uploadUpdate(UserUploadDTO userUploadDTO, MultipartFile img) {
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		//Object Storage(NCP)는 이미지를 덮어쓰지 않는다.
		//1. DB에서 Seq에 해당하는 imageFileName 을 꺼내와서 Object Storage(NCP)의 이미지를 삭제하고,
		//2. 새로운 이미지를 올린다.
		String imageFileName = userDAO.getImageFileName(userUploadDTO.getSeq());
		System.out.println("imageFileName = " + imageFileName);
		
		//Object Storage(NCP)의 원래 있던 이미지 삭제 1.
		objectStorageService.deleteFile(bucketName,"storage/",imageFileName);
		
		//Object Storage(NCP)에 새로운 이미지 업로드 2.
		imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
		
		String imageOriginalFileName = img.getOriginalFilename();
		File file = new File(filePath, imageOriginalFileName);
		
		try {
			img.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		userUploadDTO.setImageFileName(imageFileName);
		userUploadDTO.setImageOriginalFileName(imageOriginalFileName);
		
		//DB 연결
		userDAO.uploadUpdate(userUploadDTO);		
	}

	@Override
	public void uploadDelete(String seqs) {
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		System.out.println("실제 폴더 = " + filePath);
		
		List<String> seqList = Arrays.asList(seqs.split(","));
		
		String imageFileName = "";
		for(String seq  : seqList) {
			int seqInt = Integer.parseInt(seq);
			imageFileName = userDAO.getImageFileName(seqInt);
			objectStorageService.deleteFile(bucketName,"storage/",imageFileName);
		}
		System.out.println("imageFileName = " + imageFileName);
		
		userDAO.uploadDelete(seqList);
	}

}
