--T?o b?ng:
create table NHANVIEN(
       maNV char (5) not null,
       hoTen varchar2 (50),
       diaChi varchar2 (50),
       dienThoai number (11, 0),
       email varchar2 (50),
       maPhong char (5),
       chiNhanh char (5),
       luong number,
       primary key (maNV)
);
create table CHINHANH(
        maCN char (5),
        tenCN varchar2 (50)
        truongCN char(5),
        primary key  (maCN)
);
create table DUAN(
       maDA char (5) not null,
       tenDA varchar2 (50),
       kinhPhi float,
       phongchuTri varchar2(50),
       truongDA char (5),
       primary key (maDA)
);
create table PHONGBAN(
       maPhong char (5) not null,
       tenPhong varchar2 (50) not null,
       truongPhong char (5) ,
       ngayNhanChuc date,
       soNhanVien number (5, 0),
       chiNhanh char (5),
       primary key (maPhong)
);
create table PHANCONG(
       maNV char (5) not null,
       duAn char (5),
       vaiTro varchar2 (50),
       phuCap float,
       primary key (maNV, duAn)
);
create table CHITIEU(
       machiTieu char (5) not null,
       tenchiTieu varchar2 (50),
       soTien float,
       duAn number (5, 0),
       primary key (machiTieu)
);


alter table DUAN
    add constraint FK_NHANVIEN_DUAN
    foreign key  (truongDA)
    references  NHANVIEN;

--T?o khoá ngo?i:
alter table CHINHANH
    add constraint FK_NHANVIEN_CHINHANH
    foreign key  (truongCN)
    references  NHANVIEN;
   
----T?o Khoá ngo?i:
alter table PHONGBAN
    add constraint FK_NHANVIEN_PHONGBAN
    foreign key  (truongPhong)
    references  NHANVIEN;
alter table PHONGBAN
    add constraint FK_NHANVIEN_CHINHANH
    foreign key  (chiNhanh)
    references  CHINHANH;
--T?o b?ng Phân công:
alter table PHANCONG
    add constraint FK_PHANCONG_DUAN
    foreign key  (duAn)
    references  DUAN;
alter table PHANCONG
    add constraint FK_PHANCONG_NHANVIEN
    foreign key  (maNV)
    references  NHANVIEN;

alter table CHITIEU
    add constraint FK_CHITIEU_DUAN
    foreign key  (duAn)
    references  DUAN;
 

--Insert into table:
------table CHINHANH
 insert into ChiNhanh(maCN, tenCN, truongCN) values ('CNHCM', 'Hô? Chi? Minh', null);
 insert into ChiNhanh(maCN, tenCN, truongCN) values ('CNHN', 'Hà N?i', null);
 insert into ChiNhanh(maCN, tenCN, truongCN) values ('CNCT', 'C?n Th?', null);
 insert into ChiNhanh(maCN, tenCN, truongCN) values ('CNTH', 'Thanh Hoá', null);
 insert into ChiNhanh(maCN, tenCN, truongCN) values ('CNTG', 'Ti?n Giang', null);
-----table PHONGBAN
 insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT01H', 'K? thu?t ?i?n', 'NV01', 5, 'CNHCM');
  insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT01N', 'K? thu?t ?i?n', 'NV01', 5, 'CNHCM');
 insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('K01', 'K? thu?t oto', 'NV05', 3, 'CNHN');
 insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KTTH', 'K? thu?t dân d?ng', 'NV04 ', 2, 'CNTH');
 insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT004', 'K? thu?t ?i?n', 'NV01', 5, 'CNHCM');
 insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT005', 'K? thu?t oto', 'NV05', 3, 'CNHCM');
 insert into PhongBan(maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhanVien, chiNhanh) values ('KT006', 'K? thu?t dân d?ng', 'NV04 ', 2, 'CNTH');


--Insert into table NHANVIEN
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV01', 'Nguy?n V?n Bình', 'qu?n 4 H? Chí Minh',null, 'binh12@gmail.com', 'KT001', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV02', 'Nguy?n V?n An', 'Hàng Bông Hà N?i',null, 'an12@gmail.com', 'KT002', 'CNHN', 21000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV03', 'Lê V?n C', 'Ninh Ki?u C?n Th?',null, 'c12@gmail.com', 'KT001', 'CNCT', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV04', 'Tr?n Ng?c Dung', 'Thanh Hoá',null, 'dung@gmail.com', 'KT002', 'CNTH', 17000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV05', 'Cao Thanh Nam', 'Ti?n Giang',null, 'namh12@gmail.com', 'KT003', 'CNTG', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV06', 'Nguy?n H?i B?c', 'qu?n 7 H? Chí Minh',null, 'binh12@gmail.com', 'KT003', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV07', 'Nguy?n V?n Bình', 'qu?n 4 H? Chí Minh',null, 'binh12@gmail.com', 'KT001', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV08', 'Nguy?n V?n An', 'Hàng Bông Hà N?i',null, 'an12@gmail.com', 'KT002', 'CNHN', 21000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV09', 'Lê V?n C', 'Ninh Ki?u C?n Th?',null, 'c12@gmail.com', 'KT001', 'CNCT', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV10', 'Tr?n Ng?c Dung', 'Thanh Hoá',null, 'dung@gmail.com', 'KT002', 'CNTH', 17000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV11', 'Cao Thanh Nam', 'Ti?n Giang',null, 'namh12@gmail.com', 'KT003', 'CNTG', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV12', 'Nguy?n H?i B?c', 'qu?n 7 H? Chí Minh',null, 'binh12@gmail.com', 'KT003', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV13', 'Nguy?n V?n Bình', 'qu?n 4 H? Chí Minh',null, 'binh12@gmail.com', 'KT001', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV14', 'Nguy?n V?n An', 'Hàng Bông Hà N?i',null, 'an12@gmail.com', 'KT002', 'CNHN', 21000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV15', 'Lê V?n C', 'Ninh Ki?u C?n Th?',null, 'c12@gmail.com', 'KT001', 'CNCT', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV16', 'Tr?n Ng?c Dung', 'Thanh Hoá',null, 'dung@gmail.com', 'KT002', 'CNTH', 17000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV17', 'Cao Thanh Nam', 'Ti?n Giang',null, 'namh12@gmail.com', 'KT003', 'CNTG', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV18', 'Nguy?n H?i B?c', 'qu?n 7 H? Chí Minh',null, 'binh12@gmail.com', 'KT003', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV19', 'Nguy?n V?n Bình', 'qu?n 4 H? Chí Minh',null, 'binh12@gmail.com', 'KT001', 'CNHCM', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV20', 'Nguy?n V?n An', 'Hàng Bông Hà N?i',null, 'an12@gmail.com', 'KT002', 'CNHN', 21000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV21', 'Lê V?n C', 'Ninh Ki?u C?n Th?',null, 'c12@gmail.com', 'KT001', 'CNCT', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV22', 'Tr?n Ng?c Dung', 'Thanh Hoá',null, 'dung@gmail.com', 'KT002', 'CNTH', 17000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV23', 'Cao Thanh Nam', 'Ti?n Giang',null, 'namh12@gmail.com', 'KT003', 'CNTG', 19000000);
insert into(maNV, hoTen, diaChi, dienThoai, Email, maPhong, chiNhanh, luong) values themNhanVien('NV24', 'Nguy?n H?i B?c', 'qu?n 7 H? Chí Minh',null, 'binh12@gmail.com', 'KT003', 'CNHCM', 19000000);

