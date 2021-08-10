package lhj.shop.service;
 
import java.awt.image.BufferedImage;
import java.io.Console;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Shop;
import lhj.shop.mapper.ShopMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ShopServiceimpl implements ShopService {
	@Setter(onMethod_ = @Autowired)
	private ShopMapper mapper;
	
	public void insert(String url, Movie movie){
		Document doc= null;
		List<Shop> list = new ArrayList<Shop>();
		
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException ie) {
			System.out.println("ie 발생 39"+ ie);
		}
			Elements elements = doc.select("ul.item-list.vertical-list");
		
		
			 Shop shop = new Shop();
			 String name = elements.select("span.product").text(); //String names[] =
			 String price = elements.select("span.price").text();	
			 
			 String url1 = elements.select("li.item-item a").attr("href");
			 shop.setName(name);
			 shop.setPrice(price);
			 shop.setUrl("https://crewbi.com/"+url1);
			 shop.setImg("123123");
			 
			 
			 list.add(shop);
			
	mapper.insert(list);
		
	}

	@Override
	public void delete() {
		mapper.delete();
		
	}

	

	@Override
	public void insert(String url) {
		// TODO Auto-generated method stub
		
	}
	}
