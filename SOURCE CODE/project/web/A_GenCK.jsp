<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Authority </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style24 {color: #FF0000; font-size: 24px;}
.style25 {
	font-size: 14px;
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style24">Dual Access Control for Cloud-Based Data Storage and Sharing</a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="A_Main.jsp">Authority</a></li>
          <li><a href="A_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Generate Content Key </span></h2>
          <p>&nbsp;</p>
          <table width="618" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="66" height="30" bgcolor="#FFFF00"><div align="center" class="style25"> ID </div></td>
              <td width="127" bgcolor="#FFFF00"><div align="center" class="style25">File Name </div></td>
              <td width="155" bgcolor="#FFFF00"><div align="center" class="style25">Date &amp; Time </div></td>
              <td width="116" bgcolor="#FFFF00"><div align="center" class="style25">Owner Name </div></td>
              <td width="123" bgcolor="#FFFF00"><div align="center" class="style25">Content Key </div></td>
              <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{String s="null";
      		String query="select * from ownerfiles ";//where secretkey='Requested'"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(5);
		s4=rs.getString(7);
		s5=rs.getString(8);
		
			
	
		
		%>
            </tr>
            <tr>
              <td height="28"><div align="center"><%=i%></div></td>
              <td><div align="center"><%=s2%></div></td>
              <td><div align="center"><%=s4%></div></td>
              <td><div align="center"><%=s5%></div></td>
              <%
			  if(s3.equalsIgnoreCase("No"))
			{
			
		%>
              <td><div>
                  <div align="center">Not Requested</div>
              </div></td>
              <%
		
			}
			else if(s3.equalsIgnoreCase("Requested"))
			{
			
		%>
              <td><div>
                  <div align="center"><a href="A_GenCK1.jsp?usid=<%=i%>&amp;fname=<%=s4%>">Generate Key</a></div>
              </div></td>
              <%
		
			}else
			{
		%>
              <td width="17"><div>
                  <div align="center"><%=s3%></div>
              </div></td>
            </tr>
            <%
			  }
	  }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
          </table>
          <p>&nbsp;</p>
          <p align="right"><a href="A_Main.jsp">Back</a></p>
          <p align="justify">&nbsp;</p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
            <li><a href="A_Main.jsp">Home</a></li>
            <li><a href="A_Login.jsp">Logout</a></li>
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
