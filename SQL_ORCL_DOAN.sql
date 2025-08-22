--I. SET MAC DINH NGAY
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';


--II. TAO CAC TABLE 
/*==============================================================*/
/* Table: CHITIETHD                                             */
/*==============================================================*/
create table CHITIETHD (
   MAHD                 VARCHAR2(10)          not null,
   MASP                 VARCHAR2(10)          not null,
   SOLUONG              NUMBER(2)             not null,
   GIASP                NUMBER(7)             default 0,
   constraint PK_CHITIETHD primary key (MAHD, MASP)
);

/*==============================================================*/
/* Index: CHITIETHD_FK                                          */
/*==============================================================*/
create index CHITIETHD_FK on CHITIETHD (
   MAHD ASC
);

/*==============================================================*/
/* Index: CHITIETHD2_FK                                         */
/*==============================================================*/
create index CHITIETHD2_FK on CHITIETHD (
   MASP ASC
);

/*==============================================================*/
/* Table: DANHMUCSP                                             */
/*==============================================================*/
create table DANHMUCSP (
   MADM                 VARCHAR2(10)          not null,
   TENDM                VARCHAR2(50)          not null,
   STT                  NUMBER(1)             not null,
   constraint PK_DANHMUCSP primary key (MADM)
);

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   MAHD                 VARCHAR2(10)          not null,
   MANV                 VARCHAR2(10)          null,
   MAKH                 VARCHAR2(11)          null,
   NGAYLAPHD            DATE                  default sysdate,
   TRIGIA               NUMBER(9)             default 0,
   TIENPHAITRA          NUMBER(9)             default 0,
   constraint PK_HOADON primary key (MAHD)
);

/*==============================================================*/
/* Index: TAOHD_FK                                              */
/*==============================================================*/
create index TAOHD_FK on HOADON (
   MANV ASC
);

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MAKH                 VARCHAR2(11)          not null,
   HOKH                 VARCHAR2(30)          not null,
   TENLOTKH             VARCHAR2(30),
   TENKH                VARCHAR2(30)          not null,
   GIOITINH             VARCHAR2(4),
   NGSINH               DATE,
   DIACHI               VARCHAR2(150)         not null,
   EMAIL                VARCHAR2(100)         not null,
   DOANHSO              NUMBER(10)            default 0,
   THUHANGKH            NUMBER(1)             default 0,
   constraint PK_KHACHHANG primary key (MAKH)
);

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANV                 VARCHAR2(10)          null,
   HONV                 VARCHAR2(30)          not null,
   TENLOTNV             VARCHAR2(30),
   TENNV                VARCHAR2(30)          not null,
   GIOITINH             VARCHAR2(4)           not null,
   DIACHI               VARCHAR2(150)         not null,
   NGSINH               DATE                  not null,
   EMAIL                VARCHAR2(100)         not null,
   VAITRO               NUMBER(1)             not null,
   NGAYVAOLAM           DATE                  DEFAULT SYSDATE,
   MATKHAU              VARCHAR2(20)          not null,
   AVATAR               BLOB,
   SDT                  VARCHAR2(11)          not null,
   constraint PK_NHANVIEN primary key (MANV)
);

/*==============================================================*/
/* Table: PHIEUGIAOHANG                                         */
/*==============================================================*/
create table PHIEUGIAOHANG (
   MAPGH                VARCHAR2(10)          not null,
   MANV                 VARCHAR2(10)          null,
   MAHD                 VARCHAR2(10)          not null,
   NGAYLAPPGH           DATE                  DEFAULT SYSDATE,
   DIACHIGH             VARCHAR2(100)         not null,
   PHIGH                NUMBER(5)             DEFAULT 0,
   GHICHU               VARCHAR2(50),
   TENKH                VARCHAR2(30)          not null,
   SDT                  VARCHAR2(11)          not null,
   constraint PK_PHIEUGIAOHANG primary key (MAPGH)
);

/*==============================================================*/
/* Index: COPGH_FK                                              */
/*==============================================================*/
create index COPGH_FK on PHIEUGIAOHANG (
   MAHD ASC
);

/*==============================================================*/
/* Index: TAOPGH_FK                                             */
/*==============================================================*/
create index TAOPGH_FK on PHIEUGIAOHANG (
   MANV ASC
);

/*==============================================================*/
/* Table: PHIEUHOANTRA                                          */
/*==============================================================*/
create table PHIEUHOANTRA (
   MAPHT                VARCHAR2(10)          not null,
   MAHD                 VARCHAR2(10)          not null,
   MANV                 VARCHAR2(10)          null,
   MASP                 VARCHAR2(10)          not null,
   NGAYLAPPHT           DATE                  DEFAULT SYSDATE,
   LYDOHT               NUMBER(1)             not null,
   constraint PK_PHIEUHOANTRA primary key (MAPHT)
);

/*==============================================================*/
/* Index: CUASP_FK                                              */
/*==============================================================*/
create index CUASP_FK on PHIEUHOANTRA (
   MASP ASC
);

/*==============================================================*/
/* Index: CUADH_FK                                              */
/*==============================================================*/
create index CUADH_FK on PHIEUHOANTRA (
   MAHD ASC
);

/*==============================================================*/
/* Index: TAOPHT_FK                                             */
/*==============================================================*/
create index TAOPHT_FK on PHIEUHOANTRA (
   MANV ASC
);

/*==============================================================*/
/* Table: SANPHAM                                               */
/*==============================================================*/
create table SANPHAM (
   MASP                 VARCHAR2(10)          not null,
   MADM                 VARCHAR2(10)          not null,
   TENSP                VARCHAR2(50)          not null,
   GIA                  NUMBER(7)             not null,
   CHATLIEU             VARCHAR2(30)          not null,
   NAMSX                NUMBER(4)             not null,
   SLTONKHO             NUMBER(4)             not null,
   MAUSAC               VARCHAR2(15)          not null,
   KICHCO               VARCHAR2(5)           not null,
   AVATAR               BLOB,
   constraint PK_SANPHAM primary key (MASP)
);

/*==============================================================*/
/* Index: THUOCDANHMUC_FK                                       */
/*==============================================================*/
create index THUOCDANHMUC_FK on SANPHAM (
   MADM ASC
);




--III. THEM CAC KHOA NGOAI
alter table CHITIETHD
   add constraint FK_CHITIETH_CHITIETHD_HOADON foreign key (MAHD)
      references HOADON (MAHD);

alter table CHITIETHD
   add constraint FK_CHITIETH_CHITIETHD_SANPHAM foreign key (MASP)
      references SANPHAM (MASP);

alter table PHIEUGIAOHANG
   add constraint FK_PHIEUGIA_COPGH_HOADON foreign key (MAHD)
      references HOADON (MAHD);

alter table PHIEUHOANTRA
   add constraint FK_PHIEUHOA_CUADH_HOADON foreign key (MAHD)
      references HOADON (MAHD);

alter table PHIEUHOANTRA
   add constraint FK_PHIEUHOA_CUASP_SANPHAM foreign key (MASP)
      references SANPHAM (MASP);

alter table SANPHAM
   add constraint FK_SANPHAM_THUOCDANH_DANHMUCS foreign key (MADM)
      references DANHMUCSP (MADM);

alter table PHIEUHOANTRA
   add constraint FK_PHIEUHOA_TAOPHT_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV) ON DELETE SET NULL;

alter table PHIEUGIAOHANG
   add constraint FK_PHIEUGIA_TAOPGH_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV) ON DELETE SET NULL;

alter table HOADON
   add constraint FK_HOADON_TAOHD_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV) ON DELETE SET NULL;



--IV. RANG BUOC TOAN VEN 
---TABLE KHACHHANG
-- R1: Thu hang khach hang chi nhan cac gia tri 0, 1, 2, 3
ALTER TABLE KhachHang
ADD CONSTRAINT CK_KH_ThuHangKH CHECK (ThuHangKH IN (0, 1, 2, 3));
/
-- R2: Truong Gioi tinh trong bang khach hang chi nhan cac gia tri â€œNam ? hoac â€œNu ?
ALTER TABLE KhachHang
ADD CONSTRAINT CK_KH_GioiTinh CHECK (GioiTinh IN ('Nam', 'Nữ'));
/
---TABLE NHANVIEN
-- R3: Truong gioi tinh trong bang NhanVien chi co the nhan gia tri "Nam" hoac "Nu".
ALTER TABLE NhanVien
ADD CONSTRAINT CK_NV_GioiTinh CHECK (GioiTinh IN ('Nam', 'Nữ'));
/
-- R4: Truong VaiTro chi nhan cac gia tri 0, 1 tuong duong voi nhan vien ban hang, nhan vien quan ly.
ALTER TABLE NhanVien
ADD CONSTRAINT CK_NV_VaiTro CHECK (VaiTro IN (0, 1));
/
-- R5: Truong MatKhau trong bang NhanVien phai chua toi thieu 8 ki tu.
ALTER TABLE NhanVien
ADD CONSTRAINT CK_NV_MatKhau CHECK (LENGTH(MatKhau) >= 8);
/
---TABLE SANPHAM
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_SP_SLTONKHO CHECK (SLTONKHO>=0);
/

