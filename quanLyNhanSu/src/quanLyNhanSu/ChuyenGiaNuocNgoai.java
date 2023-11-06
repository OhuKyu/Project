package quanLyNhanSu;

public class ChuyenGiaNuocNgoai extends ConNguoi{
	private String chuyenNganh;

	//Khoi dung 
	public ChuyenGiaNuocNgoai(String ten, int namSinh, String gioiTinh, String soDienThoai, String chuyenNganh, String maNhanVien, String chucVu) {
		super (ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu);
		this.chuyenNganh=chuyenNganh;
	}
	public String getChuyenNganh() {
		return chuyenNganh;
	}
	public void setChuyenNganh(String chuyenNganh) {
		this.chuyenNganh=chuyenNganh; 
	}

	@Override 
	public String toString() {
		return "Chuyên gia nước ngoài: " + ten + ", " + namSinh + ", " + gioiTinh + ", " + soDienThoai + ", " + maNhanVien + ", " + chucVu + ", " + chuyenNganh; 
	}
}