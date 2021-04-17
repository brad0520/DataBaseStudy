import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Addr {
	private int idx;
	private String name;
	private String address;
	private String phone;
	private String regDate;

}
