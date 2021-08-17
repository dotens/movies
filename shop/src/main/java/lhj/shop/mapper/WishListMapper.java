package lhj.shop.mapper;

import java.util.List;

import lhj.shop.domain.WishList;

public interface WishListMapper {
	void insertWish(WishList wishList);
	void deleteWish(WishList wishList);
	List<WishList> selectWish(String id);
}
