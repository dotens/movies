package lhj.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lhj.shop.domain.WishList;
import lhj.shop.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService {
	@Autowired
	private WishListMapper mapper;

	@Override
	public void insertWishS(WishList wishList) {
		mapper.insertWish(wishList);
	}

	@Override
	public void deleteWishS(WishList wishList) {
		mapper.deleteWish(wishList);
	}

	@Override
	public List<WishList> selectWishS(String id) {
		List<WishList> wlist = mapper.selectWish(id);
		return wlist;
	}
}
