package com.hanains.webrtc.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@RequestMapping("/")
	public String chat(Model model, @RequestParam(value="name", required=true, defaultValue="") String name,
			@RequestParam(value="clientkey", required=true, defaultValue="") String ckey,
			@RequestParam(value="serverkey", required=true, defaultValue="") String skey){
		
		
		try {
			InetAddress ip = InetAddress.getLocalHost();
			model.addAttribute("ip", ip.getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} 
		model.addAttribute("name", name.trim());
		model.addAttribute("clientkey", ckey.trim());
		model.addAttribute("serverkey", skey.trim());
		return "/chat/chat";
	}
	
	@RequestMapping("/waiting")
	public String waiting(Model model,
			@RequestParam(value="clientkey", required=true, defaultValue="") String ckey){
		try {
			InetAddress ip = InetAddress.getLocalHost();
			model.addAttribute("ip", ip.getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} 
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd-HH-mm-ss", Locale.KOREA ); 
		Date currentTime = new Date ( ); 
		String dTime = formatter.format ( currentTime ); 
		
		model.addAttribute("clientkey", ckey.trim());
		model.addAttribute("time", dTime.trim());
		return "/chat/waiting";
	}
	
	@RequestMapping("/rooms")
	public String chatrooms(Model model){
		try {
			InetAddress ip = InetAddress.getLocalHost();
			model.addAttribute("ip", ip.getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} 
		return "/chat/chatrooms";
	}
}
