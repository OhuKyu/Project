package quanLyNhanSu;

public class KySu extends ConNguoi {
	
    private String chuyenNganh;

    public KySu(String ten, int namSinh, String gioiTinh, String soDienThoai, String maNhanVien, String chucVu, String chuyenNganh) {
        super(ten, namSinh, gioiTinh, soDienThoai, maNhanVien, chucVu);
        this.chuyenNganh = chuyenNganh;
    }

    public String getChuyenNganh() {
        return chuyenNganh;
    }

    public void setChuyenNganh(String chuyenNganh) {
        this.chuyenNganh = chuyenNganh;
    }
    @Override
    public String toString() {
    	return "Kỹ sư: " + ten + "," + namSinh + "," + gioiTinh + "," + soDienThoai + ","+ maNhanVien + ", " + chucVu + ", " + chuyenNganh;
    	
    }
}
