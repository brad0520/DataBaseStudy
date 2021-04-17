import java.util.ArrayList;

// 웹브라우저에 데이터 출력
public class WebView {
	
	public void printArticles(ArrayList<Article> articles) {
		System.out.println("=== 웹 출력 ===");
		for(int i = 0; i < articles.size(); i++) {
			System.out.println("제목 : " + articles.get(i).getTitle());
			System.out.println("내용 : " + articles.get(i).getBody());
		}
	}
	
	public void printAddrs(ArrayList<Addr> addrs) {
		for(int i = 0; i < addrs.size(); i++) {
			System.out.println("번호 : " + addrs.get(i).getIdx());
			System.out.println("이름 : " + addrs.get(i).getName());
			System.out.println("주소 : " + addrs.get(i).getAddress());
			System.out.println("전화번호 : " + addrs.get(i).getPhone());
		}
	}
}
