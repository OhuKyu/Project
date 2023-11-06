package quanLyNhanSu;

public class NhanVien extends ConNguoi {
	private String congViecChinh;

	public NhanVien(String ten, int namSinh, String gioiTinh, String soDienThoai, String maNhanVien, String chucVu, String congViecChinh) {
		super(ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu);
		this.congViecChinh = congViecChinh;

	}
	public String getCongViecChinh() {
		return congViecChinh;
	}
	public void setCongViecChinh(String congViecChinh) {
		this.congViecChinh = congViecChinh;
	}

	@Override
	public String toString() {
		return"Nhân viên: " + ten + "," + namSinh + "," + gioiTinh + "," + soDienThoai + ","+ maNhanVien +","+ chucVu + ", " + congViecChinh;
	}

}