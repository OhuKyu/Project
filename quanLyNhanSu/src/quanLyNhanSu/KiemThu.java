package quanLyNhanSu;

import java.util.Scanner;
import java.util.ArrayList;

public class KiemThu { 
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		QuanLy quanLy = new QuanLy("danhSachNV.dat");
		do {
			System.out.println("\nQUẢN LÝ NHÂN SỰ CÔNG TY ABC");
			System.out.println("Nhấn 1: Thêm mới nhân sự");
			System.out.println("Nhấn 2: Liệt kê thông tin nhân sự ");
			System.out.println("Nhấn 3: Tìm kiếm theo họ và tên");
			System.out.println("Nhấn 4: Sửa thông tin nhân sự");
			System.out.println("Nhấn 5: Xóa hồ sơ nhân sự đã thôi việc");
			System.out.println("Nhấn 6: Tìm kiếm theo mã nhân viên");
			System.out.println("Nhấn 7: Tìm kiếm theo tên");
			System.out.println("Nhấn 8: Liệt kê theo đối tượng");
			System.out.println("Nhấn 9: Thoát khỏi chương trình");
			System.out.print("Chọn mục số: ");
			String chon = scanner.nextLine();
			switch (chon.trim()) {
			case "1":{
				System.out.println("\nThêm mới nhân sự");
				System.out.println("Nhấn 1: Thêm mới Kỹ sư");
				System.out.println("Nhấn 2: Thêm mới Công nhân");
				System.out.println("Nhấn 3: Thêm mới Nhân viên");
				System.out.println("Nhấn 4: Thêm mới Chuyên gia nước ngoài");
				System.out.println("Nhấn 5: Thêm mới Thực tập sinh");
				System.out.print("Chọn mục số: ");
				String themMoi =scanner.nextLine();
				switch (themMoi) {
				case "1": {
					System.out.println("\nThêm mới Kỹ sư");
					System.out.print("Nhập tên: ");
					String ten = scanner.nextLine();

					System.out.print("Nhập năm sinh: ");
					int namSinh = scanner.nextInt();
					scanner.nextLine();

					System.out.print("Nhập giới tính: ");
					String gioiTinh = scanner.nextLine();

					System.out.print("Số điện thoại: ");
					String soDienThoai = scanner.nextLine();

					System.out.println("Chức vụ: ");
					String chucVu=scanner.nextLine();

					System.out.println("Mã nhân viên: ");
					String maNhanVien=scanner.nextLine();

					System.out.print("Chuyên ngành: ");
					String chuyenNganh = scanner.nextLine();

					ConNguoi kySu = new KySu(ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu,chuyenNganh);
					quanLy.themMoiNhanSu(kySu);
					System.out.println(kySu.toString());
					break;
				}
				case "2": {
					System.out.println("\nThêm mới Công nhân");
					System.out.print("Nhập tên: ");
					String ten = scanner.nextLine();

					System.out.print("Nhập năm sinh: ");
					int namSinh = scanner.nextInt();
					scanner.nextLine();

					System.out.print("Nhập giới tính: ");
					String gioiTinh = scanner.nextLine();

					System.out.print("Số điện thoại: ");
					String soDienThoai = scanner.nextLine();

					System.out.println("Mã nhân viên: ");
					String maNhanVien=scanner.nextLine();

					System.out.println("Chức vụ: ");
					String chucVu=scanner.nextLine();

					System.out.print("Bậc nghề: ");
					int bacNghe = scanner.nextInt();
					scanner.nextLine();
					ConNguoi congNhan = new CongNhan(ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu,bacNghe);
					quanLy.themMoiNhanSu(congNhan);
					System.out.println(congNhan.toString());
					break;
				}
				case "3": {
					System.out.println("\nThêm mới Nhân Viên");
					System.out.print("Nhập tên: ");
					String ten = scanner.nextLine();

					System.out.print("Nhập năm sinh: ");
					int namSinh = scanner.nextInt();
					scanner.nextLine();

					System.out.print("Nhập giới tính: ");
					String gioiTinh = scanner.nextLine();

					System.out.print("Số điện thoại: ");
					String soDienThoai = scanner.nextLine();

					System.out.println("Mã nhân viên: ");
					String maNhanVien=scanner.nextLine();

					System.out.println("Chức vụ: ");
					String chucVu=scanner.nextLine();

					System.out.print("Công việc chính: ");
					String chuyenNganh = scanner.nextLine();

					ConNguoi nhanVien = new NhanVien(ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu,chuyenNganh);
					quanLy.themMoiNhanSu(nhanVien);
					System.out.println(nhanVien.toString());
					break;
				}

				case "4": {
					System.out.println("\nThêm mới Chuyên gia nước ngoài");
					System.out.print("Nhập tên: ");
					String ten = scanner.nextLine();

					System.out.print("Nhập năm sinh: ");
					int namSinh = scanner.nextInt();
					scanner.nextLine();

					System.out.print("Nhập giới tính: ");
					String gioiTinh = scanner.nextLine();

					System.out.print("Số điện thoại: ");
					String soDienThoai = scanner.nextLine();

					System.out.print("Chuyên ngành: ");
					String chuyenNganh = scanner.nextLine();

					System.out.println("Mã nhân viên: ");
					String maNhanVien=scanner.nextLine();

					System.out.println("Chức vụ: ");
					String chucVu=scanner.nextLine();

					ConNguoi chuyenGiaNuocNgoai = new ChuyenGiaNuocNgoai(ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu,chuyenNganh);
					quanLy.themMoiNhanSu(chuyenGiaNuocNgoai);
					System.out.println(chuyenGiaNuocNgoai.toString());
					break;
				}
				case "5": {
					System.out.println("\nThêm mới Thực tập sinh");
					System.out.print("Nhập tên: ");
					String ten = scanner.nextLine();

					System.out.print("Nhập năm sinh: ");
					int namSinh = scanner.nextInt();
					scanner.nextLine();

					System.out.print("Nhập giới tính: ");
					String gioiTinh = scanner.nextLine();

					System.out.print("Số điện thoại: ");
					String soDienThoai = scanner.nextLine();

					System.out.print("Ngành học: ");
					String nganhHoc = scanner.nextLine();

					System.out.print("Trường học: ");
					String truongHoc = scanner.nextLine();

					System.out.println("Mã nhân viên: ");
					String maNhanVien=scanner.nextLine();

					System.out.println("Chức vụ");
					String chucVu=scanner.nextLine();

					ConNguoi thucTapSinh = new ThucTapSinh(ten,namSinh,gioiTinh,soDienThoai,maNhanVien,chucVu,nganhHoc,truongHoc);
					quanLy.themMoiNhanSu(thucTapSinh);
					System.out.println(thucTapSinh.toString());
					break;
				}
				default:
					System.out.println("Bạn chọn sai.");
					break;
				}
				break;
			}

			case "2": {
				System.out.println("\nLiệt kê thông tin nhân sự");
				quanLy.lietKeThongTinNhanSu();
				break;
			}

			case "3":{
				System.out.println("\nTìm kiếm theo họ tên");
				System.out.println("Nhập họ tên cần tìm: ");
				String hoTen = scanner.nextLine();
				hoTen = hoTen.trim();

				ArrayList <ConNguoi> kq = quanLy.timTheoHoTen(hoTen);
				if(kq.size() == 0)
					System.out.println("Không có nhân sự nào");
				else
					for(ConNguoi conNguoi:kq)
						System.out.println(conNguoi.toString());
				break;
			}

			case "4":{
				System.out.println("\nSửa thông tin nhân sự");
				System.out.println("Nhập mã nhân viên cần sửa: ");
				String maNhanVien = scanner.nextLine();

				ArrayList<ConNguoi> kq = quanLy.suaThongTinNhanSu(maNhanVien);
				if (kq.size() == 0)
					System.out.println("Không có nhân sự nào");
				else {
					for (ConNguoi conNguoi : kq) {
						System.out.println("Mã nhân viên: " + conNguoi.getMaNhanVien());
						System.out.println("Nhấn 1: Sửa tên");
						System.out.println("Nhấn 2: Sửa năm sinh");
						System.out.println("Nhấn 3: Sửa giới tính");
						System.out.println("Nhấn 4: Sửa số điện thoại");
						System.out.println("Nhấn 5: Sửa chức vụ");
						System.out.println("Nhập lựa chọn để sửa thông tin:");

						String chon1 = scanner.nextLine();
						switch (chon1.trim()) {
						case "1":
							System.out.println("Nhập tên mới: ");
							String tenMoi = scanner.nextLine();
							conNguoi.setTen(tenMoi);
							break;
						case "2":
							System.out.println("Nhập năm sinh mới: ");
							int namSinhMoi = Integer.parseInt(scanner.nextLine());
							conNguoi.setNamSinh(namSinhMoi);
							break;
						case "3":
							System.out.println("Nhập giới tính mới: ");
							String gioiTinhMoi = scanner.nextLine();
							conNguoi.setGioiTinh(gioiTinhMoi);
							break;
						case "4":
							System.out.println("Nhập số điện thoại mới: ");
							String soDienThoaiMoi = scanner.nextLine();
							conNguoi.setSoDienThoai(soDienThoaiMoi);
							break;
						case "5":
							System.out.println("Nhập chức vụ mới: ");
							String chucVuMoi = scanner.nextLine();
							conNguoi.setChucVu(chucVuMoi);
							break;
						default:
							System.out.println("Lựa chọn không hợp lệ");
							break;
						}

						System.out.println("Thông tin nhân viên sau khi sửa: ");
						System.out.println(conNguoi.toString());
					}
				}
				break;
			}

			case "5":{
				System.out.println("\nXoá nhân sự:");
				System.out.println("Mã nhân sự cần xoá là: ");
				Scanner Scanner = new Scanner(System.in);
				String maNhanVien = Scanner.nextLine().trim();

				quanLy.xoaNhanSu(maNhanVien);
				break;
			}

			case "6":{
				System.out.println("\nTìm kiếm theo mã nhân viên");
				System.out.println("Nhập mã nhân viên cần tìm: ");
				String maNhanVien = scanner.nextLine();
				maNhanVien = maNhanVien.trim();

				ArrayList<ConNguoi> ketQua = quanLy.timKiemTheoMaNhanVien(maNhanVien);
				quanLy.hienThiKetQuaTimKiem(ketQua);
				break;
			}

			case "7":{
				System.out.println("\nTìm kiếm theo tên");
				System.out.println("Nhập tên cần tìm: ");
				String ten = scanner.nextLine();
				ten = ten.trim();

				ArrayList <ConNguoi> kq = quanLy.timTheoHoTen(ten);
				if(kq.size() == 0)
					System.out.println("Không có nhân sự nào");
				else
					for(ConNguoi conNguoi:kq)
						System.out.println(conNguoi.toString());
				break;
			}
			
			case "8":{
				System.out.println("\nNhập đối tượng cần tìm");
				System.out.println("Nhấn 1: Để liệt kê kỹ sư");
				System.out.println("Nhấn 2: Để liệt kê công nhân");
				System.out.println("Nhấn 3: Để liệt kê nhân viên");
				System.out.println("Nhấn 4: Để liệt kê thực tập sinh");
				System.out.println("Nhấn 5: Để liệt kê chuyên gia nước ngoài");
				System.out.println("Nhập mục số: ");	
                String doiTuong = scanner.nextLine();
                doiTuong = doiTuong.trim();
                
                quanLy.lietKeTheoDoiTuong(doiTuong);
                break;
			}

			case "9":{
				System.out.println("Đã thoát khỏi chương trình.");
				return;
			}
			default:
				System.out.println("Bạn chọn sai. Chỉ được chọn các con số trên");
				continue;
			}
		}while(true);
	}
}