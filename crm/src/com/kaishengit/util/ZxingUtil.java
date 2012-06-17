package com.kaishengit.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

public class ZxingUtil {
 private static final int BLACK = 0xFF000000;
 private static final int WHITE = 0xFFFFFFFF;

 @SuppressWarnings({ "unchecked", "rawtypes" })
public static void zxing(String str,String code) throws IOException, WriterException {
	 String picFormat = "png";
	  System.out.println(str.length() + "|str==" + str);
	  String path = "c:/2/" + code;
	  Hashtable hints = new Hashtable();
	  
	   hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
	  BitMatrix bitMatrix = new MultiFormatWriter().encode(str,
	    BarcodeFormat.QR_CODE, 400, 400, hints);
	
	  int width = bitMatrix.getWidth();
	  int height = bitMatrix.getHeight();
	  BufferedImage image = new BufferedImage(width, height,
	    BufferedImage.TYPE_INT_ARGB);
	  for (int x = 0; x < width; x++) {
	   for (int y = 0; y < height; y++) {
	    image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
	   }
	  }
	  File file = new File(path + "." + picFormat);
	  ImageIO.write(image, picFormat, file);
	
	  MatrixToImageWriter.writeToFile(bitMatrix, picFormat, file);
 }
}