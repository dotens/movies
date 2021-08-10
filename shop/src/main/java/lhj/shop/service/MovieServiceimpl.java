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
import lhj.shop.domain.Relate;
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
			System.out.println("insertt: io발생 " +ie);
		}
		Elements elements = doc.select("ul.search_list_1");

		for(Element e : elements.select("li")) {
			String img = e.select("img").attr("src");
			System.out.println("insertt 이미지는?"+img);
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
			String mname = e.text();
			//첫 스페이스에서 이름 자르기 필요
			String url2 = e.select("a").attr("href");
			String url = ("https://movie.naver.com"+url2);
			
			Movies movies = new Movies(mname,url,filename);
			mapper.insertt(movies);
			
			}	
	}
	@Override
	public void insertd(String url1) {
		System.out.println("insertd: " + url1);
		String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();		
		}catch(IOException ie) {
			System.out.println("insertd io발생 " +ie);
		}
		Elements elements = doc.select("ul");	
		for(Element e : elements.select("li")) {	
			String img = e.select("span.thumb-image").attr("src");
			System.out.println("insertd 이미지는?"+img);
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
			String mname = e.select("strong.title").text();
			//첫 스페이스에서 이름 자르기 필요
			String url2 = e.select("div.box-image>a").attr("href");
			System.out.println("insertd url2"+url2);
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
	public void deleteRelate() {
		mapper.deleteRelate();
	
}
	@Override
	public void rein(String url) {
		String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url).get();
		}catch(IOException ie) {
			System.out.println("rein io발생 " +ie);
		}
		Elements elements = doc.select("div.article");
		
		Elements e2 = doc.select("ul.thumb_link_mv");
		for(Element e : e2.select("li"))
		{
			//String img = e.select("img").attr("src");
			String rtitle = e.select("a").text();
			String imgt = e.select("img").attr("src");
			String rimg = imgt.trim();
			System.out.println("ENAME: " + rtitle + ", IMG: " + rimg);
			Relate relate = new Relate(rtitle,rimg);
			mapper.insertRelate(relate);
		}
		
		String mname = elements.select("h3.h_movie").first().text();	
		String summry = elements.select("p.con_tx").text();
		String starpoint = "9";
		String review = "asd";
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String img  = elements.select("div.poster>img").attr("src");
		/*System.out.println("mname"+mname);
		System.out.println("summry"+summry);
		System.out.println("starpoint"+starpoint);
		System.out.println("review"+review);
		System.out.println("urll"+urll);
		System.out.println("img"+img);*/
		

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
			System.out.println("reinc io발생 " +ie);
		}
		Elements elements = doc.select("div.wrap-movie-detail");
		
		String mname = elements.select("div.title").first().text();	
		String summry = elements.select("div.sect-story-movie").text();
		String starpoint = "9";
		String review = "asd";
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String img  = elements.select("div.box-image>a").attr("href");
		/*System.out.println("mname"+mname);
		System.out.println("summry"+summry);
		System.out.println("starpoint"+starpoint);
		System.out.println("review"+review);
		System.out.println("urll"+urll);
		System.out.println("img"+img);*/
		
		
		Movie movie = new Movie(mname,summry,starpoint,review,urll,img);
		mapper.insertM(movie);
		
	}
	@Override
	public List<Movie> listm() {
		return mapper.listm();
		 
	}
	@Override
	public void deletem() {
		mapper.deletem();
		
	}
	
	public List<Relate> relate() {
		return mapper.relate();
		 
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
	

	
	 


