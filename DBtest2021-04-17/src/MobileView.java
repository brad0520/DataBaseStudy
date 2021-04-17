import java.util.ArrayList;

// 스마트폰에 데이터 출력
public class MobileView {

	public void printArticles(ArrayList<Article> articles) {
		System.out.println("=== 모바일 출력 ===");
		for(int i = 0; i < articles.size(); i++) {
			System.out.println("제목 : " + articles.get(i).getTitle());
			System.out.println("내용 : " + articles.get(i).getBody());
		}
	}
}
