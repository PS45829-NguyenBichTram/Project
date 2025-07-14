/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qlsancau.util;

import com.qlsancau.entity.Role;
import com.qlsancau.entity.TaiKhoan;

/**
 *
 * @author VAN TRONG
 */
public class XAuth {

    public static TaiKhoan user = TaiKhoan.builder()
            .maTaiKhoan("")
            .hoVaTen("")
            .email("")
            .sdt("")
            .matKhau("")
            .trangThai(true)
            .hinhAnh("")
            .maChucVu(Role.CHUSAN)
            .build(); // biến user này sẽ được thay thế sau khi đăng nhập
}
