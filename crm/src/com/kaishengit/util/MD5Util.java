package com.kaishengit.util;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Util {

	private static final String mykey = "我的密码：";
	public static String getMD5(String pwd){
		String p = DigestUtils.md5Hex(pwd + mykey);
		return p;
	}
}
