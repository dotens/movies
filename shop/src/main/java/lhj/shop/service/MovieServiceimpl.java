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
	 public void insertt(String url1) { //�꽕�씠踰꾧��깋寃곌낵
		String path = "C:\\sprin\\upload\\tmp\\movie\\";

		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();
		}catch(IOException ie) {
			System.out.println("insertt: io諛쒖깮 " +ie);
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
			
			
			if(filename != "") //img媛� null�씠 �븘�땺�븣 (�꽕�씠踰꾩쁺�솕 寃��깋 1�럹�씠吏��뿉 �뾾�뒗寃껊뱾 �젣�쇅)
			{
				String poster = null;
				if(filename.indexOf("?") != -1) //�씠誘몄�留곹겕�뿉 ? 媛� �엳�쓬 = �쁺�솕 �쟾�슜 �룷�뒪�꽣媛��엳�쓬
				{
					int idx = filename.indexOf("?");
					poster = filename.substring(0, idx); 

				}
				else // �쁺�솕�쟾�슜 �룷�뒪�꽣���떊 �꽕�씠踰� �뵒�뤃�듃�씠誘몄��씪�븣
				{
					poster = "https://ssl.pstatic.net/static/movie/2011/06/poster_default.gif";
				}
				Movies movies = new Movies(mname,url,poster);
				mapper.insertt(movies);
			}
			

		}
	}

	@Override
	public void insertd(String url1) { //cgv 寃��깋寃곌낵
		//System.out.println("insertd: " + url1);
		String path = "C:\\sprin\\upload\\tmp\\movie\\";

		Document doc = null;
		try {
			doc= Jsoup.connect(url1).get();		
		}catch(IOException ie) {
			System.out.println("insertd io諛쒖깮 " +ie);
		}

		
		Elements e1 = doc.select("div.sect-chart>ul>li");
		
		for (Element e2 : e1)
		{
			String curlt = e2.select("div.box-contents>a").attr("href").trim();
			String cname = e2.select("div.box-contents>a>strong.title").text();
			String cimgurl = e2.select("div.box-image>a>span>img").attr("src").trim();
			//泥� �뒪�럹�씠�뒪�뿉�꽌 �씠由� �옄瑜닿린 �븘�슂
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
			//System.out.println("insertd �씠誘몄��뒗?"+img);
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
	public void rein(String url) { //�꽕�씠踰� 寃��깋 �긽�꽭
		String path = "C:\\sprin\\upload\\tmp\\movie\\";

		Document doc = null;
		try {
			doc= Jsoup.connect(url).get();
		}catch(IOException ie) {
			System.out.println("rein io諛쒖깮 " +ie);
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
		Elements e3 = doc.select("div.story_area"); //以꾧굅由ш� �떆�옉�릺�뒗遺�遺꾨쭔 �뵲濡쒖��젙�빐�꽌 戮묒븯�쓬
		String sum = e3.select("p.con_tx").text();
		
		String mname = elements.select("h3.h_movie").first().text();	
		//String summry = elements.select("p.con_tx").text();
		String starpoint = "9";
		String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
		String imgTemp  = elements.select("div.poster>a>img").attr("src");
		Elements element = doc.select("div.score>div.score_result");
		String review =  "";
		
		int idx = imgTemp.indexOf("?");
		String img = imgTemp.substring(0, idx);

		Movie movie = new Movie(mname,sum,starpoint,review,urll,img);
		mapper.insertM(movie);	
	}

	@Override
	   public void reinc(String url) { //cgv 寃��깋 �긽�꽭
	      String path = "C:\\sprin\\upload\\tmp\\movie\\";
	      
	      Document doc = null;
	      try {
	         doc= Jsoup.connect(url).get();
	      }catch(IOException ie) {
	         System.out.println("reinc io諛쒖깮 " +ie);
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
	      String summry = elements.select("div.sect-story-movie").text();
	      String summr = elements.select("div.sect-story-movie>p").text();
	      String starpoin = elements.select("div.box-contents>div.score>div.egg-gage.small>span.percent").text();
	      String starpoint = ("golden egg :"+starpoin);
	      String urll = elements.select("div.end_btn_area>ul>li>a").attr("href");
	      String img  = elements.select("div.box-image>a").attr("href");
	      Elements element = doc.select("div.sect-grade");
	      String review = element.select("div>wrap-persongrade>ul.point_col2>li.screen_spoiler>div.box-comment>p").text();
	         if(summry.equals("")) {
	            Movie movie = new Movie(mname,summr,starpoint,review,urll,img);
	      mapper.insertM(movie);
	         }else {
	            Movie movie = new Movie(mname,summry,starpoint,review,urll,img);
	            mapper.insertM(movie);
	         }
	      
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
			System.out.println("io諛쒖깮 " +ie);
		}
		Elements elements = doc.select("ul.search_list_1");

		for(Element e : elements.select("li")) {

		String mname = e.text();
		//泥� �뒪�럹�씠�뒪�뿉�꽌 �씠由� �옄瑜닿린 �븘�슂
		String url2 = e.select("a").attr("href");
		String url = ("https://movie.naver.com"+url2);
		Movies movies = new Movies(mname,url);
	

/*
	

 * public void insertt(String url1) { List<Movies> list = new
 * ArrayList<Movies>(); Document doc = null; try { doc=
 * Jsoup.connect(url1).get(); }catch(IOException ie) {
 * System.out.println("io諛쒖깮 " +ie); } Elements elements =
 * doc.select("ul.search_list_1");
 * 
 * for(Element e : elements.select("li")) {
 * 
 * String mname = e.text(); //泥� �뒪�럹�씠�뒪�뿉�꽌 �씠由� �옄瑜닿린 �븘�슂 String url2 =
 * e.select("a").attr("href"); String url = ("https://movie.naver.com"+url2);
 * Movies movies = new Movies(mname,url);
 * 
 * 
 * mapper.insertt(movies); } }
 */
