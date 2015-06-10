/*
 * Copyright 2006-2014 innopost.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0.txt
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
package com.jusolink.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jusolink.api.AddressService;
import com.jusolink.api.JusoLinkException;

/**
 * 주소링크 JusolinkService API 예재
 */

@Controller
public class JusolinkController {
	
	@Autowired
	private AddressService jusolinkService;
		
	@Value("#{EXAMPLE_CONFIG.SecretKey}")
	private String testUserID;
	@Value("#{EXAMPLE_CONFIG.LinkID}")
	private String testLinkID;
	
	//검색예제 페이지
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(Model m){
		return "search";
	}
	
	//잔여포인트 확인
	@RequestMapping(value = "getBalance", method = RequestMethod.GET)
	public String getBalance(Model m) throws JusoLinkException {
		try {
			double remainPoint = jusolinkService.getBalance();
			
			m.addAttribute("Result",remainPoint);
			
		} catch (JusoLinkException e) {
			m.addAttribute("Exception", e);
			return "exception";
		}
		return "result";
	}
	
	//검색단가 확인
	@RequestMapping(value = "getUnitCost", method = RequestMethod.GET)
	public String getPartnerBalance(Model m) throws JusoLinkException {
		
		try {
			float unitCost = jusolinkService.getUnitCost();
			
			m.addAttribute("Result",unitCost);
			
		} catch (JusoLinkException e) {
			m.addAttribute("Exception", e);
			return "exception";
		}
		
		return "result";
	}
}