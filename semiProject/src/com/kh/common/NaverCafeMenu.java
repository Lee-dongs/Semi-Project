package com.kh.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;



public class NaverCafeMenu {
		public static ArrayList<CafeMenu> NaverSearch(String search) {
	        ArrayList<CafeMenu> cmList = new ArrayList<>();
	        
	        try {
	        	String input = search;
	        	String encoded = URLEncoder.encode(input, "UTF-8");
	        	String urlString = "https://map.naver.com/v5/api/search?caller=pcweb&query="+encoded+"&type=all&searchCoord=126.92596417903701;37.57652970000011&page=1&displayCount=20&isPlaceRecommendationReplace=true&lang=ko";
	            URL url = new URL(urlString);
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	            connection.setRequestMethod("GET");

	            int responseCode = connection.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) {
	                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	                String inputLine;
	                StringBuffer response = new StringBuffer();
	                while ((inputLine = in.readLine()) != null) {
	                    response.append(inputLine);
	                }
	                in.close();
	                String responseData = response.toString();
	                if(responseData.indexOf("menuInfo\":\"")>0) {
	                int menuInfoStartIndex = responseData.indexOf("menuInfo\":\"") + "menuInfo\":\"".length();
	                
	             int menuInfoEndIndex = responseData.indexOf("\"", menuInfoStartIndex);
	             String menuInfo = responseData.substring(menuInfoStartIndex, menuInfoEndIndex);
	             menuInfo = menuInfo.replace("\\n", "\n").replace("\\t", "\t");
	             String[] items = menuInfo.split("\\|");
	             
	             for (String item : items) {
	            	    String[] parts = item.trim().split(" ");
	            	    CafeMenu cm = new CafeMenu();
	            	    int price = 0;
	            	    String name = "";
	            	    for(int i=0;i<parts.length;i++) {
	            	    	if(parts[i].charAt(1)>=48&&parts[i].charAt(1)<=57||parts[i].charAt(1)==44) {
		            	    	price = Integer.parseInt(parts[i].replace(",",""));
		            	    	cm.setPrice(price);
		            	    	cm.setMenu(name);
		            	    	cmList.add(cm);
	            	    	break;
	            	    	}else {
	            	    		name += parts[i];
	            	    	}
	            	    }
	             }
	            }
	            } else {
	                System.out.println("Error: " + responseCode + " - " + connection.getResponseMessage());
	            }
	            connection.disconnect();
	           
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	         return cmList;
		}
	        
	        public static class CafeMenu {
	            private String menu;
	            private int price;
	            
	    		public CafeMenu() {
	    			super();
	    		}


	    		public String getMenu() {
	    			return menu;
	    		}

	    		public void setMenu(String menu) {
	    			this.menu = menu;
	    		}

	    		public int getPrice() {
	    			return price;
	    		}

	    		public void setPrice(int price) {
	    			this.price = price;
	    		}


	    		@Override
	    		public String toString() {
	    			return "CafeResult [menu=" + menu + ", price=" + price + "]";
	    		}

	            
	        }
	    
}
