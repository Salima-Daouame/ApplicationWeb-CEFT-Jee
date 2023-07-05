
<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!--   <link rel="stylesheet" href="css/swiper-bundle.min.css" /> --> 
  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<link rel="stylesheet" href="css/Style_contact.css" />
</head>
<body>

<%@ include file="HeaderNav.jsp" %>

<div class="container">
    <div class="content">
      <div class="left-side">
        <div class="address details">
          <a href="https://goo.gl/maps/pmhu9qvkCuyFJewC6" target="_blank"><i class="fas fa-map-marker-alt"></i></a>
        <div class="topic"> <a href="https://goo.gl/maps/pmhu9qvkCuyFJewC6" target="_blank">Address</a></div>
          <div class="text-one">Elmassire,</div>
          <div class="text-two">Tiznit</div>
        </div>
        <div class="phone details">
          <i class="fas fa-phone-alt"></i>
          <div class="topic">Phone</div>
          <div class="text-one">+212 513 450 811</div>
          <div class="text-two">+212 643 184 678</div>
        </div>
       
        <div class="email details">
         <a href="https://mail.google.com/mail/u/0/#inbox?compose=DmwnWrRrlqzSsxCfCLGcnPdSnKtbFXpcsfGpPCdvWzbkRPPFpKdqQHzzQdnVGBTdvgPtHVSzJXkl" target="_blank"> <i class="fas fa-envelope"></i></a>
          <div class="topic"> <a href="https://mail.google.com/mail/u/0/#inbox?compose=DmwnWrRrlqzSsxCfCLGcnPdSnKtbFXpcsfGpPCdvWzbkRPPFpKdqQHzzQdnVGBTdvgPtHVSzJXkl" target="_blank">Email</a></div>
          <div class="text-one">ceft@gmail.com</div>
          <div class="text-two">centreformation_tiznit@gmail.com</div>
        </div>
      </div>
      <div class="right-side">
        <div class="topic-text">envoyez-nous un message</div>
        <p>Si vous avez du travail de ma part ou des questions liees à mon tutoriel, vous pouvez me envoyer un message ici. C est avec plaisir que je vous aide.</p>
      <form id="frmContact" name="frmContact" action="MessageContact" method="POST" >
     
        <div class="input-box">
        <input type="text" placeholder="Entrer ton nom" value="<c:out value='${Message.NomPersonne}'/>" class="form-control"
						name="NomPersonne" required="required">  </div>
        <div class="input-box">
        <input type="Email" placeholder="Entrer ton e-mail" value="<c:out value='${Message.Email}'/>" class="form-control"
						name="Email" required="required"> 
        </div>
        <div class="input-box message-box">
        <input type="text" placeholder="Entrer ton message" value="<c:out value='${Message.MessageEnvoye}'/>" class="form-control"
						name="MessageEnvoye" required="required"> 
        </div>
        <div class="button">
    <button type="submit" >Envoyer</button>    </div>
          
      </form>
    </div>
    </div>
  </div>
</body>



 <%@ include file="Footer.jsp" %>
</html>