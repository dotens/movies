package lhj.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lhj.shop.domain.Shop;
import lhj.shop.service.ShopService;
import lhj.shop.service.ShopServiceimpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("shop")
public class ShopController {
	@Setter(onMethod_ = @Autowired)
	private ShopServiceimpl service;
	
	@GetMapping("shop")
	public void musinsa() {
		service.delete();
		String url[]= {
				"https://crewbi.com/app/product/search?q=",
				"https://crewbi.com/app/product/search?q="
		};
		
		
		for(int i=0; i<url.length; i++) {
			service.insert(url[i]);
		}
	}
	
}
