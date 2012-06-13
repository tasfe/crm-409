package com.kaishengit.util;

import java.util.UUID;

public class UUIDUTil {

	public static String getUUID(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
}
