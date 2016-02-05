package com.mifatest.executers;

import java.security.MessageDigest;

public class Encryptor {
	
	public String inc(String passwd) {
	    StringBuffer sb = new StringBuffer();
	    try {
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        md.reset();
	        md.update(passwd.getBytes());
	        byte[] digest = md.digest();
	        String hex;
	        for (int i=0;i<digest.length;i++){
	            hex =  Integer.toHexString(0xFF & digest[i]);
	            if(hex.length() == 1){hex = "0" + hex;}
	            sb.append(hex);
	        }
	    } catch(Exception ee) {
	               
	    }
	    return sb.toString();
	}
	

}
