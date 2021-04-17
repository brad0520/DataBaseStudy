import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class DBTest {

	public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {
		
		MyBatisDao mdao = new MyBatisDao();
		mdao.getAddresses();
		
		AddrDao dao = new AddrDao(); 
		
		WebView wv = new WebView();
		
		Scanner sc = new Scanner(System.in);
		// 주소록 프로세스
		
		while(true) {
			System.out.println("메뉴를 입력해주세요 :");
			String cmd = sc.nextLine();
			
			if(cmd.equals("list")) {
				ArrayList<Addr> list = dao.getAddrList();
				wv.printAddrs(list);
				
			} else if(cmd.equals("add")) {
				System.out.println("이름 : ");
				String name = sc.nextLine();
				
				System.out.println("주소 : ");
				String address = sc.nextLine();
				
				System.out.println("전화번호 : ");
				String phone = sc.nextLine();
				
				dao.insertAddr(name, address, phone);
			} else if(cmd.equals("delete")) {
				
				System.out.println("삭제할 회원 번호 : ");
				int idx = Integer.parseInt(sc.nextLine());
				dao.deleteAddr(idx);
				
			} else if(cmd.equals("update")) {
				System.out.println("수정할 회원 번호 : ");
				int idx = Integer.parseInt(sc.nextLine());
				
				System.out.println("이름 : ");
				String name = sc.nextLine();
				
				System.out.println("주소 : ");
				String address = sc.nextLine();
				
				System.out.println("전화번호 : ");
				String phone = sc.nextLine();
				
				dao.updateAddr(name, address, phone, idx);
			} else if(cmd.equals("search")) {
				System.out.println("검색할 이름 : ");
				String keyword = sc.nextLine();
				
				ArrayList<Addr> list = dao.searchedList(keyword);
				wv.printAddrs(list);
			}
		}

	}

}
