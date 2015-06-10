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
import org.springframework.web.bind.annotation.RequestParam;

import com.jusolink.api.AddressService;
import com.jusolink.api.JusoLinkException;
import com.jusolink.api.SearchResult;

/**
 * 주소링크 JusolinkService API 예제
 */

@Controller
@RequestMapping("JusolinkService")
public class JusolinkServiceExample {
	
	@Autowired
	private AddressService jusolinkService;
		
	@Value("#{EXAMPLE_CONFIG.SecretKey}")
	private String testUserID;
	@Value("#{EXAMPLE_CONFIG.LinkID}")
	private String testLinkID;
	
	//주소검색 
	@RequestMapping(value = "zipcode", method = RequestMethod.GET)
	public String zipcode(@RequestParam(required=false) String IndexWord, @RequestParam(required=false) Integer PageNum, Model m) throws JusoLinkException {
	
		if(IndexWord != null && IndexWord != ""){
		
			SearchResult result;
			int pageNum = PageNum;					// 페이지번호 
			int perPage = 20;						// 페이지 목록 갯수(기본값 20, 최대 100개)
			Boolean noSuggest = false;				// 수정제시어 끄기 (기본값 false)
			Boolean noDiff = false;					// 차등검색 끄기 (기본값 false)

			try{
				
				result = jusolinkService.searchAddress(IndexWord, pageNum, perPage, noSuggest, noDiff);
				
				m.addAttribute("result", result);
				
			} catch (JusoLinkException e) {
				
				m.addAttribute("Exception", e);
				
				return "exception";
				
			}
			
		} else if(IndexWord != null && IndexWord == ""){
			JusoLinkException e = new JusoLinkException(-99999999, "검색어가 입력되지 않았습니다.");
			m.addAttribute("Exception", e);
			return "exception";
		}
		
		return "zipcode";
	}
}
