package com.qlsancau.util;

import java.util.Base64;
import java.util.UUID;

public class XStr {

    //Kiểm tra xem chuỗi có bị rỗng hoặc chỉ toàn khoảng trắng hay không.
    public static boolean isBlank(String text) {
        return text == null || text.trim().length() == 0;
    }

    //Tránh lỗi NullPointerException khi gọi toString() trên đối tượng null.
    public static String valueOf(Object object) {
        return object == null ? "" : String.valueOf(object);
    }

    //Mã hóa chuỗi sang dạng Base64, thường dùng để che giấu mật khẩu, token, ID...
    public static String encodeB64(String text) {
        byte[] data = text.getBytes();
        return Base64.getEncoder().encodeToString(data);
    }

    
    //Giải mã Base64 về chuỗi ban đầu.
    public static String decodeB64(String text) {
        byte[] data = Base64.getDecoder().decode(text);
        return new String(data);
    }

    //kiểm tra mã thẻ đúng định dạng số
    public static boolean isInteger(String text) {
        try {
            Integer.parseInt(text);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    //kiểm tra tự động viết hoa
    public static String toUpper(String text) {
        return text == null ? null : text.trim().toUpperCase();
    }

    public static boolean isNegativeNumber(String text){
        try{
            return Double.parseDouble(text.trim()) < 0;
        }catch(NumberFormatException e){
            return false; //Không phải số hợp lệ thì không coi là số âm
        }
    }
    
    //Sinh mã đơn hàng, mã hóa đơn, mã thành viên,...
    public static String getKey(String... args) {
        if (args.length == 0) {
            args = new String[]{UUID.randomUUID().toString(), String.valueOf(System.currentTimeMillis())};
        }
        int hashCode = String.join("-", args).hashCode();
        String key = "XXXXXXXX" + Integer.toHexString(Math.abs(hashCode)).toUpperCase();
        return key.substring(key.length() - 8);
    }
}
