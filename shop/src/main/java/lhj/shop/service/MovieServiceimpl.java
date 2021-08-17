package lhj.shop.service;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;
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
import lhj.shop.domain.Ranking;
import lhj.shop.domain.Relate;
import lhj.shop.mapper.MovieMapper;
import lombok.AllArgsConstructor;

@Service
public class MovieServiceimpl implements MovieService {

	@Inject
	private MovieMapper mapper;

	@Override
	 public void insertt(String url1) { //네이버검색결과
		String path = "C:\\sprin\\upload\\tmp\\movie\\";

		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();
		}catch(IOException ie) {
			System.out.println("insertt: io발생 " +ie);
		}
		Elements elements = doc.select("ul.search_list_1");

		for (Element e : elements.select("li")) {
			String img = e.select("img").attr("src");
			String filename =img.trim();
			HttpURLConnection conn = null;
			URL imgUrl;
			try {
				imgUrl = new URL(img);
				conn = (HttpURLConnection) imgUrl.openConnection();
				BufferedImage buffImg = ImageIO.read(conn.getInputStream());
				FileOutputStream file = new FileOutputStream(path + filename);
				ImageIO.write(buffImg, "gif", file);
			} catch (IOException ie) {
			}
			String mname = e.select("dl>dt>a").text();
		    String url2 = e.select("a").attr("href");
			String url = ("https://movie.naver.com"+url2);
			
			
			if(filename != "") //img가 null이 아닐때 (네이버영화 검색 1페이지에 없는것들 제외)
			{
				String poster = null;
				if(filename.indexOf("?") != -1) //이미지링크에 ? 가 있음 = 영화 전용 포스터가있음
				{
					int idx = filename.indexOf("?");
					poster = filename.substring(0, idx); 

				}
				else // 영화전용 포스터대신 네이버 디폴트이미지일때
				{
					poster = "https://ssl.pstatic.net/static/movie/2011/06/poster_default.gif";
				}
				Movies movies = new Movies(mname,url,poster);
				mapper.insertt(movies);
			}
			

		}
	}

	@Override
	public void insertd(String url1) { //cgv 검색결과
		//System.out.println("insertd: " + url1);
		String path = "C:\\sprin\\upload\\tmp\\movie\\";

		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();		
		}catch(IOException ie) {
			System.out.println("insertd io발생 " +ie);
		}

		
		Elements e1 = doc.select("div.sect-chart>ul>li");
		
		for (Element e2 : e1)
		{
			String curlt = e2.select("div.box-contents>a").attr("href").trim();
			String cname = e2.select("div.box-contents>a>strong.title").text();
			String cimgurl = e2.select("div.box-image>a>span>img").attr("src").trim();
			//첫 스페이스에서 이름 자르기 필요
			//System.out.println("insertd url2"+url2);
			String curl = ("http://www.cgv.co.kr"+curlt);
			String filename = curlt;
			HttpURLConnection conn = null;
			URL imgUrl;
			try {
				imgUrl = new URL(curlt);
				conn=(HttpURLConnection)imgUrl.openConnection();
				BufferedImage buffImg = ImageIO.read(conn.getInputStream());
				FileOutputStream file = new FileOutputStream(path+filename);
				ImageIO.write(buffImg,"gif",file);
			}catch(IOException ie) {
			}
			Movies movies = new Movies(cname,curl,cimgurl);
			
			mapper.insertt(movies);
		}
		
		/*Elements elements = doc.select("ul");
		for(Element e : elements.select("li")) 
		{	
		Elements elements = doc.select("div.sect-chart");	
		for(Element e : elements.select("li")) {	
			String img = e.select("span.thumb-image").attr("src");
			//System.out.println("insertd 이미지는?"+img);
			String filename =img.trim();
			HttpURLConnection conn = null;
			URL imgUrl;
			try {
				imgUrl = new URL(img);
				conn = (HttpURLConnection) imgUrl.openConnection();
				BufferedImage buffImg = ImageIO.read(conn.getInputStream());
				FileOutputStream file = new FileOutputStream(path + filename);
				ImageIO.write(buffImg, "gif", file);
			} catch (IOException ie) {
			}
			
			String mname = e.select("div.box-contents>a>strong").first().text();
			
			//int idx = mnam.indexOf(" ");
		//	String mname = mnam.substring(0,idx);
			String url2 = e.select("div.box-image>a").attr("href");
			//System.out.println("insertd url2"+url2);
			String url = ("http://www.cgv.co.kr"+url2);
			
			Movies movies = new Movies(mname,url,filename);
			
			mapper.insertt(movies);
	
		}*/
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
	public void rein(String url) { //네이버 검색 상세
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
			String r = e.select("a").attr("href");
			String rimg = imgt.trim();
			String rurl = ("https://movie.naver.com"+r);
			Relate relate = new Relate(rtitle,rimg,rurl);
			mapper.insertRelate(relate);
		}
		Elements e3 = doc.select("div.story_area"); //줄거리가 시작되는부분만 따로지정해서 뽑았음
		String sum = e3.select("p.con_tx").text();
		
		String mname = elements.select("h3.h_movie").first().text();	
		//String summry = elements.select("p.con_tx").text();
		String starpoint = "9";
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String imgTemp  = elements.select("div.poster>a>img").attr("src");
		Elements element = doc.select("div.score>div.score_result");
		String review =  elements.select("li>div.score_reple>p").first().text();
		
		int idx = imgTemp.indexOf("?");
		String img = imgTemp.substring(0, idx);

		Movie movie = new Movie(mname,sum,starpoint,review,urll,img);
		mapper.insertM(movie);	
	}

	@Override
	public void reinc(String url) { //cgv 검색 상세
		String path = "C:\\sprin\\upload\\tmp\\movie\\";
		
		Document doc = null;
		try {
			doc= Jsoup.connect(url).get();
		}catch(IOException ie) {
			System.out.println("reinc io발생 " +ie);
		}
		
		Elements e2 = doc.select("div.sect-movielist>ul");
		for(Element e : e2.select("li"))
		{
			String r = e.select("div.box-image>a").attr("href");
			String rurl = ("http://cgv.co.kr"+r).trim();
			String rtitle = e.select("div.box-contents>a>strong").text();
			String rimg = e.select("div.box-image>a>span>img").attr("src").trim();

			Relate relate = new Relate(rtitle,rimg,rurl);
			mapper.insertRelate(relate);
		}
		
		Elements elements = doc.select("div.wrap-movie-detail");
		
		String mname = elements.select("div.box-contents>div.title>strong").first().text();	
		String summry = elements.select("div.sect-story-movie>p").text();
		String starpoin = elements.select("div.box-contents>div.score>div.egg-gage.small>span.percent").text();
		String starpoint = ("golden egg :"+starpoin);
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String img  = elements.select("div.box-image>a").attr("href");
		Elements element = doc.select("div.sect-grade");
		String review = element.select("div>wrap-persongrade>ul.point_col2>li.screen_spoiler>div.box-comment>p").text();

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
	
	@Override
	public Ranking selectR2(Ranking ranking) {
		return mapper.selectR2(ranking);}
	
	@Override
	public List<Ranking> selectR(){
		return mapper.selectR();
	}
	
	@Override
	public void insertR(Ranking ranking) {
		mapper.insertR(ranking);
	}
	
	@Override
	public void updateR(Ranking ranking) {
		mapper.updateR(ranking);
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
	

/*
	

 * public void insertt(String url1) { List<Movies> list = new
 * ArrayList<Movies>(); Document doc = null; try { doc=
 * Jsoup.connect(url1).get(); }catch(IOException ie) {
 * System.out.println("io발생 " +ie); } Elements elements =
 * doc.select("ul.search_list_1");
 * 
 * for(Element e : elements.select("li")) {
 * 
 * String mname = e.text(); //첫 스페이스에서 이름 자르기 필요 String url2 =
 * e.select("a").attr("href"); String url = ("https://movie.naver.com"+url2);
 * Movies movies = new Movies(mname,url);
 * 
 * 
 * mapper.insertt(movies); } }
 */
