package com.kaishengit.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	public static String getNow() {
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sf.format(new Date());
	}
	
}
