package com.kh.emfly.enter.model.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.emfly.enter.model.service.EnterService;
import com.kh.emfly.enter.model.vo.Enter;

@Controller
public class EnterController {

	@Autowired
	private EnterService eService;

	@RequestMapping("einsert.me")
	public String enterInsert(@ModelAttribute Enter e, @RequestParam("uploadFile") MultipartFile uploadFile,
			HttpServletRequest request) {
		System.out.println(e);
		System.out.println(uploadFile);
		System.out.println("originName : " + uploadFile.getOriginalFilename());
		if (uploadFile != null && !uploadFile.isEmpty()) {
			
			String renameFileName = saveFile(uploadFile, request);
			System.out.println("renameFileName: " + renameFileName);
			if (renameFileName != null) {
				e.setOriginName(uploadFile.getOriginalFilename());
				e.setChangeName(renameFileName);
			}
		} else {
			e.setOriginName("");
			e.setChangeName("");
		}
		int result = eService.enterInsert(e);

		if (result > 0) {
			return "redirect:emplyMyPage1A.me";
		} else {
			// 에러 발생
			return "common/errorPage";
		}
	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = root + "\\euploadFiles";
	      
	      File folder = new File(savePath);
	      if(!folder.exists()) {
	         folder.mkdirs();
	         System.out.println("폴더가 생성되지 않았습니다");
	      }else {
	    	 System.out.println("폴더가 생성되었습니다");
	      }
	      
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String originFileName = file.getOriginalFilename();
	      String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
	                        + originFileName.substring(originFileName.lastIndexOf(".") + 1);
	      
	      String renamePath = folder + "\\" + renameFileName;
	      try {
	         file.transferTo(new File(renamePath));
	      } catch (Exception e) {
	         e.printStackTrace();
	      } 
	      
	      return renameFileName;
	   }
	
	
	@RequestMapping("/emplyAdminPage.me")
	public ModelAndView EnterList(ModelAndView mv) throws Exception {
		List<Enter> list = eService.EnterList();

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		if (list != null) {
			map.put("list", list);
			mav.addObject("map", map);
			mav.setViewName("adminPage");
			
		}
		return mav;
	}
	
	@RequestMapping("eupdate.do")
	public String EnterUpdate(HttpServletRequest request,@RequestParam(value="eId",defaultValue="") String eId) throws Exception{
		
		System.out.println("eId:" + eId);
		
		int result = eService.updateMember(eId);
		int result2 = eService.updateEnter(eId);
		
		return "redirect:emplyAdminPage.me";
		}

}
