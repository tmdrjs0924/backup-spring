<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="../resources/css/member/join.css" />
    <title>Document</title>
  </head>
  <body>
    <section id="join">
      <div class="join__form">
        <h3>회원가입</h3>
        <form method="post" id="joinForm">
          <div class="join__id">
            <input
              type="text"
              class="memberId"
              name="memberId"
              placeholder="아이디"
            />
          </div>
          <div class="join__chk join__id__chk"></div>
          <div class="join__pw">
            <input
              type="password"
              class="memberPw"
              name="memberPw"
              placeholder="비밀번호"
            />
          </div>
          <div class="join__pw2">
            <input
              type="password"
              class="memberPw2"
              name="memberPw2"
              placeholder="비밀번호 확인"
            />
          </div>
          <div class="join__chk join__pw__chk"></div>
          <div class="join__name">
            <input
              type="text"
              class="memberName"
              name="memberName"
              placeholder="이름"
            />
          </div>
          <div class="join__chk join__name__chk"></div>
          <div class="join__phone">
            <input
              type="tel"
              class="memberPhone"
              name="memberPhone"
              placeholder="전화번호"
            />
          </div>
          <div class="join__chk join__phone__chk"></div>
          <div class="join__mail">
            <span class="join__mail__left"
              ><input
                type="email"
                class="memberMail"
                name="memberMail"
                placeholder="이메일"
            /></span>
            <span class="join__btn" id="joinEmailCheck">인증</span>
          </div>

          <div class="join__mail2">
            <input
              type="text"
              class="memberMail2"
              name="memberMail2"
              placeholder="인증번호"
              disabled
            />
          </div>
          <div class="join__chk join__mail__chk"></div>
          <div class="join__addr1">
            <span class="join__addr1__left"
              ><input
                type="text"
                class="memberAddr1"
                name="memberAddr1"
                placeholder="우편번호"
                readonly
            /></span>
            <span class="join__btn" onclick="execution_daum_address()">
              검색
            </span>
          </div>
          <div class="join__addr2">
            <input
              type="text"
              class="memberAddr2"
              name="memberAddr2"
              placeholder="주소"
              readonly
            />
          </div>
          <div class="join__addr3">
            <input
              type="text"
              class="memberAddr3"
              name="memberAddr3"
              placeholder="상세주소"
              readonly
            />
          </div>
          <div class="join__chk join__addr__chk"></div>
          <div class="join__sub">
            <input type="submit" class="join__submit" value="회원가입" />
          </div>
        </form>
      </div>
    </section>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    
    // 중복검사
    var code = ''; //이메일전송 인증번호 저장위한 코드
    
    /* 유효성 검사 통과유무 변수 */
    var idCheck = false; // 아이디
    var idckCheck = false; // 아이디 중복 검사
    var pwCheck = false; // 비번
    var pwckCheck = false; // 비번 확인
    var pwckcorCheck = false; // 비번 확인 일치 확인
    var nameCheck = false; // 이름
    var mailCheck = false; // 이메일
    var mailnumCheck = false; // 이메일 인증번호 확인
    var addressCheck = false; // 주소
    
    
      // 회원가입 기능 작동
      $(document).ready(function () {
        $('.join__submit').click(function () {
          //입력창 값 불러와서 변수선언
          var id = $('.memberId').val();
          var pw = $('.memberPw').val();
          var pw2 = $('.memberPw2').val();
          var name = $('.memberName').val();
          var phone = $('.memberPhone').val();
          var mail = $('.memberMail').val();
          var addr = $('.memberAddr3').val();

          /* 아이디 유효성 검사*/
          if (id == '') {
            $('.join__id__chk').text('아이디를 입력하세요');
            idCheck = false;
          } else {
            idCheck = true;
          }

          /* 비밀번호 유효성 검사*/
          if (pw == '') {
            $('.join__pw__chk').text('비밀번호 입력하세요');
            pwCheck = false;
          } else {
            pwCheck = true;
          }
          
          /* 비밀번호 확인 유효성 검사 */
  			if(pw2 == ""){
  			$('.join__pw__chk').text('비밀번호 확인을 입력하세요');
  			pwckCheck = false;
  		}else{
  			pwckCheck = true;
  		}
          

          /* 이름 유효성 검사*/
          if (name == '') {
            $('.join__name__chk').text('이름을 입력하세요');
            nameCheck = false;
          } else {
            nameCheck = true;
          }

          /* 전화번호 유효성 검사*/
          if (phone == '') {
            $('.join__phone__chk').text('전화번호를 입력하세요');
            phoneCheck = false;
          } else {
            phoneCheck = true;
          }

          /* 이메일 유효성 검사*/
          if (mail == '') {
            $('.join__mail__chk').text('이메일을 입력하세요');
            mailCheck = false;
          } else {
            mailCheck = true;
          }

          /* 주소 유효성 검사*/
          if (addr == '') {
            $('.join__addr__chk').text('주소를 입력하세요');
            addressCheck = false;
          } else {
        	addressCheck = true;
          }

          /* 최종 유효성 검사 */
          if (
            idCheck &&
            idckCheck &&
            pwCheck &&
            pwckCheck &&
            pwckcorCheck &&
            nameCheck &&
            phoneCheck &&
            mailCheck &&
            mailnumCheck &&
            addressCheck
          ) {
            $('#joinForm').attr('action', '../member/join_ok');
            $('#joinForm').submit();
          }
          return false;
        });
      });

     

      //아이디 중복 검사
      $('.memberId').on('propertychange change keyup paste input', function () {
        //console.log("keyup 테스트");
        var memberId = $('.memberId').val(); // .id_input에 입력되는 값
        var data = { memberId: memberId }; // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

        $.ajax({
          type: 'post',
          url: '../member/idCheck',
          data: data,
          success: function (result) {
            //console.log("성공 여부" + result);
            if (result != 'fail') {
              $('.join__id__chk').text('회원 가입 가능한 아이디 입니다.');
              $('.join__id__chk').css('color', 'blue');
              idckCheck = true; // 아이디 중복이 없는 경우
            } else {
              $('.join__id__chk').text('중복된 아이디입니다.');
              $('.join__id__chk').css('color', 'red');
              idckCheck = false; // 아이디 중복된 경우
            }
          }, // success 종료
        }); // ajax 종료
      }); // function 종료

      /* 인증번호 이메일 전송 */
      $('#joinEmailCheck').click(function () {
        var email = $('.memberMail').val(); // 입력한 이메일
        var cehckBox = $('.memberMail2'); // 인증번호 입력란
        var boxWrap = $('.join__mail2'); // 인증번호 입력란 박스
        var warnMsg = $('.join__mail__chk'); // 이메일 입력 경고글

        /* 이메일 형식 유효성 검사 */
        if (mailFormCheck(email)) {
          warnMsg.html('이메일이 전송 되었습니다. 이메일을 확인해주세요.');
          //warnMsg.css('display', 'inline-block');
        } else {
          warnMsg.html('올바르지 못한 이메일 형식입니다.');
          //warnMsg.css('display', 'inline-block');
          return false;
        }

        $.ajax({
          type: 'GET',
          url: 'mailCheck?email=' + email,
          success: function (data) {
            //console.log("data : " + data);
            cehckBox.attr('disabled', false);
            //boxWrap.attr('id', 'mail_check_input_box_true');
            code = data;
          },
        });
      });

      /* 인증번호 비교 */
      $('.memberMail2').blur(function () {
        var inputCode = $('.memberMail2').val(); // 입력코드
        var checkResult = $('.join__mail__chk'); // 비교 결과

        if (inputCode == code) {
          // 일치할 경우
          checkResult.html('인증번호가 일치합니다.');
          //checkResult.attr('class', 'correct');
          mailnumCheck = true;
        } else {
          // 일치하지 않을 경우
          checkResult.html('인증번호를 다시 확인해주세요.');
          //checkResult.attr('class', 'incorrect');
          mailnumCheck = false;
        }
      });
      /* 다음 주소 연동 */
      function execution_daum_address() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') {
              // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
            } else {
              // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== '' && data.apartment === 'Y') {
                extraAddr +=
                  extraAddr !== ''
                    ? ', ' + data.buildingName
                    : data.buildingName;
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraAddr !== '') {
                extraAddr = ' (' + extraAddr + ')';
              }
              // 주소변수 문자열과 참고항목 문자열 합치기
              addr += ' ';
            } else {
              document.getElementById('sample6_extraAddress').value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('.memberAddr1').val(data.zonecode);
            // 커서를 상세주소 필드로 이동한다.
            $('.memberAddr2').val(addr);
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $('.memberAddr3').attr('readonly', false);
            $('.memberAddr3').focus();
          },
        }).open();
      }

      /* 비밀번호 확인 일치 유효성 검사 */

      $('.memberPw2').on(
        'propertychange change keyup paste input',
        function () {
          var pw = $('.memberPw').val();
          var pwck = $('.memberPw2').val();

          if (pw == pwck) {
            $('.join__pw__chk').text('비밀번호가 일치합니다.');
            $('.join__pw__chk').css('color', 'blue');
            pwckcorCheck = true;
          } else {
            $('.join__pw__chk').text('비밀번호가 불일치합니다.');
            $('.join__pw__chk').css('color', 'red');
            pwckcorCheck = false;
          }
        }
      );

      /* 입력 이메일 형식 유효성 검사 */
      function mailFormCheck(email) {
        var form =
          /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return form.test(email);
      }
    </script>
  </body>
</html>
