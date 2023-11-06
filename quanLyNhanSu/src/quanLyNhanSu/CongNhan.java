package quanLyNhanSu;

public class CongNhan extends ConNguoi {
	private int bacNghe;
	
    //Khoi dung
    public CongNhan (String ten, int namSinh, String gioiTinh, String soDienThoai, String maNhanVien, String chucVu, int bacNghe) {
    	super (ten, namSinh, gioiTinh, soDienThoai,maNhanVien,chucVu);
    	this.bacNghe= bacNghe;
    }
    public int getBacNghe() {
    	return bacNghe;
    }
    public void setBacNghe(int bacNghe) {
    	this.bacNghe= bacNghe;
    }
    @Override
    public String toString() {
    	return "Công nhân: " + ten + "," + namSinh + "," + gioiTinh + "," + soDienThoai + "," + maNhanVien + ", " + chucVu + ", " + bacNghe;    	
    }
    
}