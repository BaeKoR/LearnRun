package com.semi.learn.mail;

import java.util.Random;

//인증번호를 보낼 때 사용할 클래스 
// 이 클래스를 호출할 때는 몇 자리 수로 할 건지 사이즈를 파라미터로 보내면 됨

// 랜덤키 만드는거 다시 찾아보기

public class TempKey{
    private boolean lowerCheck;		// 대문자를 소문자로 바꿀 것인지 여부 설정	true == 소문자, false == 그대로반환
    private int size;

    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init() {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num  = 0;
        do {
            num = ran.nextInt(75) + 48;
            if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char) num);
            } else {
                continue;
            }
        } while (sb.length() < size);
        if (lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }
}
