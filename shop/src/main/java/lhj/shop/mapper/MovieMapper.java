package lhj.shop.mapper;

import java.util.List;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;

public interface MovieMapper {
	public void insertM(Movie movie);
	public void insertt(Movies movies);
	List<Movies> list();
	List<Movie> listm();
	public void delete();
	public void deletem();
}

