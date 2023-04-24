package model;

import java.util.Date;

public class ThucPhamDTO {
    private int maThucPham ;
    private String tenThucPham ;
    private String ngaySanXuat;
    private String hanSuDung ;
    private LoaiThucPham loaiThucPham ;
    private String tenLoaiThucPham ;
    private String nhaCungCap;

    public ThucPhamDTO() {
    }

    public ThucPhamDTO(int maThucPham, String tenThucPham, String ngaySanXuat, String hanSuDung, LoaiThucPham loaiThucPham, String nhaCungCap) {
        this.maThucPham = maThucPham;
        this.tenThucPham = tenThucPham;
        this.ngaySanXuat = ngaySanXuat;
        this.hanSuDung = hanSuDung;
        this.loaiThucPham = loaiThucPham;
        this.nhaCungCap = nhaCungCap;
    }

    public String getTenLoaiThucPham() {
        return tenLoaiThucPham;
    }

    public void setTenLoaiThucPham(String tenLoaiThucPham) {
        this.tenLoaiThucPham = tenLoaiThucPham;
    }

    public int getMaThucPham() {
        return maThucPham;
    }

    public void setMaThucPham(int maThucPham) {
        this.maThucPham = maThucPham;
    }

    public String getTenThucPham() {
        return tenThucPham;
    }

    public void setTenThucPham(String tenThucPham) {
        this.tenThucPham = tenThucPham;
    }

    public String getNgaySanXuat() {
        return ngaySanXuat;
    }

    public void setNgaySanXuat(String ngaySanXuat) {
        this.ngaySanXuat = ngaySanXuat;
    }

    public String getHanSuDung() {
        return hanSuDung;
    }

    public void setHanSuDung(String hanSuDung) {
        this.hanSuDung = hanSuDung;
    }

    public LoaiThucPham getLoaiThucPham() {
        return loaiThucPham;
    }

    public void setLoaiThucPham(LoaiThucPham loaiThucPham) {
        this.loaiThucPham = loaiThucPham;
    }

    public String getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(String nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }
}