---TABLE PHIEUHOANTRA
ALTER TABLE PHIEUHOANTRA
ADD CONSTRAINT CK_PHT_LYDOHT CHECK (LYDOHT IN (0, 1));
/





--V. PROCEDURE INSERT + FUNCTION TAO ID
--1. Them mot danh muc san pham voi MaDM duoc tao tu dong tu sequence 
----Tao sequence cho MaDM
CREATE SEQUENCE SEQ_MADM
    START WITH 6
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
/
----Tao Function tra ve MaDM theo dang ('DM01', 'DM02',...)
CREATE OR REPLACE FUNCTION FUNC_GENERATE_MADM
    RETURN VARCHAR2
AS
    v_MaDM VARCHAR2(10);
BEGIN
    SELECT 'DM' || LPAD(seq_MaDM.NEXTVAL, 4, '0') INTO v_MaDM FROM DUAL;
    RETURN v_MaDM;
END;
/
----Tao procedure them danhmucsanpham
CREATE OR REPLACE PROCEDURE PROC_INSERT_DANHMUCSP(
    p_TenDM DANHMUCSP.TenDM%TYPE,
    p_STT DANHMUCSP.STT%TYPE,
    p_output OUT NUMBER
)
AS
BEGIN 
    INSERT INTO DANHMUCSP (
            MaDM, TenDM, STT
        ) VALUES (
            FUNC_GENERATE_MADM, p_TenDM, p_STT
        );
        COMMIT;
	p_output := 1;
        DBMS_OUTPUT.PUT_LINE('Them DANHMUCSANPHAM thanh cong!');
        
        EXCEPTION
        WHEN OTHERS THEN
	p_output := 0;
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them DANHMUCSANPHAM khong thanh cong!');
            
END;
/
--2. Them mot san pham 
----Tao sequence cho MaSP
CREATE SEQUENCE SEQ_MASP
    START WITH 26
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;  
/
----Tao Function tra ve MaSP theo dang ('SP01', 'SP02',...)
CREATE OR REPLACE FUNCTION FUNC_GENERATE_MASP
    RETURN VARCHAR2
AS
    v_MaSP VARCHAR2(10);
BEGIN
    SELECT 'SP' || LPAD(seq_MaSP.NEXTVAL, 4, '0') INTO v_MaSP FROM DUAL;
    RETURN v_MaSP;
END;
/
----Tao procedure them sanpham 
CREATE OR REPLACE PROCEDURE PROC_INSERT_SANPHAM(
    p_TenSP     IN SANPHAM.TenSP%TYPE,
    p_Gia       IN SANPHAM.Gia%TYPE,
    p_ChatLieu  IN SANPHAM.ChatLieu%TYPE,
    p_NamSX     IN SANPHAM.NamSX%TYPE,
    p_SLTonKho  IN SANPHAM.SLTonKho%TYPE,
    p_MauSac    IN SANPHAM.MauSac%TYPE,
    p_KichCo    IN SANPHAM.KichCo%TYPE,
    p_MaDM      IN SANPHAM.MaDM%TYPE,
    p_Avatar    IN SANPHAM.Avatar%TYPE,
    p_output OUT NUMBER
)
AS
BEGIN
        INSERT INTO SANPHAM (
            MaSP, TenSP, Gia, ChatLieu, NamSX, SLTonKho, MauSac, KichCo, Avatar, MaDM
        ) VALUES (
            FUNC_GENERATE_MASP, p_TenSP, p_Gia, p_ChatLieu, p_NamSX, p_SLTonKho, p_MauSac, p_KichCo, p_Avatar, p_MaDM
        );
	p_output := 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Them SANPHAM thanh cong!');
        EXCEPTION
        WHEN OTHERS THEN
	    p_output := 0;
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them SANPHAM khong thanh cong!');
END;
/ 

--3. Them mot HOADON cho khach hang thanh vien
----Tao sequence cho MaHD
CREATE SEQUENCE SEQ_MAHD
    START WITH 61
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;  
/
----Tao Function tra ve MaHD theo dang ('HD01', 'HD02',...)
CREATE OR REPLACE FUNCTION FUNC_GENERATE_MAHD
    RETURN VARCHAR2
AS
    v_MaHD VARCHAR2(10);
BEGIN
    SELECT 'HD' || LPAD(seq_MaHD.NEXTVAL, 4, '0') INTO v_MaHD FROM DUAL;
    RETURN v_MaHD;
END;
/
----Tao procedure them HOADON
CREATE OR REPLACE PROCEDURE PROC_INSERT_HOADON(
    p_MaKH    IN HOADON.MaKH%TYPE,
    p_MaNV    IN HOADON.MaNV%TYPE,
    p_MaHD    IN OUT HOADON.MaHD%TYPE
)
AS
BEGIN
        p_MaHD := FUNC_GENERATE_MAHD;
        INSERT INTO HOADON  (
            MaHD, MaKH, MaNV
        ) VALUES (
            p_MaHD, p_MaKH, p_MaNV
        );

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Them HOADON thanh cong!');
        EXCEPTION
        WHEN OTHERS THEN

            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them HOADON khong thanh cong!');
END;
/
--4. Them mot CHITIETHD
CREATE OR REPLACE PROCEDURE PROC_INSERT_CHITIETHD(
    p_MaHD    IN CHITIETHD.MaHD%TYPE,
    p_MaSP    IN CHITIETHD.MaSP%TYPE,
    p_SoLuong IN CHITIETHD.SoLuong%TYPE,
    p_output OUT NUMBER
)
AS
BEGIN
        INSERT INTO CHITIETHD  (
            MaHD, MaSP, SoLuong
        ) VALUES (
            p_MaHD, p_MaSP, p_SoLuong 
        );
        COMMIT;
	p_output := 1;
        DBMS_OUTPUT.PUT_LINE('Them CTHD thanh cong!');
        EXCEPTION
        WHEN OTHERS THEN
            p_output := 0;
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them CTHD khong thanh cong!');
END;
/
--5. Them nhan vien
----Tao sequence MaNV
    CREATE SEQUENCE SEQ_MANV
    START WITH 16
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;    
/
----Tao Function tra ve MaNV theo dang ('NV01', 'NV02',...)
CREATE OR REPLACE FUNCTION FUNC_GENERATE_MANV
    RETURN VARCHAR2
AS
    v_MaNV NHANVIEN.MaNV%TYPE;
BEGIN
    SELECT 'NV' || LPAD(seq_MaNV.NEXTVAL, 4, '0') INTO v_MaNV FROM DUAL;
    RETURN v_MaNV;
