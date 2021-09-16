package com.atm.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class AtmUtils {
	public static String encodeSHA256(String code) throws NoSuchAlgorithmException {
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] encodedHash = digest.digest(code.getBytes(StandardCharsets.UTF_8));
		return bytesToHex(encodedHash);
	}

	private static String bytesToHex(byte[] hash) {
		StringBuilder hexString = new StringBuilder(2 * hash.length);
		for (byte b : hash) {
			String hex = Integer.toHexString(0xff & b);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}

	public static String concatAllFields(Map<String, String> fields)
			throws UnsupportedEncodingException, NoSuchAlgorithmException {
		// create a list and sort it
		List<String> fieldNames = new ArrayList<>(fields.keySet());
		Collections.sort(fieldNames);
		// create a buffer for the md5 input and add the secure secret first
		StringBuilder sb = new StringBuilder();
		Iterator<String> itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) fields.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				sb.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				sb.append("=");
				sb.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
			}
			if (itr.hasNext()) {
				sb.append("&");
			}
		}
		return sb.toString();
	}
}
