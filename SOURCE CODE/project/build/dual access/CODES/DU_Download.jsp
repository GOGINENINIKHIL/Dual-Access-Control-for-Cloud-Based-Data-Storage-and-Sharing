<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data User </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {	color: #666666;
	font-weight: bold;
}
.style34 {color: #FF0000; font-size: 24px;}
.style38 {font-size: 14px; color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style34">Dual Access Control for Cloud-Based Data Storage and Sharing</a><a href="index.html"></a><a href="index.html"></a><a href="index.html"></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="DU_Main.jsp">User</a></li>
          <li><a href="DU_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span> Download   </span> File</h2>
          <p><span class="style1">Role : (<%=application.getAttribute("urole")%>)</span> </p>
          <p>&nbsp;</p>
          <form action="DU_Download1.jsp" method="post" id="form1">
            <table width="509" style="border-collapse:collapse" cellpadding="0" cellspacing="0" height="241" border="0" align="center">
              <tr>
                <td width="212" height="40" bgcolor="#FFFF00"><span class="style38">Enter File Name : </span></td>
                <td width="342"><label>
                  <input required="required" name="t1" type="text" size="40" />
                </label></td>
              </tr>
              <tr>
                <td height="40" bgcolor="#FFFF00"><span class="style38">Trapdoor :</span></td>
                <td><input name="t12" type="text" size="40" /></td>
              </tr>
              <tr>
                <td height="40" bgcolor="#FFFF00"><span class="style38">Content Key :</span></td>
                <td><input name="t13" type="text" size="40" /></td>
              </tr>
              <tr>
                <td height="40" bgcolor="#FFFF00"><span class="style38">Secret Key :</span></td>
                <td><input name="t132" type="text" size="40" /></td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td><label>
                    <div align="left">
                      <input type="submit" name="Submit" value="Req Keys" />
                      <input type="submit" name="Submit2" value="Download" />
                    </div>
                  </label></td>
              </tr>
            </table>
          </form>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p align="right"><a href="DU_Search.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
            <li><a href="DU_Main.jsp">Home</a></li>
            <li><a href="DU_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
<div align=center></div>
</body>
</html>
