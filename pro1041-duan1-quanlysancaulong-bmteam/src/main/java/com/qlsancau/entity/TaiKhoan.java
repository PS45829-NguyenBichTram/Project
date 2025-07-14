/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qlsancau.entity;

import com.qlsancau.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author VAN TRONG
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaiKhoan {

    private String maTaiKhoan;
    private String hoVaTen;
    private String email;
    private String sdt;
    private String matKhau;
    private boolean trangThai;
    
    @Builder.Default
    private String hinhAnh = "photo.png";
    
    private Role maChucVu;
}
