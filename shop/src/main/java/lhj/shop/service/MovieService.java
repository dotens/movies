package lhj.shop.service;

import java.sql.ResultSet;
import java.util.List;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;
import lhj.shop.domain.Ranking;

public interface MovieService {
	public void insertt(String url1);
	List<Movies> list();
	public void delete();
	public void rein(String rein);
	List<Movie> listm();
	public void deletem();
	public void insertd(String url1);
	void reinc(String url);
	List<Ranking> selectR();
	public void insertR(Ranking ranking);
	public void updateR(Ranking ranking);
	Ranking selectR2(Ranking ranking);
}
