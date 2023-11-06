package quanLyNhanSu;

import java.io.Serializable;

public class ConNguoi implements Serializable {
	
	private static final long serialVersionUID = 2L;
	
    protected String ten;
    protected int namSinh;
    protected String gioiTinh;
    protected String soDienThoai;
    protected String maNhanVien;
    protected String chucVu;

    public ConNguoi(String ten, int namSinh, String gioiTinh, String soDienThoai, String maNhanVien, String chucVu) {
        this.ten = ten;
        this.namSinh = namSinh;
        this.gioiTinh = gioiTinh;
        this.soDienThoai = soDienThoai;
        this.maNhanVien = maNhanVien;
        this.chucVu = chucVu;
    }

    public String getTen() {
        return ten;
    }
    
    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getNamSinh() {
        return namSinh;
    }
    
    public void setNamSinh(int namSinh) {
        this.namSinh = namSinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }
    
    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }
    
    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }
    
    public String getChucVu() {
        return chucVu;
    }
    
    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
    }
}
