<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage/updateUserForm.css">
<script src="${contextPath}/resources/js/mypage/updateUserForm.js"></script>

<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>Insert title here</title>
</head>

<body onload="init()">
	<header>
		<jsp:include page="../common/header.jsp" />
	</header>
	<main>
        <div class="title">
            마이페이지
        </div>

        <div class="main-section">
            <div class="side">
                <div class="profile">
                    <img src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                    <div id="profile-text">
                        <span>[아이디]</span>
                        <span>님</span><br>
                        <span>환영합니다</span>
                    </div>
                </div>
                <div class="side-menu">
                    <div class="small-title">마이페이지</div>
                    <ul>
                        <li><a href="${contextPath}/paymentList.me">결제내역</a></li>
                        <li><a href="${contextPath}/scrapList.me">찜목록</a></li>
                        <li><a href="${contextPath}/reviewList.me">한줄평</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">커뮤니티 관리</li>
                        <li><a href="${contextPath}/boardList.me">나의 게시글</a></li>
                        <li><a href="${contextPath}/likeList.me">좋아요</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">설정</li>
                        <li><a href="${contextPath}/updateForm.me">회원정보 변경</a></li>
                    </ul>
                    <ul>
                        <li class="side-menu-title">문의</li>
                        <li><a href="${contextPath}/inquireList.me">1:1 문의 내역</a></li>
                    </ul>
                        
                </div>
            </div>
            <div class="main-content">
                <div class="section-title">설정</div>
                
                <div class="main-title">
                    <h2>회원정보변경</h2>
                </div>
                <div id="profile-update">

                    <div id="password-auth" hidden>
                        <h3>비밀번호 인증</h3>
                        <div>
                            <input type="password" id="auth-password" placeholder="비밀번호 입력">
                            <button type="button" class="btn-staez purple" onclick="checkPassword()">인증</button>
                        </div>
                        <p id="auth-fail" hidden>비밀번호가 일치하지 않습니다.</p>
                    </div>

                    <form action="update.me" method="GET" >
                        <div id="profile-img">
                            <img src="${contextPath}/resources/img/mypage/profile_img_temp.png" alt="">
                        </div>
                        <div id="update-form">
                            <table>
                                <tbody>
                                    <tr>
                                        <th><h3>닉네임</h3></th>
                                        <td class="input-box">
                                            <input type="text" name="nickname" value="" placeholder="" maxlength="16" >
                                        </td>
                                        <td class="input-btn">
                                            <button type="button">중복확인</button>
                                        </td>
                                    </tr>
                                    <tr class="warning-text hidden">
                                        <td></td>
                                        <td><h5>중복된 닉네임입니다</h5></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th><h3>아이디</h3></th>
                                        <td class="input-box">
                                            <input type="text" name="userId" value="user01" readonly>
                                        </td>
                                        <td class="input-btn"></td>
                                    </tr>

                                    <tr>
                                        <th><h3>생년월일</h3></th>
                                        <td class="input-box">
                                            <input type="date" name="birth" value="1997-04-23" readonly>
                                        </td>
                                        <td class="input-btn">
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><h3>비밀번호</h3></th>
                                        <td id="pwd-btn">
                                            <button type="button" data-toggle="modal" data-target="#pwdModal">비밀번호 변경</button>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th><h3>성별</h3></th>
                                        <td id="gender-input">
                                            <div>
                                                <div>
                                                    <input type="radio" name="gender" id="male" value="M">
                                                    <label for="male">남자</label>
                                                </div>
                                                <div>
                                                    <input type="radio" name="gender" id="female" value="F">
                                                    <label for="female">여자</label>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th><h3>주소</h3></th>
                                        <td class="input-box">
                                            <input type="text" id="addressNormal" readonly required>
                                        </td>
                                        <td class="input-btn">
                                            <button type="button" onclick="execDaumPostcode()">우편번호</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td class="input-box">
                                            <input type="text" placeholder="상세주소를 입력하세요" id="addressDetail" onchange="updateCombinedAddress()" readonly required>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <input type="text" name="address" readonly hidden>

                                    <tr>
                                        <th><h3>휴대폰번호</h3></th>
                                        <td id="phone-input">
                                            <div>
                                                <input id="front-num" type="text" maxlength="3" value="010" readonly>
                                                <input id="phone1" type="text" value="" minlength="4" maxlength="4" onchange="updateCombinedPhone()">
                                                <input id="phone2" type="text" value="" minlength="4" maxlength="4" onchange="updateCombinedPhone()">
                                            </div>
                                        </td>
                                        <input type="text" name="phone" readonly hidden>
                                        <td class="input-btn">
                                            <button type="button">인증하기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td class="input-box"><input type="text" placeholder="6자리 입력"></td>
                                        <td class="input-btn">
                                            <button type="button">인증</button>
                                        </td>
                                    </tr>
                                    <tr class="warning-text hidden">
                                        <td></td>
                                        <td><h5>잘못된 인증번호입니다</h5></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <th><h3>이메일</h3></th>
                                        <td id="email-input">
                                            <div>
                                                <input type="text" id="email-front"> 
                                                <span>@</span>
                                                <input type="text" id="email-back">
                                            </div>
                                        </td>
                                        <td class="input-btn">
                                            <select name="domain" id="" onchange="emailDomain()">
                                                <option value="self-input">직접입력</option>
                                                <option value="naver.com">네이버</option>
                                                <option value="google.com">구글</option>
                                                <option value="daum.net">다음</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th rowspan="2"><h3>관심장르(택3)</h3></th>
                                        <td colspan="2" rowspan="2" id="like-genre-input" >
                                            <div>
                                                <button type="button" class="btn-staez"><h4>뮤지컬</h4></button>
                                                <button type="button" class="btn-staez"><h4>클래식</h4></button>    
                                                <button type="button" class="btn-staez"><h4>연극</h4></button>    
                                                <button type="button" class="btn-staez"><h4>국악</h4></button>    
                                                <button type="button" class="btn-staez full-width"><h4>대중음악</h4></button>    
                                                <button type="button" class="btn-staez full-width"><h4>서커스/마술</h4></button>    
                                                <button type="button" class="btn-staez full-width"><h4>기타</h4></button>    
                                            </div>
                                            <input type="text" name="genreLike" hidden> <!--button들 내용 추가-->
                                        </td>
                                    </tr>
                                    <tr> <!--크기 맞추기 위한 빈공간-->
                                        <th></th>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="submit-btn">
                            <button type="submit" class="btn-staez purple"><h3>저장</h3></button>
                            <button type="button" class="btn-staez purple" data-toggle="modal" data-target="#withdrawalModal"><h3>회원탈퇴</h3></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
	</main>

	 <!-- 패스워드 변경 Modal -->
     <div class="modal fade" id="pwdModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">비밀번호 변경</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="GET"> <!-- 비밀번호 ajax 사용 예정-->
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="pwd-tag">
                            <div></div>
                            <div>
                                <h3>변경할 비밀번호</h3>
                                <input type="password">
                            </div>
                            <div class="pwd-check"></div>
                            <div>
                                <h3>비밀번호 확인</h3>
                                <input type="password">
                            </div>
                            <div class="pwd-check"></div>
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">변경</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

     <!-- 프로필사진 변경 Modal -->
     <div class="modal" id="imgModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">비밀번호 변경</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="GET"> <!-- 비밀번호 ajax 사용 예정-->
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="pwd-tag">
                            <div>
                                <h3>현재 비밀번호</h3>
                                <input type="password">
                                <button type="button" class="btn-staez purple"><h3>비밀번호 확인</h3></button>
                            </div>
                            <!-- <div>
                                <h3>변경할 비밀번호</h3>
                                <input type="password">
                            </div>
                            <div>
                                <h3>비밀번호 확인</h3>
                                <input type="password">
                            </div> -->
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">변경</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 회원탈퇴 Modal -->
    <div class="modal" id="withdrawalModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">회원탈퇴</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form method="GET"> <!-- 비밀번호 ajax 사용 예정-->
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="withdrawal-tag">
                            <h2>정말 탈퇴하시겠습니까?</h2>
                            <div>
                                <h3>비밀번호 확인</h3>
                                <input type="password">
                                <button type="button" class="btn-staez purple"><h3>확인</h3></button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">변경</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>

</body>
</html>