package com.kh.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class NaverCafeInfo {
	public static CafeInfo NaverSearch(String search) {
		String input = search;
        String encoded = URLEncoder.encode(input, StandardCharsets.UTF_8);
		String urlString = "https://map.naver.com/v5/api/search?caller=pcweb&query="+encoded+"&type=all&searchCoord=126.92596417903701;37.57652970000011&page=1&displayCount=20&isPlaceRecommendationReplace=true&lang=ko";
		CafeInfo ci = new CafeInfo();
       
        try {
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
                int operationInfoStartIndex = responseData.indexOf("businessHours\":\"") + "businessHours\":\"".length();

	             int operationEndIndex = responseData.indexOf("\"", operationInfoStartIndex);
	             String operationInfo = responseData.substring(operationInfoStartIndex, operationEndIndex);
	             operationInfo = operationInfo.replace("\\n", "\n").replace("\\t", "\t");
	             String[] operation = operationInfo.split("~");
	             String time = "";
	             for(int i=0; i<operation.length;i++) {
	            	 int timeInfo = Integer.parseInt(operation[i].substring(8,12));
	            	 if(timeInfo>2400) {
	            		 if(i==0) {
	            			time = "0" +(String.valueOf(timeInfo-2400)).substring(0,1)
	            					+ ":" +(String.valueOf(timeInfo-2400)).substring(1,3); 
	            			ci.setStartTime(time);
	            		 }else {
	            			time = "0" +(String.valueOf(timeInfo-2400)).substring(0,1)
	            					+ ":" +(String.valueOf(timeInfo-2400)).substring(1,3); 
	            			ci.setOffTime(time);
	            		 }
	            	 }else if(timeInfo>=1200){
	            		 if(i==0) {
		            			time = (String.valueOf(timeInfo)).substring(0,2)
		            					+ ":" +(String.valueOf(timeInfo)).substring(2,4); 
		            			ci.setStartTime(time);
		            		 }else {
		            			time = (String.valueOf(timeInfo)).substring(0,2)
		            					+ ":" +(String.valueOf(timeInfo)).substring(2,4); 
		            			ci.setOffTime(time);
		            		 }
	            		 
	            	 }else{
	            		 if(i==0) {
		            			time ="0" +(String.valueOf(timeInfo)).substring(0,1)
		            					+ ":" +(String.valueOf(timeInfo)).substring(1,3);
		            			ci.setStartTime(time);
		            	 }else {
		            			time = "0" +(String.valueOf(timeInfo)).substring(0,1)
		            					+ ":" +(String.valueOf(timeInfo)).substring(1,3); 
		            			ci.setOffTime(time);
		            	 }
	            	 }
	             }
	             int phoneInfoStartIndex = responseData.indexOf("tel\":\"") + "tel\":\"".length();

	             int phoneEndIndex = responseData.indexOf("\"", phoneInfoStartIndex);
	             String phoneInfo = responseData.substring(phoneInfoStartIndex, phoneEndIndex);
	             phoneInfo = phoneInfo.replace("\\n", "\n").replace("\\t", "\t");
	             ci.setPhone(phoneInfo);
	             
	             
            } else {
                System.out.println("Error: " + responseCode + " - " + connection.getResponseMessage());
            }
            connection.disconnect();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
         return ci;
	}
	
	public static class CafeInfo {
        private String startTime;
        private String offTime;
        private String phone;

        
		public CafeInfo() {
			super();
		}


		public String getStartTime() {
			return startTime;
		}


		public void setStartTime(String startTime) {
			this.startTime = startTime;
		}


		public String getOffTime() {
			return offTime;
		}


		public void setOffTime(String offTime) {
			this.offTime = offTime;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public CafeInfo(String startTime, String offTime, String phone) {
			super();
			this.startTime = startTime;
			this.offTime = offTime;
			this.phone = phone;
		}


		@Override
		public String toString() {
			return "CafeInfo [startTime=" + startTime + ", offTime=" + offTime + ", phone=" + phone + "]";
		}

		
		
        
    }
}