END;
/
----Them mot NHANVIEN
CREATE OR REPLACE PROCEDURE PROC_INSERT_NHANVIEN(
    p_HoNV       IN NhanVien.HoNV%TYPE,
    p_TenLotNV   IN NhanVien.TenLotNV%TYPE,
    p_TenNV      IN NhanVien.TenNV%TYPE,
    p_GioiTinh   IN NhanVien.GioiTinh%TYPE,
    p_DiaChi     IN NhanVien.DiaChi%TYPE,
    p_NgSinh     IN NhanVien.NgSinh%TYPE,
    p_Email      IN NhanVien.Email%TYPE,
    p_SDT        IN NhanVien.SDT%TYPE,
    p_VaiTro     IN NhanVien.VaiTro%TYPE,
    p_Avatar     IN NhanVien.Avatar%TYPE,
    p_output     OUT NUMBER
)
AS
BEGIN
        INSERT INTO NHANVIEN (
            MaNV, HoNV, TenLotNV, TenNV, GioiTinh, DiaChi, NgSinh, Email, SDT, VaiTro, MatKhau, Avatar  
        ) VALUES (
            FUNC_GENERATE_MANV, p_HoNV, p_TenLotNV, p_TenNV, p_GioiTinh, p_DiaChi, p_NgSinh, p_Email, p_SDT, p_VaiTro, DBMS_RANDOM.STRING('A', 8), p_Avatar     
        );
        p_output := 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Them NHANVIEN va tai khoan cho NHANVIEN thanh cong!');
        
        EXCEPTION
        WHEN OTHERS THEN
            p_output := 0;
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them NHANVIEN va tai khoan cho NHANVIEN khong thanh cong!');
END;
/
--6. Them KHACHHANG 
CREATE OR REPLACE PROCEDURE PROC_INSERT_KHACHHANG(
    p_MaKH     IN KhachHang.MaKH%TYPE,
    p_HoKH     IN KhachHang.HoKH%TYPE,
    p_TenLotKH IN KhachHang.TenLotKH%TYPE,
    p_TenKH    IN KhachHang.TenKH%TYPE,
    p_GioiTinh IN KhachHang.GioiTinh%TYPE,
    p_DiaChi   IN KhachHang.DiaChi%TYPE,
    p_NgSinh   IN KhachHang.NgSinh%TYPE,
    p_Email    IN KhachHang.Email%TYPE,
    p_output OUT NUMBER
)
AS
BEGIN 
        INSERT INTO KHACHHANG(
            MaKH, HoKH, TenLotKH, TenKH, GioiTinh, NgSinh, DiaChi, Email
        ) VALUES (
            p_MaKH, p_HoKH, p_TenLotKH, p_TenKH, p_GioiTinh, p_NgSinh, p_DiaChi, p_Email   
        );
	p_output := 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Them KHACHHANG thanh cong!');
        
        EXCEPTION
        WHEN OTHERS THEN
            p_output := 0;
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them KHACHHANG khong thanh cong!');
END;
/
--7. Them PHIEUGIAOHANG 
----Tao sequence MaPGH
    CREATE SEQUENCE SEQ_MAPGH
    START WITH 6
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;    
/
----Tao Function tra ve MaPGH theo dang ('PGH01', 'PGH02',...)
CREATE OR REPLACE FUNCTION FUNC_GENERATE_MAPGH
    RETURN VARCHAR2
AS
    v_MaPGH PHIEUGIAOHANG.MaPGH%TYPE;
BEGIN
    SELECT 'PGH' || LPAD(seq_MaPGH.NEXTVAL, 4, '0') INTO v_MaPGH FROM DUAL;
    RETURN v_MaPGH;
END;
/
----Them mot PHIEUGIAOHANG
CREATE OR REPLACE PROCEDURE PROC_INSERT_PHIEUGIAOHANG(
    p_MaHD     IN PHIEUGIAOHANG.MaHD%TYPE,
    p_MaNV     IN PHIEUGIAOHANG.MaNV%TYPE,
    p_DiaChiGH IN PHIEUGIAOHANG.DiaChiGH%TYPE,
    p_GhiChu   IN PHIEUGIAOHANG.GhiChu%TYPE,
    p_TenKH    IN PHIEUGIAOHANG.TenKH%TYPE,  
    p_SDT      IN PHIEUGIAOHANG.SDT%TYPE,
    p_output OUT NUMBER
)
AS
BEGIN 

        INSERT INTO PHIEUGIAOHANG(
            MaPGH, MaHD, MaNV, DiaChiGH, GhiChu, TenKH, SDT
        ) VALUES (
            FUNC_GENERATE_MAPGH, p_MaHD, p_MaNV, p_DiaChiGH, p_GhiChu, p_TenKH, p_SDT    
        );
	p_output := 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Them PHIEUGIAOHANG thanh cong!');
        
        EXCEPTION
        WHEN OTHERS THEN
            p_output := 0;
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Them PHIEUGIAOHANG khong thanh cong!');
END;
/
--8. Them PHIEUHOANTRA 
----Tao sequence MaPHT
    CREATE SEQUENCE SEQ_MaPHT
    START WITH 3
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;    
/
----Tao Function tra ve MaPGH theo dang ('PHT01', 'PHT02',...)
CREATE OR REPLACE FUNCTION FUNC_GENERATE_MAPHT
    RETURN VARCHAR2
AS
    v_MaPHT PHIEUHOANTRA.MaPHT%TYPE;
BEGIN
    SELECT 'PHT' || LPAD(seq_MaPHT.NEXTVAL, 4, '0') INTO v_MaPHT FROM DUAL;
    RETURN v_MaPHT;
END;
/
----Them mot PHIEUHOANTRA
CREATE OR REPLACE PROCEDURE PROC_INSERT_PHIEUHOANTRA(
    p_MaHD     IN PHIEUHOANTRA.MaHD%TYPE,
    p_MaNV     IN PHIEUHOANTRA.MaNV%TYPE,
    p_MaSP     IN PHIEUHOANTRA.MaSP%TYPE,
    p_LyDoHT   IN PHIEUHOANTRA.LyDoHT%TYPE, 
    p_output OUT NUMBER
)
AS
BEGIN 
        INSERT INTO PHIEUHOANTRA(
            MaPHT, MaHD, MaNV, MaSP, LyDoHT
        ) VALUES (
            FUNC_GENERATE_MAPHT, p_MaHD, p_MaNV, p_MaSP, p_LyDoHT   
        );

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Them PHIEUHOANTRA thanh cong!');
        p_output := 1;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
             p_output :=0;
            DBMS_OUTPUT.PUT_LINE('Them PHIEUHOANTRA khong thanh cong!');
END;
/
--9. Kiem tra dang nhap
CREATE OR REPLACE PROCEDURE PROC_KTRA_DANGNHAP(
    V_MATK NHANVIEN.MANV%TYPE,
    MK NHANVIEN.MATKHAU%TYPE,
    P_output OUT NUMBER,
    V_VAITRO OUT NUMBER
    )
IS 
V_MATKHAU NHANVIEN.MATKHAU%TYPE;
BEGIN 
    
    SELECT MATKHAU, VAITRO INTO V_MATKHAU, V_VAITRO 
    FROM NHANVIEN
    WHERE MANV = V_MATK;
    
    IF(V_MATKHAU = MK) THEN 
    P_output := 1; 
    
    ELSE
    P_output := 0;
    END IF;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
        P_output := 2;
END;
/
--10. Proc kiem tra thoi han hoan tra
CREATE OR REPLACE PROCEDURE PROC_KTRA_THOIHAN_HOANTRA (
	p_MAHD IN HOADON.MAHD%TYPE,
    	p_KTRA OUT NUMBER
)
IS

    p_KHOANGCACH NUMBER;
    p_NGAYBD DATE;

BEGIN

    SELECT NGAYLAPHD INTO p_NGAYBD
    FROM HOADON
    WHERE MAHD = p_MAHD;
    
    p_KHOANGCACH := TRUNC(SYSDATE) - TRUNC(p_NGAYBD);
    
    IF(p_KHOANGCACH <= 7)
    THEN 
        p_KTRA := 1;
        DBMS_OUTPUT.PUT_LINE('Thoi gian hoan tra hop le!');
    ELSE 
         p_KTRA := 0;
         DBMS_OUTPUT.PUT_LINE('Thoi gian hoan tra khong hop le!');
    END IF;  
    
END;
/

--11. Proc xoa khach hang
CREATE OR REPLACE PROCEDURE PROC_XOA_KHACHHANG (
	p_MAKH IN VARCHAR2,
	p_output OUT NUMBER
)
IS
BEGIN

    UPDATE HOADON
    SET MAKH = NULL
    WHERE MAKH = p_MAKH;

    DELETE FROM KHACHHANG
    WHERE MAKH = p_MAKH;
    p_output := 1;
    COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
	p_output := 0;
        DBMS_OUTPUT.PUT_LINE('Khong the xoa khach hang');
        ROLLBACK; 
END;
/
--12. Proc thong ke hoa don
CREATE OR REPLACE PROCEDURE PROC_COUNT_HOADON (
    p_trigiass1 IN HOADON.TriGia%TYPE,
    p_trigiass2 IN HOADON.TriGia%TYPE,
    num_HD OUT NUMBER,
    cur_HD OUT SYS_REFCURSOR
)
AS
    v_HD HOADON%ROWTYPE;
