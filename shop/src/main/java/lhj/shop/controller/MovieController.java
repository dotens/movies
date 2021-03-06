package lhj.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;
import lhj.shop.domain.Ranking;
import lhj.shop.domain.Relate;
import lhj.shop.service.MovieServiceimpl;
import lhj.shop.service.ShopServiceimpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("movie")
public class MovieController {
	@Setter(onMethod_ = @Autowired)
	private MovieServiceimpl service;
	
	
	@RequestMapping("list")
	public String list() {
		return "movie/list";
	}

	@RequestMapping("search")
	public ModelAndView search(HttpServletRequest request) {
		String url1;
		service.delete();
		String catgo = request.getParameter("catgo");
		String mname = request.getParameter("mname");
		//System.out.println(catgo);
		//System.out.println(mname);
		switch (catgo) {
		case "NAVER":
			url1 = ("https://movie.naver.com/movie/search/result.naver?query=" + mname + "&section=all&ie=utf8");
			service.insertt(url1);
			break;
		case "CGV":
			url1 = ("http://www.cgv.co.kr/search/movie.aspx?query=" + mname);
			service.insertd(url1);
			break;
		}
		Ranking ranking2 = new Ranking(mname, -1);
		//System.out.println("getname : "+ranking2.getMname());
		if(service.selectR2(ranking2)==null) {
			service.insertR(ranking2);
		}
		else {
		service.updateR(ranking2);
		}
		List<Ranking> listR = service.selectR();
		System.out.println("listR () : " +listR);
		List<Movies> list = service.list();
		ModelAndView mv = new ModelAndView("movie/list2", "list", list);
		mv.addObject("listR", listR);

		return mv;

	}

	@RequestMapping("essential")
	   public ModelAndView essential(String url) {
	      service.deletem();
	      service.deleteRelate();
	      int idx = url.indexOf(":");
	      String curl= url.substring(0,idx);
	      if(curl.equals("https")){
	         service.rein(url);
	      } else if (curl.equals("http")) {
	         service.reinc(url);

	      }
	      
	      List<Movie>list =service.listm(); //?????????????????? ?????????????????????????? ?????????????????? DB?????? ????????? modelandview
	      List<Relate> relate = service.relate(); //?????????????????? ?????????????? ???????????? ??????????????????????????????? DB?????? ????????? modelandview
	      
	      ModelAndView mv = new ModelAndView("movie/view","mlist",list);
	      mv.addObject("relate", relate);
	      System.out.println("RELATE: " + relate);
	      //   ArrayList<Object> list3 = new ArrayList<Object>();
	      
	      //   list3.add(list);
	      //list3.add(relate);
	      //ModelAndView mv = new ModelAndView("movie/view","a",list3);
	      return mv;
	   }

}
