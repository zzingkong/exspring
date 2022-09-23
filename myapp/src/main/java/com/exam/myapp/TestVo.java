package com.exam.myapp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import lombok.Getter;
import lombok.Setter;

@Getter //lombok을 이용하여, 클래스의 모든 필드(멤버변수)의 getXxx() 메서드 자동 생성
@Setter //lombok을 이용하여, 클래스의 final이 아닌 모든 필드의 setXxx() 메서드 자동 생성
public class TestVo {
	private int x;
	private int y;
	private String lunch;
	private String dinner;
	private List<String> food = new ArrayList<String>(); //String[]
	private List<LicenseVo> license;
	
}