BEGIN
    --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    -- Xem so luong hoa don cÃ³ TRIGIA trong khoang
    SELECT COUNT(*) INTO num_HD
    FROM HOADON
    WHERE (p_trigiass1 IS NULL OR TRIGIA >= p_trigiass1)
      AND (p_trigiass2 IS NULL OR TRIGIA <= p_trigiass2);
    
    DBMS_OUTPUT.PUT_LINE('So luong hoa don: ' || num_HD);
    
    -- Doi mot khoang thoi gian mo phong tinh huong chÆ¡
    DBMS_SESSION.SLEEP(5);
    
    -- Mo cursor va gan cho tham so OUT cur_HD
    OPEN cur_HD FOR
        SELECT *
        FROM HOADON
        WHERE (p_trigiass1 IS NULL OR TRIGIA >= p_trigiass1)
          AND (p_trigiass2 IS NULL OR TRIGIA <= p_trigiass2);
                   
    --Duyet va in ra cac hoa don thoa dieu kien (Mo phong trong oracle)
    --LOOP
        --FETCH cur_HD INTO v_HD;
        --EXIT WHEN cur_HD%NOTFOUND;
        --DBMS_OUTPUT.PUT_LINE('Ma hoa don: ' || v_HD.MAHD || ', Tri gia: ' || v_HD.TRIGIA);
    --END LOOP;

    -- Ket thuc transaction
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Co loi xay ra trong thu tuc PROC_COUNT_HOADON');
END;
/
--13. Proc update so luong ton kho cua san pham
CREATE OR REPLACE PROCEDURE PROC_UP_SLTONKHO (
    p_MASP IN VARCHAR2,
    p_SLNew IN NUMBER,
    p_output OUT NUMBER
)
AS
    v_SLTonKho NUMBER;
BEGIN
    BEGIN
        -- Kiểm tra xem sản phẩm có tồn tại không và khóa dòng để cập nhật
        SELECT SLTonKho INTO v_SLTonKho
        FROM SanPham
        WHERE MaSP = p_MASP
        FOR UPDATE NOWAIT; -- Sử dụng NOWAIT để tránh deadlock
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        	DBMS_OUTPUT.PUT_LINE('Sản phẩm không tồn tại');
        	RETURN;
        WHEN OTHERS THEN
        	IF SQLCODE = -54 THEN -- ORA-00054: resource busy and acquire with NOWAIT specified or timeout expired
            	DBMS_OUTPUT.PUT_LINE('Dòng dữ liệu đang bị khóa bởi giao dịch khác, thử lại sau.');
        	ELSIF SQLCODE = -1013 THEN -- ORA-01013: user requested cancel of current operation
            	DBMS_OUTPUT.PUT_LINE('Người dùng đã hủy bỏ thao tác hiện tại.');
        	ELSE
            	DBMS_OUTPUT.PUT_LINE('Lỗi khi khóa dòng: ' || SQLERRM);
        	END IF;
        	RETURN;
    END;
 
    -- Cập nhật số lượng tồn kho mới
    BEGIN
        UPDATE SanPham
        SET SLTonKho = p_SLNew
        WHERE MaSP = p_MASP;
        p_output := 1;
        -- Commit để áp dụng các thay đổi vào cơ sở dữ liệu
        COMMIT;
 
        -- In ra thông báo cập nhật thành công
        DBMS_OUTPUT.PUT_LINE('Cập nhật số lượng tồn kho thành công cho sản phẩm ' || p_MASP);
    EXCEPTION
        WHEN OTHERS THEN
            p_output := 0;
        	ROLLBACK; -- Rollback thay đổi nếu có lỗi
        	DBMS_OUTPUT.PUT_LINE('Lỗi khi cập nhật số lượng tồn kho: ' || SQLERRM);
    END;
END;
/





--VI. FUNCTION
--1. Ham tinh tri gia hoa don cua mot hoa don dua tren gia san pham va so luong trong chi tiet hoa don.
CREATE OR REPLACE FUNCTION TINH_HD_TRIGIA(p_MaHD IN HoaDon.MaHD%TYPE)
RETURN NUMBER 
IS
    v_TriGia NUMBER ;
BEGIN
    v_TriGia := 0;
    
    SELECT SUM (GiaSP * SoLuong) INTO v_TriGia
    FROM ChiTietHD
    WHERE MaHD = p_MaHD;

    IF v_TriGia IS NULL THEN
        v_TriGia := 0;
    END IF;
    RETURN v_TriGia;
END TINH_HD_TRIGIA;
/

--2. Ham tinh phi giao hang cua mot phieu giao hang dua tren ma phieu giao hang duoc truyen vao trong phieu giao hang.
CREATE OR REPLACE FUNCTION TINH_PGH_PHIGH (p_DiaChiGH IN PHIEUGIAOHANG.DiaChiGH%TYPE) 
RETURN NUMBER
IS
    v_PhiGH NUMBER := 0;
BEGIN
    IF INSTR(p_DiaChiGH, 'TP.HCM') > 0 THEN
        v_PhiGH := 20000;
    ELSE
        v_PhiGH := 40000;
    END IF;
    
    RETURN v_PhiGH;
END TINH_PGH_PHIGH;
/

--3. Ham tinh giam gia cua mot khach hang dua tren thu hang khach hang trong khach hang.
CREATE OR REPLACE FUNCTION TINH_KH_UUDAI (p_ThuHangKH IN KHACHHANG.THUHANGKH%TYPE) 
RETURN NUMBER
IS
    v_UuDai NUMBER;
BEGIN
    CASE p_ThuHangKH
        WHEN 1 THEN
            v_UuDai := 0.05; 
        WHEN 2 THEN
            v_UuDai := 0.15; 
        WHEN 3 THEN
            v_UuDai := 0.25; 
        ELSE
            v_UuDai := 0; 
    END CASE;

    RETURN v_UuDai;
END;
/

--4. Ham tinh tong tien phai tra cua mot hoa don dua tren tri gia hoa don, phi giao hang va giam gia tinh tu thu hang khach hang.
CREATE OR REPLACE FUNCTION TINH_HD_TIENPHAITRA (p_MaHD IN HOADON.MAHD%TYPE)
RETURN NUMBER
IS
    v_TriGia NUMBER;
    v_PhiGH NUMBER;
    v_UuDai NUMBER;
    v_TienPhaiTra NUMBER;
BEGIN
    v_TriGia := TINH_HD_TRIGIA(p_MaHD);
    
    SELECT TINH_PGH_PHIGH(GH.DiaChiGH) INTO v_PhiGH
    FROM PhieuGiaoHang GH JOIN HoaDon HD ON GH.MaHD = HD.MaHD
    WHERE HD.MAHD = p_MaHD;   
    
    SELECT TINH_KH_UUDAI(K.THUHANGKH) INTO v_UuDai
    FROM HOADON H JOIN KHACHHANG K ON H.MAKH = K.MAKH
    WHERE H.MAHD = p_MaHD;
    
    v_TienPhaiTra := v_TriGia + v_PhiGH - v_UuDai * (v_TriGia + v_PhiGH);

    IF v_TienPhaiTra IS NULL THEN
        v_TienPhaiTra := 0;
    END IF;

    RETURN v_TienPhaiTra;
END TINH_HD_TIENPHAITRA;
/

--5. Ham tinh tong doanh so tu mot khach hang.
CREATE OR REPLACE FUNCTION TINH_KH_DOANHSO(p_MaKH IN KHACHHANG.MAKH%TYPE) 
RETURN NUMBER
IS
    v_DoanhSo NUMBER := 0;
BEGIN
    SELECT SUM(H.TienPhaiTra) INTO v_DoanhSo
    FROM HoaDon H
    WHERE H.MaKH = p_MaKH;

    IF v_DoanhSo IS NULL THEN
        v_DoanhSo := 0;
    END IF;

    RETURN v_DoanhSo;
END TINH_KH_DOANHSo;
/

--6. Ham tinh tong doanh so ban hang cua mot nhan vien ban hang.
CREATE OR REPLACE FUNCTION TINH_NV_DOANHTHU(p_MaNV IN VARCHAR2) 
RETURN NUMBER 
IS
    v_DoanhThu NUMBER := 0;
BEGIN
    SELECT SUM(TienPhaiTra) INTO v_DoanhThu
    FROM HoaDon
    WHERE MaNV = p_MaNV;

    RETURN v_DoanhThu;
END TINH_NV_DOANHTHU;
/

--7. Ham tinh tong so hoa don cua mot nhan vien ban hang.
CREATE OR REPLACE FUNCTION TINH_NV_SOHD(p_MaNV IN VARCHAR2) 
RETURN NUMBER 
IS
    v_SoHD NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_SoHD
    FROM HoaDon
    WHERE MaNV = p_MaNV;

    RETURN v_SoHD;
