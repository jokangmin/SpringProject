package user.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import user.bean.UserDTO;
import user.bean.UserUploadDTO;

public interface UserService {

	public String checkIdAvailability(String id);

	public void write(UserDTO userDTO);

	public Map<String, Object> getUserList(String pg);

	public void update(UserDTO userDTO);

	public void delete(String id);

	public void imageWrite(UserUploadDTO dto);

	public Map<String, Object> getImageList(String pg);

	public UserUploadDTO getUploadDTO(String seq);

	public void uploadUpdate(UserUploadDTO userUploadDTO, MultipartFile img);

	public void uploadDelete(String seqs);
}
 