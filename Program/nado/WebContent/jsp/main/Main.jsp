<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/Main.css?after"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">	
.window{
     position: relative;
}
#mask{
    display: none;
    background-color: black;
    position: absolute;
    z-index:5;
}
</style>
<script type="text/javascript">

	$(document).ready(function(){
	    $("#writePost").click(function(){
	        maskshow()
	        $(".newPost").show()
	    })
	    	    
	    
	    var file = $(".filebox .upload-hidden")
	    file.on('change', function(){ 	    	
	    	if(window.FileReader){ // modern browser 
	    		var fileup= $(this)[0].files[0].name; 
	    	} else { // old IE var 
	    		fileup = $(this).val().split('/').pop().split('\\').pop(); // ���ϸ� ���� 
	    	}
	    	$(this).siblings(".uploadfile").val(fileup)	    
	    })

	    
	    
	})
	
	function maskshow(){
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();            
		$('#mask').css({'width' : maskWidth, 'height' : maskHeight});
		$("#mask").fadeTo( "slow", 0.5 )
		
	 }
	
	
</script>
</head>
<body>
<div id="mask"></div>
<div class="window">
	<jsp:include page="Header.jsp"/>
	   <section class="p-section">
	       <section class="mini-section">
	           <div class="post">
		           <div class="find">
		           		<ul>
							<li>
								<img class="f-img">
							</li>
		           		</ul>
		           </div>
		           
		       		<ul>
			       		<c:forEach var="meet" items="${meetcards}">
							<li>
								<div class="cardform">
								    <div class="cardtitle">
								        <p class="ctt"><c:out value="${meet.mtitle}"/></p>
								        <P class="cdate"><c:out value="${meet.mdate}"/></P>
								    </div>
								    <div class="cardbody" >
								        <div class="cardimg">
											<img src="${meet.mimg}">
								        </div>
								        <div class="cardcontent">
								            <p class="ccnt"><c:out value="${meet.mcontent}"/></p>
								            <p class="ctag"><c:out value="${meet.maxuser}"/></p>
								        </div>										
								    </div>
								</div>
							</li>
						</c:forEach>
					</ul>          
	           </div>
	           <div class="r-side">
	               <div class="profile">
	                   <img class="myphoto" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/133893295_839193073524616_5799409343695929979_n.jpg?_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_ohc=pFkMnKJxCOAAX9QJPel&tp=1&oh=79a76e50dd7a5069036523a57c71a977&oe=603A0A23">
	                   <p id="userid">${user.uName}</p>
	                   <button id="logout" onclick='location.href="../auth/logout.do"'>�α׾ƿ�</button>
	                   <button id="writePost">post</button>
	                   <button id="test" onclick="location.href='../jsp/myPage/myPage.jsp'">�� �׷�</button>
	                   <button id="test" onclick="location.href='../user/list.do'">ddd</button>
	               </div>
	           </div>
	       </section>
	   </section> 
		        <div class="newPost">
		            nado!
		            <div>
		                <form action="meetAdd.do" method="post">
		                    <table class="rayPost">
		                        <tr>
		                            <td class="title">�� �� �� </td>
		                            <td colspan="3"><input name="mtitle" placeholder="ex)�޲ٹ̰� �԰���� ���̷� ����"></td>
		                        </tr>
		                        <tr>
		                            <td class="title">��������</td>
		                            <td colspan="3">
		                                <select id="select_moption"name="moption">
		                                    <option value="food">����</option>
		                                    <option value="travle">����</option>
		                                    <option value="photo">����</option>
		                                    <option value="movie">��ȭ</option>
		                                    <option value="reading">����</option>
		                                    <option value="volunteer">�ڿ�����</option>
		                                    <option value="health">�</option>
		                                    <option value="buying">����</option>
		                                    <option value="game">����</option>
		                                    <option value="developement">����</option>
		                                    <option value="etc">��Ÿ</option>
		                                </select>
		                            </td>
		                        </tr>
		                        <tr>
		                        	<td class="title">�����ο�</td>
		                            <td colspan="3"><input name="maxuser" placeholder="�ִ� 4��"></td>
		                        </tr>
		                        <tr>
		                            <td class="title">�󼼳���</td>
		                            <td colspan="3"><textarea name="mcontent" placeholder="���� �Է��Ҽ��� nado�� ���� ���Դϴ�"></textarea></td>
		                        </tr>
		                        <tr>
		                            <td colspan="4">
			                            <div class="filebox">
				                            <input class="uploadfile" value="���ϼ���" disabled="disabled">
				                            <label for="editfile">���ε�</label>
				                            <input type="file" id="editfile" class="upload-hidden">
			                            </div>
		                            </td>
		                        </tr>
		                    </table>
		                    <div><button id="crtPost"type="submit">������</button></div>
		                </form>                    
		            </div>
		        </div>
	    </div><!-- window -->
</body>
</html>