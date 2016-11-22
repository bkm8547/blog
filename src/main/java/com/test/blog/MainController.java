package com.test.blog;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dao.BoardService;
import com.test.dto.BoardDTO;
import com.test.dto.PagingDTO;
import com.test.dto.UserIpDTO;
import com.test.util.Paging;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Autowired
	BoardService boardService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		return home2(request, model);
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home2(HttpServletRequest request, Model model) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List list = boardService.selectNewsList(page);
		int allCount = boardService.selectAllCount();
		Paging paging = Paging.getInstance();
		PagingDTO dto = paging.getPaging(allCount, page);
		model.addAttribute("paging", dto);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "index";
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String writeForm(HttpServletRequest request, Model model) {
		return "writeForm";
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public void write(BoardDTO dto, HttpServletResponse response, Model model) throws IOException {
		int result = boardService.insertNews(dto);
		if (result > 0)
			System.out.println("insert success!!");
		response.sendRedirect("main.do");
	}

	@RequestMapping(value = "/modForm.do", method = RequestMethod.GET)
	public String modForm(BoardDTO dto, Model model) {
		dto = boardService.selectNews(dto.getNo());
		model.addAttribute("news", dto);
		return "writeForm";
	}

	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public void modify(BoardDTO dto, HttpServletResponse response) throws IOException {
		int result = boardService.updateNews(dto);
		if (result > 0)
			System.out.println("update success");
		else
			System.out.println("update failed");
		response.sendRedirect("main.do");
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deleteForm(BoardDTO dto, Model model) throws IOException {
		model.addAttribute("no", dto.getNo());
		return "deleteForm";
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public void delete(BoardDTO dto, HttpServletResponse response) throws IOException {
		int result = boardService.deleteNews(dto);
		if (result > 0)
			System.out.println("delete success");
		else
			System.out.println("delete failed");
		response.sendRedirect("main.do");
	}

	@RequestMapping(value = "/recommand.do", method = RequestMethod.GET)
		public String recommand(BoardDTO dto, HttpServletRequest request) throws IOException {
			UserIpDTO ipDTO=new UserIpDTO();
			ipDTO.setIp(request.getRemoteAddr());
			ipDTO.setBoard_no(dto.getNo());
			int result=boardService.recommandNews(ipDTO);
			if(result>0){
				System.out.println("recommand success");
				return "recommand";}
			else{
				System.out.println("recommand failed");
				return "";
			}
	}
}