END TINH_NV_SOHD;
/




--VII. TRIGGER

--1. Kiem tra nhan vien cua cua hoa don la nhan vien ban hang khi co hoa don moi duoc them vao hoac cap nhat
--R8
CREATE OR REPLACE TRIGGER Trg_CK_HD_MaNV
BEFORE INSERT OR UPDATE ON HoaDon
FOR EACH ROW
WHEN (NEW.MANV IS NOT NULL) 
DECLARE
    v_VaiTro NUMBER;
BEGIN
    SELECT VaiTro INTO v_VaiTro
    FROM NhanVien
    WHERE MaNV = :NEW.MaNV;

    IF v_VaiTro != 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'MaNV trong HoaDon phai la Nhan vien ban hang.');
    END IF;
END;
/

--2. Kiem tra nhan vien cua phieu hoan tra la nhan vien ban hang khi co phieu hoan tra moi duoc them vao hoac cap nhat
--R13
CREATE OR REPLACE TRIGGER Trg_CK_PHT_MaNV
BEFORE INSERT OR UPDATE ON PhieuHoanTra
FOR EACH ROW
WHEN (NEW.MANV IS NOT NULL) 
DECLARE
    v_VaiTro NUMBER;
BEGIN
    SELECT VaiTro INTO v_VaiTro
    FROM NhanVien
    WHERE MaNV = :NEW.MaNV;

    IF v_VaiTro != 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'MaNV trong PhieuHoanTra phai la nhan vien ban hang.');
    END IF;
END;
/

--3. Kiem tra nhan vien cua phieu giao hang la nhan vien ban hang khi co phieu giao hang moi duoc them vao hoac cap nhat
--R16
CREATE OR REPLACE TRIGGER Trg_CK_PGH_MaNV
BEFORE INSERT OR UPDATE ON PhieuGiaoHang
FOR EACH ROW
WHEN (NEW.MANV IS NOT NULL) 
DECLARE
    v_VaiTro NUMBER;
BEGIN
    SELECT VaiTro INTO v_VaiTro
    FROM NhanVien
    WHERE MaNV = :NEW.MaNV;

    IF v_VaiTro != 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'MaNV trong PhieuGiaoHang phai la nhan vien ban hang.');
    END IF;
END;
/

--4. Cap nhat so luong ton kho cua san pham sau khi co chi tiet hoa don duoc them vao
CREATE OR REPLACE TRIGGER Trg_UP_SP_CTHD_SLTonKho
BEFORE INSERT ON ChiTietHD
FOR EACH ROW
BEGIN 
    UPDATE SANPHAM 
    SET SLTonKho = SLTonKho - :NEW.SoLuong
    WHERE MaSP = :NEW.MaSP;
END;
/

--5. Them gia san pham vao chi tiet hoa don va cap nhat tri gia v  tien phai tra cua hoa don sau khi co chi tiet hoa don moi duoc them vao hoac duoc cap nhat
create or replace TRIGGER TRG_IN_CTHD
BEFORE INSERT ON ChiTietHD
FOR EACH ROW
DECLARE 
    v_UuDai NUMBER;
    v_ThuHang NUMBER;
    v_PhiGH NUMBER;
    v_TriGia NUMBER(11,3);
    v_DiaChi VARCHAR(50);
    v_MaHD VARCHAR2(10);
    v_MaSP VARCHAR2(10);
    v_MaKH VARCHAR2(10);
    v_DoanhThu NUMBER;
    v_TienPhaiTra NUMBER;
    v_TienPhaiTraCu NUMBER;
BEGIN
    v_MaHD := :NEW.MaHD;
    v_MaSP := :NEW.MaSP;
    
    --Cap nhat giasp trong cthd
    SELECT GIA INTO :NEW.GIASP
    FROM SanPham
    WHERE MaSP = v_MaSP;

    --Cap nhat trigia trong hoa don    
    UPDATE HoaDon
    SET TriGia = TriGia + (:NEW.SoLuong * :NEW.GIASP)
    WHERE MaHD = v_MaHD;

    --Lay Tri gia Hoa don
    SELECT TriGia, TienPhaiTra INTO v_TriGia, v_TienPhaiTraCu
    FROM HoaDon
    WHERE MaHD = v_MaHD;

    --T nh uu dai
    BEGIN
        SELECT ThuHangKH INTO v_ThuHang
        FROM KhachHang JOIN HoaDon ON KhachHang.MaKH = HoaDon.MaKH
        WHERE HoaDon.MaHD = :NEW.MaHD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_ThuHang := 0;
    END;

    v_UuDai := TINH_KH_UUDAI(v_ThuHang);
    
    BEGIN
        SELECT PhieuGiaoHang.DiaChigh INTO v_DiaChi
        FROM HoaDon JOIN PhieuGiaoHang ON HoaDon.MaHD = PhieuGiaoHang.MaHD
        WHERE HoaDon.MaHD = :NEW.MaHD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_PhiGH := 0;
    END;
    
    IF(v_DiaChi IS NOT NULL) THEN
        v_PhiGH := TINH_PGH_PHIGH(v_DiaChi);
    END IF;
    
    v_TienPhaiTra := (1 - v_UuDai) * (v_TriGia + v_PhiGH);

    --Cap nhat tien phai tra
    UPDATE HoaDon
    SET TienPhaiTra = v_TienPhaiTra
    WHERE MaHD = v_MaHD;
    
    BEGIN
        SELECT KhachHang.DoanhSo, KhachHang.MaKH INTO v_DoanhThu, v_MaKH
        FROM HoaDon JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH
        WHERE HoaDon.MaHD = v_MaHD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_MaKH := NUll;
    END;
        
    IF(v_MaKH IS NOT NULL) THEN    
        UPDATE KhachHang
        SET DoanhSo = v_DoanhThu - v_TienPhaiTraCu + v_TienPhaiTra
        WHERE MaKH = v_MaKH;
    END IF;
END;
/


--6. Cap nhat phi giao hang cua phieu giao hang va tong tien hoa don sau khi co phieu giao hang moi duoc them vao hoac duoc cap nhat
CREATE OR REPLACE TRIGGER TRG_UP_PGH
BEFORE INSERT OR UPDATE ON PhieuGiaoHang
FOR EACH ROW
DECLARE
    v_UuDai NUMBER;
    v_TienPhaiTra NUMBER;
    v_TienPhaiTraCu NUMBER;
    v_ThuHang NUMBER;
    v_TriGia NUMBER;
    v_MaHD VARCHAR2(10);
    v_MaSP VARCHAR2(10);
    v_MaKH VARCHAR2(10);
    v_DoanhThu NUMBER;
BEGIN
    BEGIN
        SELECT ThuHangKH INTO v_ThuHang
        FROM KhachHang JOIN HoaDon ON KhachHang.MaKH = HoaDon.MaKH
        WHERE HoaDon.MaHD = :NEW.MaHD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_ThuHang := 0;
    END;

    v_UuDai := TINH_KH_UUDAI(v_ThuHang);

    BEGIN
        SELECT TriGia, TienPhaiTra INTO v_TriGia, v_TienPhaiTraCu
        FROM HoaDon
        WHERE MaHD = :NEW.MaHD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_TriGia := 0;
            v_TienPhaiTraCu := 0;
    END;

    IF :NEW.DiaChiGH IS NULL THEN
        :NEW.PhiGH := 0;
    ELSE
        :NEW.PhiGH := TINH_PGH_PHIGH(:NEW.DiaChiGH);
    END IF;

    v_TienPhaiTra := (1 - v_UuDai) * (v_TriGia + :NEW.PhiGH);

    UPDATE HoaDon
    SET TienPhaiTra = v_TienPhaiTra
    WHERE MaHD = :NEW.MaHD;

    BEGIN
        SELECT KhachHang.DoanhSo, KhachHang.MaKH INTO v_DoanhThu, v_MaKH
        FROM HoaDon JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH
        WHERE HoaDon.MaHD = :NEW.MaHD;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_DoanhThu := 0;
            v_MaKH := NULL;
    END;

    IF(v_MaKH IS NOT NULL) THEN
        UPDATE KhachHang
        SET DoanhSo = v_DoanhThu - v_TienPhaiTraCu + v_TienPhaiTra
        WHERE MaKH = v_MaKH;
    END IF;
