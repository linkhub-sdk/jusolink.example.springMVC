<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/resources/main.css" media="screen" />
		
		<title>주소링크 SDK SpringMVC Example.</title>
	</head>
	<body class="body_width">
		<div id="content_result">
			<p class="heading1">주소검색 Example</p>
			<br/>
			<fieldset class="fieldset5 left">
				<legend>주소검색</legend>
						<form method = "GET" id="zipcode_form" action="zipcode">
							<input class= "txtZipcode left" type="text" id="IndexWord" name="IndexWord" tabindex=1 placeholder="예) 영동대로 517, 아셈타워, 삼성동 159" value="${result.searches}"/>
							<input type="hidden" type="text" id="PageNum" name="PageNum" value=1>
							<p class="find_btn find_btn01 hand" onclick="search();" tabindex=2> 검색 </P>
						</form>
						<c:if test="${result != null}">
							<div class="result_box">				
								<p class="example left">검색결과 : ${result.numFound} 개</p>
								<c:if test="${result.suggest != null}">	
								<p class="example left">검색어 제안 : <span class="suggest hand" onclick='suggest_search("${result.suggest}")'> ${result.suggest} 검색결과 보기</span></p>
								</c:if>
							</div>
						</c:if>
			</fieldset>
			<br />
		 </div>
			 
			<div id="content_juso">
				<c:if test="${result.juso != null}">
				<c:forEach items="${result.juso}" var="juso">
					<fieldset class="fieldset6 left">
						<p> <span class="zipcode" id="zipcode">${juso.zipcode}</span> <span>(${juso.sectionNum})</span></p>
						<p class="hand" onclick='detail("roadAddr", "${juso.zipcode}", "${juso.sectionNum}", "${juso.roadAddr1}", "${juso.roadAddr2}", "${juso.jibunAddr}")'>
							<img class="imgAlign" src="../resources/image/juso_icon_01.gif"/> ${juso.roadAddr1} ${juso.roadAddr2}
						</p>
						<p class="hand" onclick='detail("jibunAddr", "${juso.zipcode}", "${juso.sectionNum}", "${juso.roadAddr1}", "${juso.roadAddr2}", "${juso.jibunAddr}")'>
							<img class="imgAlign" src="../resources/image/juso_icon_02.gif"/> ${juso.jibunAddr}
						</p>

						<c:if test="${juso.relatedJibun != null}">
						<p> <img class="imgAlign" src="../resources/image/juso_icon_03.gif"/>
							<c:forEach items="${juso.relatedJibun}" var="relatedJibun">
								 ${relatedJibun}
							</c:forEach>
						</p>
						</c:if>
					</fieldset>
					
				</c:forEach>
				</c:if>
					
			<div class="page_num">
				<img class="hand" onclick='prevPage();' alt="이전"  src="../resources/image/juso_btn_prev.png">
					<span class="current" id="current_page">${result.page}</span>
					&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
					<span class="end" id="end_page">${result.totalPage}</span>
				<img class="hand" onclick='nextPage();' alt="다음" src="../resources/image/juso_btn_next.png">
			</div>
					
			<c:if test="${result.juso == null}">
				<fieldset class="fieldset6 left">
					<p><strong>검색결과가 없습니다.</strong></p>
					<p>잘못된 철자가 없는지, 정확한 주소인지 검색어를 다시 한번 확인해 주세요. </p>
				</fieldset>
			</c:if>
			</div>
			
		<div id="content_detail">
					<p class="heading1">상세주소 입력</p>
					<br/>
					<fieldset class="fieldset6 left">
						<div class ="select_box">
							<ul>
								<li>아래의 주소를 확인하시고 선택하신 후 확인버튼을 누르세요. </li>
								<li>정확한 우편물 발송을 위해 표준화 도로명주소 사용을 권장합니다.</li>
							</ul>
						
						
							<div class="road_type">
								<input class="hand" id="road" name="Type" type="radio" onfocus="roadRadioSelect()" tabindex=1>
								<label class="hand" for="road">표준화 도로명주소</label>
								<table>
									<colgroup>
										<col width = "74">
										<col>
									</colgroup>

									<tbody>
										<tr class="code">
											<th>우편번호</th>
											<td>
												<span class="zipcode" id="road_zipcode"></span>
												<span class="sectionNum" id="road_sectionNum"></span>
											</td>
										</tr>
										<tr class="addr">
											<th>기본주소</th>
											<td>
												<span id="roadAddr1"></span>&nbsp;<span id="roadAddr2"></span>
											</td>
										</tr>

										<tr class="addr_detail">
										<th>상세주소</th>
										<td>
											<input class="on" id="road_detail" type="text" onfocus="roadDetailSelect()" tabindex=2/>
										</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="jibun_type">
								<input class="hand" id="jibun" name="Type" type="radio" onfocus="jibunRadioSelect()" tabindex=3>
								<label class="hand" for="jibun">표준화 지번주소</label>
								<table>
									<colgroup>
										<col width = "74">
										<col>
									</colgroup>

									<tbody>
										<tr class="code">
											<th>우편번호</th>
											<td>
												<span class="zipcode" id="jibun_zipcode"></span>
												<span class="sectionNum" id="jibun_sectionNum"></span>
											</td>
										</tr>
										<tr class="addr">
											<th>기본주소</th>
											<td>
												<span id="jibunAddr"></span>
											</td>
										</tr>

										<tr class="addr_detail">
										<th>상세주소</th>
										<td>
											<input class="on" id="jibun_detail" type="text" onfocus="jibunDetailSelect()" tabindex=4/>
										</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn_list">
								<p class="btn_ok hand" onclick="inputAddr();" tabindex=5>확인</p>
								<a href="zipcode"><p class="btn_reset hand" tabindex=6>다시검색</p></a>
							</div>
						</div>
					
					</fieldset>
				<br />
			</div>

		<script type="text/javascript">
			window.onload=function(){
	
				document.getElementById('content_juso').style.display="none";
				document.getElementById('content_detail').style.display="none";
				
				// 검색결과 화면 출력
				if(document.getElementById('zipcode') != null){
					document.getElementById('content_juso').style.display='';
				}
				document.getElementById('IndexWord').focus();
				
				
			};
						 			
			// 수정제시어로 검색
			function suggest_search(indexWord){
				document.getElementById('IndexWord').value = indexWord;
				document.getElementById('PageNum').value = 1;
				document.getElementById('zipcode_form').submit();
			}
			
			// 주소검색
			function search(){
				var index = document.getElementById('IndexWord').value;
				if(index.length != 0) {
						document.getElementById('PageNum').value = 1;
						document.getElementById('zipcode_form').submit();
				}else {
					alert('검색어를 입력하여 주세요');
					return false;
				}
			}
			
			// 다음페이지
			function nextPage(){
				currentPage = document.getElementById('current_page').innerText;
				totalPage = document.getElementById('end_page').innerText;
				
				if (currentPage < totalPage)
				{
					document.getElementById('PageNum').value = currentPage*1 + 1;				
					document.getElementById('zipcode_form').submit();
				}
			}
			
			// 이전페이지
			function prevPage(){
				currentPage = document.getElementById('current_page').innerText;

					if(currentPage > 1){
					document.getElementById('PageNum').value = currentPage*1 -1;			
					document.getElementById('zipcode_form').submit();
				}
			}
			
			// 상세주소 입력폼 호출
			function detail(type, zipcode, sectionNum, roadAddr1, roadAddr2, jibunAddr){
				document.getElementById('content_result').style.display="none";
				document.getElementById('content_juso').style.display="none";
				document.getElementById('content_detail').style.display='';
				
				if(type == "roadAddr"){
					document.getElementById('road').checked = true;
					document.getElementById('road_detail').focus();
				}else {
					document.getElementById('jibun').checked = true;
					document.getElementById('jibun_detail').focus();
				}

				document.getElementById('road_zipcode').innerHTML = zipcode;
				document.getElementById('road_zipcode').value = zipcode;
				document.getElementById('road_sectionNum').innerHTML = "("+sectionNum+")";
				document.getElementById('road_sectionNum').value = sectionNum;
				document.getElementById('roadAddr1').innerHTML = roadAddr1;
				document.getElementById('roadAddr1').value = roadAddr1;
				document.getElementById('roadAddr2').innerHTML = roadAddr2;
				document.getElementById('roadAddr2').value = roadAddr2;

				document.getElementById('jibun_zipcode').innerHTML = zipcode;
				document.getElementById('jibun_zipcode').value = zipcode;
				document.getElementById('jibun_sectionNum').innerHTML = "("+sectionNum+")";
				document.getElementById('jibun_sectionNum').value = sectionNum;
				document.getElementById('jibunAddr').value = jibunAddr;
				document.getElementById('jibunAddr').innerHTML = jibunAddr;
			}

			// 부모 페이지로 우편번호, 주소 전달	
			function inputAddr(){
					
				// 도로명주소 선택
				if(document.getElementById('road').checked){

					zipcode = document.getElementById('road_sectionNum').value;
					roadAddr1 = document.getElementById('roadAddr1').value;
					roadAddr2 = document.getElementById('roadAddr2').value;
					roadAddrDetail = document.getElementById('road_detail').value;

					if (roadAddrDetail != ''){
						addrResult = roadAddr1 +", "+ roadAddrDetail +" "+roadAddr2;
					} else {
						addrResult = roadAddr1 +" "+roadAddr2;
					}

					// 지번주소 선택
					} else {
						zipcode = document.getElementById('jibun_sectionNum').value;
						addrResult = document.getElementById('jibunAddr').value;
						detail = document.getElementById('jibun_detail').value;

						if(detail != ''){
							addrResult += ', '+ detail;
						}
					}

					window.opener.putAddr(zipcode, addrResult);
					self.close();
			}
			
			function roadDetailSelect(){
				document.getElementById('road').checked = true;	
			}
			
			function jibunDetailSelect(){
				document.getElementById('jibun').checked = true;
			}
			
			function roadRadioSelect(){
				document.getElementById('road_detail').focus();	
			}
			
			function jibunRadioSelect(){
				document.getElementById('jibun_detail').focus();	
			}
			
		</script>
	</body>
</html>