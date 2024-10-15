package user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/user/writeForm", method=RequestMethod.GET)
	public String writeForm() {
		return "user/writeForm";
	}
	
	@RequestMapping(value="/user/checkId", method=RequestMethod.GET)
	@ResponseBody
	public String checkId(@RequestParam String id) {
		return userService.checkIdAvailability(id);
	}
	
	@RequestMapping(value="/user/write", method=RequestMethod.POST)
	@ResponseBody
	public void write(@ModelAttribute UserDTO userDTO) {
		userService.write(userDTO);
	}
	
	@RequestMapping(value="/user/getUserList", method=RequestMethod.GET)
	public String getUserList(@RequestParam(required = false, defaultValue="1") String pg, Model model) {
		Map<String, Object> map2 = userService.getUserList(pg);
		
		map2.put("pg", pg);
		
		model.addAttribute("map2",map2);
		//model.addAttribute("getUserList",map2.get("getUserList"));
		//model.addAttribute("userPaging",map2.get("userPaging"));
		
		return "user/getUserList";
	}
	//ModelAndView
	//ModelMap
	//Model
	//셋 중 하나로 가져가기
	
	@RequestMapping(value="/user/updateForm", method=RequestMethod.GET)
	public String updateForm(@RequestParam String id, @RequestParam int pg, @RequestParam String pwd, @RequestParam String name, Model model) {
		
		model.addAttribute("id", id);
		model.addAttribute("pg", pg);
		model.addAttribute("pwd", pwd);
		model.addAttribute("name", name);
		return "user/updateForm";
	}
	
	@RequestMapping(value="/user/update", method=RequestMethod.POST)
	@ResponseBody
	public void update(@ModelAttribute UserDTO userDTO) {
		userService.update(userDTO);
	}
	
	@RequestMapping(value="/user/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestParam String id) {
		userService.delete(id);
	}
	
}
