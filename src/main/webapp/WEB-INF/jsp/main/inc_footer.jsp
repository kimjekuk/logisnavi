<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">
				/* 푸터A: 사이트 정보 */
				footer {
				  color : #fff;
				  background-color: #004080;
				}
				
				footer .container{
				    padding: 40px 20px;
				}
				@media (min-width: 768px) {
				  footer .container {
				      display: flex;
				      flex-wrap: wrap;
				      max-width: 1000px;
				      margin-left: auto;
				      margin-right: auto;
				  }
				  .footA{
				    flex : 0 0 40%;
				  }
				  .footB{
				    flex : 0 0 60%;
				  }
				  .footC{
				    flex : 0 0 100%;
				  }
				}
				.footA {
				  margin-bottom: 30px;
				}
				.footA h2 {
				  margin-top: 0;
				  margin-bottom: 10px;
				  font-family: 'Montserrat', sans-serif;
				  font-size: 30px;
				  letter-spacing: 0.2em;
				}
				.footA p {
				  margin-top: 0;
				  margin-bottom: 0;
				  font-size: 14px;
				}
				.footA a {
				  color : inherit;
				  text-decoration: none;
				}
				
				/* 푸터B: 푸터메뉴 */
				.footB div {
				  margin-bottom: 20px;
				}
				.footB h3 {
				  margin-top: 0;
				  margin-bottom: 10px;
				  border-bottom: solid 1px currentColor;
				  font-size: 14px;
				}
				.footB ul {
				  margin: 0;
				  padding: 0;
				  list-style: none;
				}
				.footB a {
				  display: block;
				  padding: 5px;
				  color:inherit;
				  font-size: 12px;
				  text-decoration: none;
				}
				.footB a:hover {
				  background-color: rgba(0, 0, 0, 0.3);
				}
				@media (min-width: 768px) {
					.footB {
						display: flex;
					}
				  .footB div{
				    flex: 1;
				  }
				  .footB div:not(:first-child){
				    margin-left: 40px;
				  }
				}
				
				/* 푸터c: 저작권 */
				.footC {
				  font-size: 12px;
				  text-align: center;
				  font-family: 'Montserrat', sans-serif;
				}
				
				
				/* 푸터d: SNS메뉴 */
				.footD{
				  margin-top: 20px;
				}
				.footD ul {
				  display: flex;
				  margin: 0;
				  padding: 0;
				  list-style: none;
				}
				.footD a {
				  display: block;
				  margin-right: 8px;
				  padding: 0;
				  color:inherit;
				  font-size: 16px;
				  text-decoration: none;
				  border: solid 1px currentColor;
				  width: 2em;
				  line-height: 2em;
				  border-radius: 50%;
				  text-align: center;
				}
				.footD a:hover {
				  background-color: rgba(0, 0, 0, 0.3);
				}
		</style>
</head>
<body>
 
<footer>
  <div class="container">
    <div class="footA">
      <h2>IamLogis</h2>
      <p>
        경기도 안양시 동안구 시민대로 230<br> 평촌아크로타워 B동 302호<br>
        <a href="http://www.iamlogis.com">http://www.iamlogis.com</a><br>
      </p>
      <nav class="footD">
        <ul>
          <li>
            <a href="#">
              <span class="fa fa-twitter" title="twitter"></span>
            </a>
          </li>
          <li>
            <a href="#">
              <span class="fa fa-facebook" title="facebook"></span>
            </a>
          </li>
          <li>
            <a href="#">
              <span class="fa fa-google-plus" title="google plus"></span>
            </a>
          </li>
          <li>
            <a href="#">
              <span class="fa fa-instagram" title="instagram"></span>
            </a>
          </li>
          <li>
            <a href="#">
              <span class="fa fa-youtube" title="youtube"></span>
            </a>
          </li>
      </nav>
    </div>

    <nav class="footB">
      <div>
        <h3>Service</h3>
        <ul>
          <li><a href="#">창고검색</a></li>
          <li><a href="#">지도검색</a></li>
          <li><a href="#">임대문의</a></li>
          <li><a href="#">물류컨설팅</a></li>
          <li><a href="#">창고시뮬레이션</a></li>
        </ul>
      </div>
      <div>
        <h3>Further Info</h3>
        <ul>
          <li><a href="#">오시는길</a></li>
          <li><a href="#">공지사항</a></li>
          <li><a href="#">자주묻는질문</a></li>
          <li><a href="#">문의하기</a></li>
        </ul>
      </div>
    </nav>
    <div class="footC">
      &copy; 2021 IamLogis corp. All rights reserved.
    </div>
  </div>
</footer>
</body>

</html>