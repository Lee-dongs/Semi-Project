package com.kh.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverBlogSearch {
	public static ArrayList<SearchResult> search(String query) throws IOException {
        String url = "https://search.naver.com/search.naver?where=view&sm=tab_jum&query="+query;
        
        Document doc = Jsoup.connect(url).get();
        Elements items = doc.select("._svp_item>div>div>a");
//        System.out.println(items);
        ArrayList<SearchResult> searchResults = new ArrayList<>();
        for (Element item : items) {
            SearchResult searchResult = new SearchResult();
            searchResult.setTitle(item.select("._cross_trigger").text());
            searchResult.setLink(item.select("._cross_trigger").attr("href"));
//            System.out.println(item.select("._cross_trigger").attr("href"));
            searchResults.add(searchResult);
        }
        return searchResults;
    }

    public static class SearchResult {
        private String title;
        private String link;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getLink() {
            return link;
        }

        public void setLink(String link) {
            this.link = link;
        }

		@Override
		public String toString() {
			return "SearchResult [title=" + title + ", link=" + link + "]";
		}
        
    }
}
