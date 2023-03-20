package com.semi.learn.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Utility {
	
	public static String dateFormat(Timestamp wdate) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(wdate);
	}
}
