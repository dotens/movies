package lhj.shop.service;

import java.util.List;

import lhj.shop.domain.WishList;

public interface WishListService {
	void insertWishS(WishList wishList);
	void deleteWishS(WishList wishList);
	List<WishList> selectWishS(String id);
}
