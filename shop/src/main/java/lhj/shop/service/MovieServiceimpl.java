package lhj.shop.service;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;
import lhj.shop.mapper.MovieMapper;
import lombok.AllArgsConstructor;

@Service
public class MovieServiceimpl implements MovieService {
	
	@Inject
	private MovieMapper mapper;
	
	@Override
	 public void insertt(String url1) {
		String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();
		}catch(IOException ie) {
			System.out.println("io발생 " +ie);
		}
		Elements elements = doc.select("ul.search_list_1");

		for(Element e : elements.select("li")) {
			String img = e.select("img").attr("src");
			System.out.println("이미지는?"+img);
			String filename =img.trim();
			HttpURLConnection conn = null;
			URL imgUrl;
			try {
				imgUrl = new URL(img);
				conn=(HttpURLConnection)imgUrl.openConnection();
				BufferedImage buffImg = ImageIO.read(conn.getInputStream());
				FileOutputStream file = new FileOutputStream(path+filename);
				ImageIO.write(buffImg,"gif",file);
			}catch(IOException ie) {
			}
			//https://movie-phinf.pstatic.net/20210512_139/1620799657168vGIqq_JPEG/movie_image.jpg?type=f67  ><
			String mname = e.select("a>strong").text();
			System.out.println(mname);
		//	int idx = mnam.indexOf(" ");
		//	String mname = mnam.substring(0,idx);
		    String url2 = e.select("a").attr("href");
			String url = ("https://movie.naver.com"+url2);
			
			Movies movies = new Movies(mname,url,filename);
			mapper.insertt(movies);
			
			}	
	}
	@Override
	public void insertd(String url1) {
		System.out.println(url1);
		String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();		
		}catch(IOException ie) {
			System.out.println("io발생 " +ie);
		}
		Elements elements = doc.select("div.sect-chart");	
		for(Element e : elements.select("li")) {	
			String img = e.select("span.thumb-image").attr("src");
			System.out.println("이미지는?"+img);
			String filename =img.trim();
			HttpURLConnection conn = null;
			URL imgUrl;
			try {
				imgUrl = new URL(img);
				conn=(HttpURLConnection)imgUrl.openConnection();
				BufferedImage buffImg = ImageIO.read(conn.getInputStream());
				FileOutputStream file = new FileOutputStream(path+filename);
				ImageIO.write(buffImg,"gif",file);
			}catch(IOException ie) {
			}
			
			String mname = e.select("div.box-contents>a>strong").first().text();
			
			//int idx = mnam.indexOf(" ");
		//	String mname = mnam.substring(0,idx);
			String url2 = e.select("div.box-image>a").attr("href");
			System.out.println("url2"+url2);
			String url = ("http://www.cgv.co.kr"+url2);
			
			Movies movies = new Movies(mname,url,filename);
			mapper.insertt(movies);
	
		}
	}
	@Override
	public List<Movies> list() {
		return mapper.list();
		 
	}

	@Override
	public void delete() {
			mapper.delete();
		
	}
	@Override
	public void rein(String url) {
		List<String> list = new ArrayList<String>();
		String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url).get();
		}catch(IOException ie) {
			System.out.println("io발생 " +ie);
		}
		Elements elements = doc.select("div.article");
		
		String mname = elements.select("h3.h_movie>a").first().text();	
		/*int idx = mnam.indexOf(" ");
		String mname = mnam.substring(0,idx);*/
		String summr = elements.select("p.con_tx").text();
		String summry = summr.substring(0,2000);	
		String starpoint = elements.select("span.st_off").first().text();
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String img  = elements.select("div.poster>a>img").attr("src");
		Elements element = doc.select("div.score>div.score_result");
		String review =  elements.select("li>div.score_reple>p").first().text();
		/*for(Element k : element.select("li")){
			
		String qwe = element.select("div.score_reple>p").text();
		
		
		}*/
		
		/*System.out.println("mname"+mname);
		System.out.println("summry"+summry);
		System.out.println("starpoint"+starpoint);
		System.out.println("img"+img);
		System.out.println("review"+review);
		System.out.println("urll"+urll);
		*/
		
		
		Movie movie = new Movie(mname,summry,starpoint,review,urll,img);
		mapper.insertM(movie);	
	}
	@Override
	public void reinc(String url) {
String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url).get();
		}catch(IOException ie) {
			System.out.println("io발생 " +ie);
		}
		Elements elements = doc.select("div.wrap-movie-detail");
		
		String mname = elements.select("div.box-contents>div.title>strong").first().text();	
		String summry = "asdasd";
		String starpoin = elements.select("div.box-contents>div.score>div.egg-gage.small>span.percent").text();
		String starpoint = ("golden egg :"+starpoin);
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String img  = elements.select("div.box-image>a").attr("href");
		Elements element = doc.select("div.sect-grade");
		System.out.println("element :"+element);
		String review = element.select("div>wrap-persongrade>ul.point_col2>li.screen_spoiler>div.box-comment>p").text();
		System.out.println("mname"+mname);
		System.out.println("summry"+summry);
		
		System.out.println("urll"+urll);
		System.out.println("img"+img);
		
		System.out.println("starpoint"+starpoint);
		System.out.println("review"+review);

//		Movie movie = new Movie(mname,summry,starpoint,review,urll,img);
//		mapper.insertM(movie);
		
	}
	@Override
	public List<Movie> listm() {
		return mapper.listm();
		 
	}
	@Override
	public void deletem() {
		mapper.deletem();
		
	}

	

	
	}
	/*
	  public void insertt(String url1) {
		List<Movies> list = new ArrayList<Movies>();
		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();
		}catch(IOException ie) {
			System.out.println("io발생 " +ie);
		}
		Elements elements = doc.select("ul.search_list_1");

		for(Element e : elements.select("li")) {

		String mname = e.text();
		//첫 스페이스에서 이름 자르기 필요
		String url2 = e.select("a").attr("href");
		String url = ("https://movie.naver.com"+url2);
		Movies movies = new Movies(mname,url);
	
		
		mapper.insertt(movies);
		}
	}*/
	

	
	 


