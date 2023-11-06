package quanLyNhanSu;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.io.PrintStream;


public class QuanLy {
	protected ArrayList<ConNguoi> danhSachConNguoi;
	protected String tenTapTin;

	public QuanLy(String tenTapTin) {
		this.tenTapTin = tenTapTin;

		DocTapTin doc = new DocTapTin(tenTapTin);
		danhSachConNguoi = doc.docDSConNguoi();
		if(danhSachConNguoi == null)
			danhSachConNguoi = new ArrayList<ConNguoi>();

	}

	public String themMoiNhanSu(ConNguoi conNguoi) {
		danhSachConNguoi.add(conNguoi);
		GhiVaoTapTin ghi = new GhiVaoTapTin(tenTapTin,danhSachConNguoi);
		return ghi.ghiDSConNguoi();
	}

	public void lietKeThongTinNhanSu() {
		if (danhSachConNguoi.size() == 0)
			System.out.println("Không có nhân viên nào");
		else
			for(ConNguoi conNguoi:danhSachConNguoi)
				System.out.println(conNguoi.toString());
	}

	public ArrayList<ConNguoi> timTheoHoTen (String hoTen){
		ArrayList<ConNguoi> ketQua = new ArrayList<ConNguoi>();
		for(ConNguoi conNguoi: danhSachConNguoi)
			if(conNguoi.getTen().contains(hoTen))
				ketQua.add(conNguoi);
		return ketQua;
	}

	public ArrayList<ConNguoi> suaThongTinNhanSu(String maNhanVien) {
		ArrayList<ConNguoi> ketQua = new ArrayList<>();

		for (ConNguoi conNguoi : danhSachConNguoi) {
			if (conNguoi.getMaNhanVien().contains(maNhanVien)) {
				ketQua.add(conNguoi);
				break;
			}
		}
		return ketQua;
	}

	public void xoaNhanSu(String maNhanVien) {
		ArrayList<ConNguoi> ketQua = new ArrayList<ConNguoi>();

		for (ConNguoi conNguoi : danhSachConNguoi) {
			if (conNguoi.getMaNhanVien().contains(maNhanVien)) {
				ketQua.add(conNguoi);
				break;
			}
		}
		if (ketQua.isEmpty()) {
			System.out.println("Không tìm thấy nhân viên " + maNhanVien + ".");
			return;
		}
		danhSachConNguoi.removeAll(ketQua);
		System.out.println("Nhân viên " + maNhanVien + " đã được xóa.");
	}


	public ArrayList<ConNguoi> timKiemTheoMaNhanVien(String maNhanVien) {
		ArrayList<ConNguoi> ketQua = new ArrayList<>();
		for(ConNguoi conNguoi: danhSachConNguoi)
			if(conNguoi.getMaNhanVien().contains(maNhanVien))
				ketQua.add(conNguoi);
		return ketQua;
	}

	public void hienThiKetQuaTimKiem(ArrayList<ConNguoi> ketQua) {
		if (ketQua.size() == 0)
			System.out.println("Không có nhân viên nào");
		else
			for(ConNguoi conNguoi:ketQua)
				System.out.println(conNguoi.toString());
	}

	public ArrayList<ConNguoi> timKiemTheoTen(String ten) {
		ArrayList<ConNguoi> ketQua = new ArrayList<>();
		for(ConNguoi conNguoi: danhSachConNguoi)
			if(conNguoi.getTen().contains(ten))
				ketQua.add(conNguoi);
		return ketQua;
	}

	public void timKiemTheoTen(ArrayList<ConNguoi> ten) {

		if (ten.size() == 0)
			System.out.println("Không có nhân viên nào");
		else
			for(ConNguoi conNguoi:ten)
				System.out.println(conNguoi.toString());
	}
	
	public void lietKeTheoDoiTuong(String doiTuong) {
        ArrayList<ConNguoi> ketQua = new ArrayList<>();
        for (ConNguoi conNguoi : danhSachConNguoi) {
            if (conNguoi instanceof KySu && doiTuong.contains("1")) {
                ketQua.add(conNguoi);
            } else if (conNguoi instanceof CongNhan && doiTuong.contains("2")) {
                ketQua.add(conNguoi);
            } else if (conNguoi instanceof NhanVien && doiTuong.contains("3")) {
                ketQua.add(conNguoi);
            } else if (conNguoi instanceof ThucTapSinh && doiTuong.contains("4")) {
            	ketQua.add(conNguoi);
            } else if (conNguoi instanceof ChuyenGiaNuocNgoai && doiTuong.contains("5")) {
            	ketQua.add(conNguoi);
            }
        }
        if (ketQua.isEmpty()) 
            System.out.println("Không có nhân viên thuộc đối tượng: " + doiTuong);
        else
        	hienThiKetQuaTimKiem(ketQua);
	}
}