END;
/
--7. Cap nhat thu hang khach hang dua tren doanh so khach hang
create or replace TRIGGER Trg_UP_ThuHangKH
BEFORE UPDATE ON KhachHang
FOR EACH ROW
DECLARE
    v_DoanhThu NUMBER;
    v_MaKH VARCHAR2(10);
    v_ThuHang NUMBER;
BEGIN
    v_MaKH := :NEW.MaKH;

    -- Tinh tong doanh thu cua khach
    v_DoanhThu := :NEW.DoanhSo;

    -- Xac dinh thu hang dua tren doanh thu
    IF v_DoanhThu >= 50000000 THEN
        v_ThuHang := 3; -- Hang kim cuong
    ELSIF v_DoanhThu >= 10000000 THEN
        v_ThuHang := 2; -- Hang vang
    ELSIF v_DoanhThu >= 5000000 THEN
        v_ThuHang := 1; -- Hang bac
    ELSE v_ThuHang := 0; -- Chua co thu hang
    END IF;

    -- Cap nhat thu hang khach

    :NEW.ThuHangKH := v_ThuHang;
END;
/

--8. Cap nhat lai tri gia va tien phai tra cua hoa don sau khi xoa mot chi tiet hoa don tuong ung
CREATE OR REPLACE TRIGGER Trg_UP_HD_TriGia_TienPhaiTra_DEL_ChiTietHD
BEFORE DELETE ON ChiTietHD
FOR EACH ROW
DECLARE 
    v_UuDai NUMBER;
    v_ThuHang NUMBER;
    v_TriGia NUMBER(11,3);
    v_MaHD VARCHAR2(10);
BEGIN
    v_MaHD := :OLD.MaHD;
    
    -- Cap nhat tri gia trong hoa don
    UPDATE HoaDon
    SET TriGia = TriGia - (:OLD.SoLuong * :OLD.GiaSP)
    WHERE MaHD = v_MaHD;
    
    -- Lay tri gia hoa don sau khi cap nhat
    SELECT TriGia INTO v_TriGia
    FROM HoaDon
    WHERE MaHD = v_MaHD;
    
    -- Tinh uu dai
    SELECT ThuHangKH INTO v_ThuHang
    FROM KhachHang JOIN HoaDon ON KhachHang.MaKH = HoaDon.MaKH
    WHERE HoaDon.MaHD = v_MaHD;
    
    v_UuDai := TINH_KH_UUDAI(v_ThuHang);
    
    -- Cap nhat tien phai tra
    UPDATE HoaDon
    SET TienPhaiTra = v_TriGia - v_UuDai * v_TriGia
    WHERE MaHD = v_MaHD;
END;
/

--9. Cap nhat so luong san pham ton kho dua vao ly do hoan tra
CREATE OR REPLACE TRIGGER Trg_UP_SP_PHT_SLTonKho
AFTER INSERT OR UPDATE ON PhieuHoanTra
FOR EACH ROW
DECLARE
    v_LyDoHT VARCHAR2(50);
BEGIN
    -- Luu gia tri LYDOHT cua dong vua duoc chen vao hoac cap nhat vao bien cuc bo
    v_LyDoHT := :NEW.LYDOHT;

    -- Kiem tra va cap nhat so luong ton kho
    IF v_LyDoHT = '0' THEN
        -- Neu tra hang, tang so luong ton kho len 1
        UPDATE SanPham
        SET SLTonKho = SLTonKho + 1
        WHERE MaSP = :NEW.MaSP;
    ELSIF v_LyDoHT = '1' THEN
        -- Neu doi hang vi san pham loi, giam so luon ton kho di 1
        UPDATE SanPham
        SET SLTonKho = SLTonKho - 1
        WHERE MaSP = :NEW.MaSP;
    END IF;
END;
/

--10. Giam so luong san pham trong chi tiet hoa don khi co phieu hoan tra them vao
CREATE OR REPLACE TRIGGER Trg_Up_ChiTietHD_SoLuong
AFTER INSERT ON PhieuHoanTra
FOR EACH ROW
DECLARE
    v_NewSoLuong INT;
BEGIN
    -- Giam so luong san pham trong chi tiet hoa don khi co phieu hoan tra them vao voi ly do 'Khong muon mua nua, tra hang'
    IF :NEW.LYDOHT = '0' THEN
        UPDATE ChiTietHD
        SET SoLuong = SoLuong - 1
        WHERE MaHD = :NEW.MaHD AND MaSP = :NEW.MaSP;
    END IF;

    -- Kiem tra va xoa chi tiet hoa don neu so luong san pham tro thanh 0
    SELECT SoLuong INTO v_NewSoLuong
    FROM ChiTietHD
    WHERE MaHD = :NEW.MaHD AND MaSP = :NEW.MaSP;

    IF v_NewSoLuong = 0 THEN
        DELETE FROM ChiTietHD
        WHERE MaHD = :NEW.MaHD AND MaSP = :NEW.MaSP;
    END IF;
END;
/

--11. Cap nhat lai tri gia, tien phai tra va doanh so khi co phieu hoan tra duoc them vao voi ly do 'Khong muon mua nua, tra hang'
create or replace TRIGGER Trg_In_Pht
AFTER INSERT ON PHIEUHOANTRA
FOR EACH ROW
DECLARE
    v_giasp CHITIETHD.GIASP%TYPE;
    v_UuDai NUMBER;
    v_ThuHang NUMBER;
    v_PhiGH NUMBER;
    v_TriGia NUMBER(11,3);
    v_TriGiaCu NUMBER(11,3);
    v_DiaChi VARCHAR(50);
    v_MaHD VARCHAR2(10);
    v_MaSP VARCHAR2(10);
    v_MaKH VARCHAR2(10);
    v_DoanhThu NUMBER;
    v_TienPhaiTra NUMBER;
    v_TienPhaiTraCu NUMBER;
BEGIN
    v_MaHD := :NEW.MAHD;
    IF :NEW.LYDOHT = '0' THEN --Khong muon mua nua, tra hang
        -- Lay gia va so luon san pham tu CHITIETHD
        SELECT GIASP INTO v_giasp
        FROM CHITIETHD
        WHERE MAHD = v_MaHD AND MASP = :NEW.MASP;

        SELECT TRIGIA INTO v_TriGiaCu
        FROM HOADON
        WHERE MAHD = v_MaHD;

        v_TriGia := v_TriGiaCu - 0.9 * v_giasp;

        UPDATE HOADON
        SET TRIGIA = v_TriGia
        WHERE MAHD = v_MaHD;
        
        --Lay Tri gia Hoa don
        SELECT TienPhaiTra INTO v_TienPhaiTraCu
        FROM HoaDon
        WHERE MaHD = v_MaHD;
        
        --Tinh uu dai
        BEGIN
            SELECT ThuHangKH INTO v_ThuHang
            FROM KhachHang JOIN HoaDon ON KhachHang.MaKH = HoaDon.MaKH
            WHERE HoaDon.MaHD = v_MaHD;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_ThuHang := 0;
        END;

        v_UuDai := TINH_KH_UUDAI(v_ThuHang);

        BEGIN
            SELECT PhieuGiaoHang.DiaChigh INTO v_DiaChi
            FROM HoaDon JOIN PhieuGiaoHang ON HoaDon.MaHD = PhieuGiaoHang.MaHD
            WHERE HoaDon.MaHD = v_MaHD;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_PhiGH := 0;
        END;

        IF(v_DiaChi IS NOT NULL) THEN
            v_PhiGH := TINH_PGH_PHIGH(v_DiaChi);
        END IF;

        v_TienPhaiTra := (1 - v_UuDai) * (v_TriGia + v_PhiGH);

        --Cap nhat tien phai tra
        UPDATE HoaDon
        SET TienPhaiTra = v_TienPhaiTra
        WHERE MaHD = v_MaHD;

        BEGIN
            SELECT KhachHang.DoanhSo, KhachHang.MaKH INTO v_DoanhThu, v_MaKH
            FROM HoaDon JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH
            WHERE HoaDon.MaHD = v_MaHD;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_MaKH := NUll;
        END;

        IF(v_MaKH IS NOT NULL) THEN    
            UPDATE KhachHang
            SET DoanhSo = v_DoanhThu - v_TienPhaiTraCu + v_TienPhaiTra
            WHERE MaKH = v_MaKH;
        END IF;
    END IF;
END;
/



   
--VIII. INSERT DU LIEU
--TABLE NHANVIEN
INSERT INTO NHANVIEN VALUES (
   'NV0001', 'Nguyễn', 'Hoàng',
   'Long', 'Nam', 'Quận 1, TP.HCM', '25-05-1990', 'nguyenhoanglong@gm.uit.vn',
   '1', '27-09-2020', DBMS_RANDOM.STRING('A', 8), '', '01234567890');
