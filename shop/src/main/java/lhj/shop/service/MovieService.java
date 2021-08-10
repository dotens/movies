package lhj.shop.service;

import java.util.List;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;

public interface MovieService {
	public  void insertt(String url1);
	List<Movies> list();
	public void delete();
	public void rein(String rein);
	List<Movie> listm();
	public void deletem();
	public void insertd(String url1);
	void reinc(String url);

}
