package lhj.shop.mapper;

import java.sql.ResultSet;
import java.util.List;

import lhj.shop.domain.Movie;
import lhj.shop.domain.Movies;
import lhj.shop.domain.Relate;
import lhj.shop.domain.Shop;

public interface MovieMapper {
	public void insertRelate(Relate relate);
	List<Relate> relate();
	public void insertM(Movie movie);
	public void insertt(Movies movies);
	List<Movies> list();
	List<Movie> listm();
	public void delete();
	public void deletem();
	List<Ranking> selectR();
	public void insertR(Ranking ranking);
	public void updateR(Ranking ranking);
	Ranking selectR2(Ranking ranking);
	public void deleteRelate();
}