INSERT INTO NHANVIEN VALUES (
   'NV0002', 'Nguyễn', 'Hoàng',
   'Anh', 'Nam', 'Quận 2, TP.HCM', '24-05-1994', 'nguyenhoangl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01345065981');
INSERT INTO NHANVIEN VALUES (
   'NV0003', 'Nguyễn', 'Nam',
   'Tuấn', 'Nam', 'Quận Tân Bình, TP.HCM', '02-05-1993', 'nguyenhogl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01270652311'); 
INSERT INTO NHANVIEN VALUES (
   'NV0004', 'Nguyễn', 'Anh',
   'Dung', 'Nam', 'Quận Tân Bình, TP.HCM', '24-02-1990', 'ngnhoangl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01270659651'); 
INSERT INTO NHANVIEN VALUES (
   'NV0005', 'Lâm', 'Anh',
   'Minh', 'Nam', 'Quận Tân Bình, TP.HCM', '24-03-1996', 'nguyenh23l@gm.uit.vn',
   '0', '02-09-2021', DBMS_RANDOM.STRING('A', 8), '', '0121287811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0006', 'Lê', 'Bình',
   'An', 'Nam', 'Quận Tân Phú, TP.HCM', '14-07-1990', 'nguyenho2gl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01270659811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0007', 'Trần', 'Anh',
   'Danh', 'Nam', 'Quận Tân Bình, TP.HCM', '24-02-1990', 'nguyen123l@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01246659811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0008', 'Nguyễn', 'Minh',
   'Ng ?c', 'Nữ', 'Quận 12, TP.HCM', '24-01-1998', 'nguyenminhl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01223659811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0009', 'Nguyễn', 'Thị',
   'Nam Anh', 'Nữ', 'Quận Tân Bình, TP.HCM', '24-02-1990', 'nguyenhoangl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01256759811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0010', 'Nguyễn', 'Nhật',
   'Vy', 'Nữ', 'Quận Tân Bình, TP.HCM', '24-02-1990', 'nguyenhoangl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01350659811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0011', 'Lê', 'Tiểu',
   'Nhi', 'Nữ', 'Quận Tân Bình, TP.HCM', '24-02-1990', 'nguyenhoangl@gm.uit.vn',
   '0', '28-09-2021', DBMS_RANDOM.STRING('A', 8), '', '01340659811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0012', 'Trần', 'Bảo',
   'Thy', 'Nữ', 'Quận 10, TP.HCM', '24-02-1990', 'nguyenthygl@gm.uit.vn',
   '0', '28-04-2020', DBMS_RANDOM.STRING('A', 8), '', '01000659811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0013', 'Nguyễn', 'Thúy',
   'Liễu', 'Nữ', 'Quận 6, TP.HCM', '24-01-1990', 'nguyenthuyl@gm.uit.vn',
   '0', '28-05-2022', DBMS_RANDOM.STRING('A', 8), '', '01272354811'); 
INSERT INTO NHANVIEN VALUES (
   'NV0014', 'Hoàng', 'Mai',
   'Thy', 'Nữ', 'Quận 7, TP.HCM', '24-02-1990', 'nguye123oangl@gm.uit.vn',
   '0', '05-07-2023', DBMS_RANDOM.STRING('A', 8), '', '01270652431'); 
INSERT INTO NHANVIEN VALUES (
   'NV0015', 'Trần', 'Thị',
   'Hồng', 'Nữ', 'Quận 5, TP.HCM', '24-02-2000', 'nguyenhabcgl@gm.uit.vn',
   '0', '25-05-2022', DBMS_RANDOM.STRING('A', 8), '', '01270654561'); 
/

--TABLE KHACHHANG
INSERT INTO KHACHHANG VALUES (
   '0328172505', 'Nguyễn', 'Thị',
   'Loan', 'Nữ','12-07-2000', 'Quận 2, TP.HCM', 'loannguyenl@gm.uit.vn', 0, 0); 
INSERT INTO KHACHHANG VALUES (
   '0309172505', 'Trần', 'Thị',
   'Mai', 'Nữ','24-08-2001', 'Quận 7, TP.HCM', 'maihabcgl@gm.uit.vn', 0, 0); 
INSERT INTO KHACHHANG VALUES (
   '0980172505', 'Lê', 'Thị',
   'Nguyệt', 'Nữ','26-01-2003', 'Quận 8, TP.HCM', 'lehabcgl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '087572505', 'Trần', 'Mỹ',
   'Lan', 'Nữ','25-03-2002', 'Quận 12, TP.HCM', 'tranhabcgl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '0328098505', 'Trần', 'Thu',
   'Trang', 'Nữ','14-02-2000', 'Quận Bình Tân, TP.HCM', 'nguyenhabcgl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '0396567505', 'Lê', 'Thu',
   'Thảo', 'Nữ','24-05-1998', 'Quận Bình Chánh, TP.HCM', 'dohabcgl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '09809098705', 'Trần', 'Bá',
   'Kiệt', 'Nam','25-02-1999', 'Quận Củ Chi, TP.HCM', 'nguyenhabcgl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '0325172504', 'Nguyễn', 'Anh',
   'Hào', 'Nam','08-02-2005', 'Quận 7, TP.HCM', 'nguyenhagl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '0328179872', ' ?inh', 'Hảo',
   'Tâm', 'Nam','20-02-2004', 'Quận 12, TP.HCM', 'dinnhabcgl@gm.uit.vn', 0, 0);
INSERT INTO KHACHHANG VALUES (
   '0828178705', 'Bùi', 'Gia',
   'Hồng', 'Nam','20-11-2000', 'Quận 8, TP.HCM', 'buihabcgl@gm.uit.vn', 0, 0);
/
    

--TABLE DANHMUCSP
INSERT INTO DANHMUCSP VALUES (
   'DM0001', 'Áo' ,1);
INSERT INTO DANHMUCSP VALUES (
   'DM0002', 'Quần' ,2);
INSERT INTO DANHMUCSP VALUES (
   'DM0003', 'Áo khoác' ,3);
INSERT INTO DANHMUCSP VALUES (
   'DM0004', 'Balo' ,4);
INSERT INTO DANHMUCSP VALUES (
   'DM0005', 'Túi' ,5);
/

--TABLE SANPHAM
INSERT INTO SANPHAM VALUES (
   'SP0001','DM0001', ' Áo baby tee màu trắng cơ bản', '350000', 'Cotton 100%', '2023', 100, 'Trắng', 'M', '');
INSERT INTO SANPHAM VALUES (
   'SP0002','DM0001', ' Áo thun đen simpson', '350000', 'Vải 100%', '2022', 100, ' đen', 'M', '');   
INSERT INTO SANPHAM VALUES (
   'SP0003','DM0001', ' Áo thun đen trái tim', '350000', 'Vải 100%', '2022', 100, 'Đen', 'S', '');
INSERT INTO SANPHAM VALUES (
   'SP0004','DM0001', ' Áo thun đen simpson', '350000', 'Vải 100%', '2022', 100, 'Đỏ', 'S', '');
INSERT INTO SANPHAM VALUES (
   'SP0005','DM0001', ' Áo thun đen cơ bản', '350000', 'Vải 100%', '2022', 100, 'Đỏ', 'S', '');
INSERT INTO SANPHAM VALUES (
   'SP0006','DM0001', 'Áo thun đen trái tim', '350000', 'Vải 100%', '2022', 100, 'Đỏ', 'XL', '');
INSERT INTO SANPHAM VALUES (
   'SP0007','DM0002', 'Quần be', '350000', 'Vải jean 100%', '2022', 100, 'Be', 'XL', '');
