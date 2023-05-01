package com.kh.common;
import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverScraper {
	public static ArrayList<CafeResult> NaverCafeMenu(String search) {
//		String url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="+search;
		String url = "https://map.naver.com/v5/api/search?caller=pcweb&query="+search+"&type=all&searchCoord=126.92596417903701;37.57652970000011&page=1&displayCount=20&isPlaceRecommendationReplace=true&lang=ko";
		ArrayList<CafeResult> cList = new ArrayList<>();
        Document doc;
		try {
			doc = Jsoup.connect(url).get();
//			Elements items = doc.select(".place_section>div>div>div>div>ul>li");
			
				System.out.println(doc.select(".place_section_content"));
//			for (Element item : items) {
//				CafeResult cr = new CafeResult();
//				cr.setPrice(item.select("div>.CLSES").text());
//				cr.setMenu(item.select("div>span>.A_cdD").text());
//				cList.add(cr);
//				System.out.println(item.select("div>.CLSES").text());
////				System.out.println(item.select("div>span>.A_cdD").text());
//			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return cList;
    }
	
	public static class CafeResult {
        private String menu;
        private String price;
        
		public CafeResult() {
			super();
		}


		public String getMenu() {
			return menu;
		}

		public void setMenu(String menu) {
			this.menu = menu;
		}

		public String getPrice() {
			return price;
		}

		public void setPrice(String price) {
			this.price = price;
		}


		@Override
		public String toString() {
			return "CafeResult [menu=" + menu + ", price=" + price + "]";
		}

        
    }
}
