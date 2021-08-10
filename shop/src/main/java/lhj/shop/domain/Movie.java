package lhj.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Movie {
	private String mname;
	private String summary;
	private String starpoint;
	private String review;
	private String URL;
	private String IMG;

}
