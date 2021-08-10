package lhj.shop.mapper;

import java.util.List;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;
import lhj.shop.domain.Relate;
import lhj.shop.domain.Shop;

public interface MovieMapper {
	public void insertRelate(Relate relate);
	public void insertM(Movie movie);
	public void insertt(Movies movies);
	List<Movies> list();
	List<Movie> listm();
	public void delete();
	public void deletem();
}

