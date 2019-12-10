package com.kh.emfly.resume.model.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.emfly.company.model.vo.Company;
import com.kh.emfly.company.model.vo.CompanyPage;
import com.kh.emfly.resume.model.service.ResumeService;
import com.kh.emfly.resume.model.vo.Resume;
import com.kh.emfly.resume.model.vo.ResumePage;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService rService;

	@RequestMapping("rinsert.do")
	public String resumeInsert(@ModelAttribute Resume r) {
//		@RequestParam("uploadFile") MultipartFile uploadFile,HttpServletRequest request
		System.out.println(r);
//		System.out.println(uploadFile);
//		System.out.println("originName : " + uploadFile.getOriginalFilename());
//		if (uploadFile != null && !uploadFile.isEmpty()) {
//			
//			String renameFileName = saveFile(uploadFile, request);
//			if (renameFileName != null) {
//				r.setOriginName(uploadFile.getOriginalFilename());
//				r.setChangeName(renameFileName);
//			}
//		} else {
//			r.setOriginName("");
//			r.setChangeName("");
//		}
		int result = rService.resumeInsert(r);

		if (result > 0) {
			return "redirect:emplyMyPage1B.me";
		} else {
			// 에러 발생
			return "common/errorPage";
		}
	}
	
	@RequestMapping("searchWorker.co")
	@ResponseBody
	 public List<Resume> ResumeList(@RequestParam(value="reYear", defaultValue="") List<String> reYear,
			 						@RequestParam(value="reGender", defaultValue="") List<String> reGender,
			 						@RequestParam(value="reBirth", defaultValue="") List<String> reBirth,
			 						@RequestParam(value="reSchool", defaultValue="") List<String> reSchool,
			 						@RequestParam(value="reLocation", defaultValue="") List<String> reLocation,
			 						@RequestParam(value="reEmdiv", defaultValue="") List<String> reEmdiv,
			 						@RequestParam(value="reEmploy", defaultValue="") List<String> reEmploy,
			 						@RequestParam(value="reSalary", defaultValue="") List<String> reSalary
			 						) throws Exception
	   {

		      return rService.ResumeList(reYear,reGender,reBirth,reSchool,reLocation,reEmdiv,reEmploy,reSalary);
		      
		      
	   }
	
	@RequestMapping("emplyMenu6Detail.me")
	public ModelAndView ResumeDetail(@RequestParam("reId") int reId,ModelAndView mv) throws Exception {
		Resume r = rService.ResumeDetail(reId);
		ModelAndView mav = new ModelAndView();
		System.out.println("r: " + r);
		if (r != null) {
			mav.setViewName("menu6DetailPage");
			mav.addObject("resume", r);
			
		}

		return mav;
	}

	/*
	public String saveFile(MultipartFile file, HttpServletRequest request) {
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = root + "\\ruploadFiles";
	      
	      File folder = new File(savePath);
	      if(!folder.exists()) {
	         folder.mkdirs();
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
	*/
	
	

}
