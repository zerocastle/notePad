package com.movie.watch;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.watch.service.MemberService;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		logger.info("인데스 메인 페이지");
		model.addAttribute("authority", request.getAttribute("authority"));
		System.out.println("뭐냐 너" + request.getAttribute("authority"));
		model.addAttribute("page", null);
		return "index";
	}

	// 게시판으로 이동
	@RequestMapping(value = "/move/board", method = RequestMethod.GET)
	public String moveBoard(Model model) {
		logger.info("게시판으로 이동");
		return "/floatSection/board";
	}

	// 게시판 글쓰기입이동
	@RequestMapping(value = "/move/board/register", method = RequestMethod.GET)
	public String moveRegisterBoard(Model model) {
		logger.info("게시판 글쓰기로 이동");
		return "/floatSection/boardRegister";
	}

	// 게시판 회원가입
	@RequestMapping(value = "/move/board/update", method = RequestMethod.GET)
	public String moveUpdateBoard(Model model) {
		logger.info("게시판 수정 이동");
		return "/floatSection/boardUpdate";
	}
}
