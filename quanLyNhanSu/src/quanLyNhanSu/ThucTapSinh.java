package quanLyNhanSu;

public class ThucTapSinh extends ConNguoi {	
	private String nganhHoc ; 
	private String truongHoc;
	
	//Khoi dung
	public ThucTapSinh(String ten, int namSinh, String gioiTinh, String soDienThoai, String nganhHoc, String truongHoc, String maNhanVien, String chucVu) {
		super (ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu);
		this.nganhHoc = nganhHoc;
		this.truongHoc = truongHoc;
	}
	public String getNganhHoc() {
		return nganhHoc;
	}
	public void setNganhHoc(String nganhHoc) {
		this.nganhHoc = nganhHoc; 
	}
	public String getTruongHoc() {
		return truongHoc;
	}
	public void setTruongHoc(String truongHoc) {
		this.truongHoc = truongHoc;
	}
	
	@Override 
	public String toString() {
		return "Thực tập sinh: " + ten + ", " + namSinh + ", " + gioiTinh + ", " + soDienThoai + ", " + nganhHoc + ", " + truongHoc + ", " + maNhanVien + ", " + chucVu ;
	}
}