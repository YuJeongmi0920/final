package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.PaymentService;
import com.gd.finalproject.vo.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	@Autowired PaymentService paymentService;
	
	// 고객결제 리스트
	@PostMapping("/userPaymentList")
	public String userPaymentList(Model model, @AuthenticationPrincipal MemberDto memberDto, String cartCheck/*, String lockerUse*/) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "userPaymentList.memberDto.getMemberId() : " + memberDto.getMemberId());
		//		log.debug(TeamColor.YW + "getUserPaymentList.lockerUse : " + lockerUse);	
		
		List<Map<String,Object>> userPaymentList = paymentService.getUserPaymentList(memberDto.getMemberId(),cartCheck);
		model.addAttribute("userPaymentList", userPaymentList);
		
		return "/user/userPaymentList";
	}
}