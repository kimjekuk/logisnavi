<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="ko">
  <head>
    <title>IamLogis</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>	  
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://use.fontawesome.com/926fe18a63.js"></script>


<style>
	div {
		  width: 100px;
		  height: 100px;
		  background: red;
		  adnimation-name : example;
		  adnimation-duration : 2s;
		}
		
	@keyframes example {
		from { background-color:red; }
		to {background-color:blue;}
	}	
</style>

<script>
	const person = {
		firstName : "John",
		lastName : "Doe"
	}


	
	function test(){

		alert($("div").html());
		
//	$("div").fadeOut("slow");		
//	$("div").fadeToggle("slow",0.2);
		
//	const d = new Date();
//	year = d.getFullYear();
//	alert(year);
//		const cars = ["AAAA","ZZZZ","CCCC"];
//		cars.pop();
//		cars.push("DDDD");
//		cars.sort();
// 		cars.splice(1,2);
//		alert(cars);
//		x = cars[1];	
		
//		let txt = "I can eat bananas all day";
//		x = txt.slice(10,17);
		//		let x = txt.length;
		// x = txt.toUpperCase();
//		alert(person.firstName);
// 		return "return string test";
 	}
 	
 	function change(){
 	 	document.getElementById("demo").innerHTML = test();
 	}
 	
</script>

<body> 


<p>A simple math equation: 
<var>
x
</var>
 = 3 + 2; </p>


<p title="About W3Schoolssss">W3Schools is a web developer's site.</p>

<br><br><br><br><br><br><br><br>
	 <p id="demo">어떤 글</p>
	 <button onclick="test();">test</button>
<br><br>
	 <button onclick="alert('Hello');">Hello</button>
<br><br>
	 <div onclick="this.style.backgroundColor='red'"><p>my div</p></div>

</body>

</html>