INSERT INTO SANPHAM VALUES (
   'SP0008','DM0002', 'Quần đen', '350000', 'Cotton 100%', '2022', 100, 'Be', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0009','DM0002', 'Quần nâu', '350000', 'Cotton 100%', '2022', 100, 'Nâu', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0010','DM0002', 'Quần đen', '350000', 'Cotton 100%', '2022', 100, 'Be', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0011','DM0004', 'Balo hồng', '400000', 'Cotton 100%', '2022', 100, 'Hồng', 'K', '');
INSERT INTO SANPHAM VALUES (
   'SP0012','DM0004', 'Balo xanh', '400000', 'Cotton 100%', '2022', 100, 'Xanh', 'K', '');
INSERT INTO SANPHAM VALUES (
   'SP0013','DM0001', 'Áo thun Tom and Jerry đen', '200000', 'Cotton 100%', '2022', 100, 'Đen', 'M', '');
INSERT INTO SANPHAM VALUES (
   'SP0014','DM0001', 'Áo sweater Tom and Jerry đen', '200000', 'Nỉ len', '2022', 100, 'trắng', 'S', '');
INSERT INTO SANPHAM VALUES (
   'SP0015','DM0001', 'Áo sweater Tom and Jerry trắng', '300000', 'Nỉ len', '2022', 100, 'Trắng', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0016','DM0001', 'Áo thun Tom and Jerry trắng', '300000', 'Cotton 100%', '2021', 100, 'Trắng', 'XL', '');
INSERT INTO SANPHAM VALUES (
   'SP0017','DM0001', 'Áo baby tee trắng hình con gấu', '400000', 'Cotton 100%', '2021', 100, 'Trắng', 'M', '');
INSERT INTO SANPHAM VALUES (
   'SP0018','DM0001', 'Áo thun trắng cơ bản', '400000', 'Cotton 100%', '2021', 100, 'Trắng', 'M', '');
INSERT INTO SANPHAM VALUES (
   'SP0019','DM0001', 'Áo thun trắng hình Tom', '400000', 'Cotton 100%', '2021', 100, 'Trắng', 'S', '');
INSERT INTO SANPHAM VALUES (
   'SP0020','DM0005', 'Túi tote đen', '120000', 'Dù', '2019', 100, 'Đen', 'K', '');
INSERT INTO SANPHAM VALUES (
   'SP0021','DM0005', 'Túi tote hồng', '120000', 'Da', '2022', 100, 'Hồng', 'K', '');
INSERT INTO SANPHAM VALUES (
   'SP0022','DM0001', 'Áo thun vàng', '300000', 'Cotton 100%', '2022', 100, 'Vàng', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0023','DM0001', 'Áo thun xám', '300000', 'Cotton 100%', '2022', 100, 'Xám', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0024','DM0003', 'Áo khoác da', '300000', 'Cotton 100%', '2022', 100, 'Trắng', 'L', '');
INSERT INTO SANPHAM VALUES (
   'SP0025','DM0003', 'Áo khoác gió', '300000', 'Cotton 100%', '2022', 100, 'Trắng', 'L', '');
/

--TABLE HOADON
INSERT INTO HOADON VALUES (
   'HD0001','NV0002', '0328172505', '05-06-2024', 0, 0);
INSERT INTO HOADON VALUES (
   'HD0002','NV0003', '0309172505', '06-06-2024', 0, 0);
INSERT INTO HOADON VALUES (
   'HD0003','NV0004', '0309172505', '03-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0004','NV0005', '0328172505', '03-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0005','NV0006', '0328172505', '02-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0006','NV0007', '0328172505', '03-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0007','NV0008', '0328172505', '04-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0008','NV0009', '0309172505', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0009','NV0010', '0309172505', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0010','NV0011', '0309172505', '04-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0011','NV0012', '0980172505', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0012','NV0013', '0980172505', '03-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0014','NV0014', '', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0013','NV0015', '', '08-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0015','NV0005', '087572505', '09-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0016','NV0005', '087572505', '10-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0017','NV0002', '0325172504', '11-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0018','NV0003', '0325172504', '10-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0019','NV0004', '087572505', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0020','NV0005', '', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0021','NV0006', '0328098505', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0022','NV0005', '', '10-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0023','NV0007', '', '11-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0024','NV0008', '0328098505', '09-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0025','NV0009', '', '09-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0026','NV0010', '0328098505', '11-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0027','NV0011', '', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0028','NV0012', '0328098505', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0029','NV0013', '', '11-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0030','NV0014', '0990987045', '07-06-2024', 0, 0);
INSERT INTO HOADON VALUES (
   'HD0031','NV0015', '', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0033','NV0008', '', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0034','NV0002', '', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0035','NV0003', '', '08-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0036','NV0004', '0328179872', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0037','NV0005', '', '08-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0038','NV0006', '0396567505', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0039','NV0007', '0396567505', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0040','NV0008', '', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0041','NV0009', '0828178705', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0042','NV0010', '', '08-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0043','NV0011', '0828178705', '10-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0044','NV0012', '', '11-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0045','NV0013', '', '12-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0046','NV0014', '0828178705', '11-06-2024', 0, 0); 
INSERT INTO HOADON VALUES (
   'HD0047','NV0015', '', '10-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0048','NV0006', '', '08-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0049','NV0007', '', '08-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0050','NV0008', '0828178705', '12-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0051','NV0009', '0828178705', '10-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0052','NV0005', '', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0053','NV0006', '0828178705', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0054','NV0002', '', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0055','NV0002', '0828178705', '09-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0056','NV0006', '', '07-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0057','NV0007', '', '09-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0058','NV0008', '0328172505', '05-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0059','NV0010', '', '06-06-2024', 0, 0);  
INSERT INTO HOADON VALUES (
   'HD0060','NV0011', '0828178705', '07-06-2024', 0, 0);  
/

--TABLE CHITIETHD
INSERT INTO CHITIETHD VALUES (
   'HD0001','SP0001', 5,  0);  
INSERT INTO CHITIETHD VALUES (
   'HD0002','SP0002', 2,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0003','SP0003', 2,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0004','SP0004', 1,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0005','SP0004', 1,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0006','SP0005', 2,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0007','SP0006', 3,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0008','SP0007', 6,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0009','SP0008', 1,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0010','SP0009', 2,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0011','SP0010', 5,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0012','SP0011', 6,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0013','SP0012', 4,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0014','SP0013', 5,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0015','SP0014', 6,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0016','SP0015', 1,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0017','SP0016', 2,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0018','SP0017', 1,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0018','SP0018', 3,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0019','SP0019', 4,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0019','SP0020', 3,  0); 
INSERT INTO CHITIETHD VALUES (
   'HD0020','SP0021', 4,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0021','SP0022', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0022','SP0023', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0023','SP0020', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0024','SP0020', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0025','SP0002', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0026','SP0001', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0027','SP0003', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0028','SP0004', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0029','SP0005', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0030','SP0006', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0031','SP0007', 2,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0033','SP0001', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0034','SP0001', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0035','SP0001', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0036','SP0001', 2,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0037','SP0001', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0038','SP0001', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0039','SP0009', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0040','SP0009', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0041','SP0003', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0042','SP0004', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0043','SP0005', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0044','SP0006', 6,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0045','SP0007', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0046','SP0006', 2,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0047','SP0011', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0048','SP0010', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0049','SP0012', 2,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0050','SP0001', 5,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0051','SP0002', 4,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0052','SP0003', 4,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0053','SP0004', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0054','SP0005', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0055','SP0023', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0056','SP0001', 3,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0057','SP0014', 4,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0058','SP0015', 2,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0059','SP0020', 1,  0);
INSERT INTO CHITIETHD VALUES (
   'HD0060','SP0011', 2,  0);
/
   
--TABLE PHIEUGIAOHANG
INSERT INTO PHIEUGIAOHANG VALUES (
   'PGH0001', 'NV0011', 'HD0001', '05-06-2024',2,  0, '', 'Nguyễn Thị Diệu', '0366256200');
INSERT INTO PHIEUGIAOHANG VALUES (
   'PGH0002','NV0005', 'HD0002','06-06-2024', 2,  0, '', 'Nguyễn Văn Mách', '0366256200');
INSERT INTO PHIEUGIAOHANG VALUES (
   'PGH0003','NV0006', 'HD0003','03-06-2024', 2,  0, '', 'Vy Nguyễn', '0364255400');
INSERT INTO PHIEUGIAOHANG VALUES (
   'PGH0004', 'NV0007', 'HD0004','03-06-2024', 2,  0, '', 'Hồng Hoa', '0983728873');
INSERT INTO PHIEUGIAOHANG VALUES (
   'PGH0005', 'NV0008', 'HD0005','02-06-2024', 2,  0, '', 'Mai Thy', '0982378920');
/

--TABLE PHIEUHOANTRA
INSERT INTO PHIEUHOANTRA VALUES (
   'PHT0001', 'HD0001', 'NV0002', 'SP0001', '11-06-2024', 0);
INSERT INTO PHIEUHOANTRA VALUES (
   'PHT0002', 'HD0002', 'NV0003', 'SP0002', '10-06-2024', 1);
/






