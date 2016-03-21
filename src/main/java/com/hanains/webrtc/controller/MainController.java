package com.hanains.webrtc.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/test")
	public String test(){
		return "test";
	}
	
	@RequestMapping("/chat2")
	public String chat2(){
		return "chat2";
	}
	
	@RequestMapping("/push")
	public String push(){
		return "push/push";
	}
	
	@RequestMapping("/push1")
	public String push1(){
		return "push";
	}
	
	@RequestMapping("/swtest")
	public String sw(){
		return "swtest/swtest";
	}
}
