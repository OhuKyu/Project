package quanLyNhanSu;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class GhiVaoTapTin {
	private String tenTapTin;
	private ArrayList<ConNguoi> danhSachConNguoi;

	public GhiVaoTapTin(String tenTapTin, ArrayList<ConNguoi> danhSachConNguoi) {
		this.tenTapTin = tenTapTin;
		this.danhSachConNguoi = danhSachConNguoi;
	}

	public String ghiDSConNguoi() {
		try {
			FileOutputStream f = new FileOutputStream(tenTapTin, false);
			ObjectOutputStream o = new ObjectOutputStream(f);
			o.writeObject(danhSachConNguoi);

			o.close();
			f.close();

			return "Đã lưu thành công";
		} catch (Exception e) {
			return "Có lỗi xảy ra. Mã lỗi [01]: " + e.getStackTrace();
		}
	}

}
