package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import user.bean.UserDTO;
import user.bean.UserUploadDTO;

@Repository
@Mapper
public interface UserDAO {
	public String checkId(String id);
	public void write(UserDTO userDTO);
	public List<UserDTO> getUserList(Map<String, Integer> map);
	public void update(UserDTO userDTO);
	public void delete(String id);
	public int getTotalA();
	public void imageWrite(UserUploadDTO dto);
	public List<UserUploadDTO> getImageList(Map<String, Integer> map);
	public int getTotalB();
	public UserUploadDTO getUploadDTO(String seq);
	public String getImageFileName(int seq);
	public void uploadUpdate(UserUploadDTO userUploadDTO);
	public void uploadDelete(List<String> seqList);
}
