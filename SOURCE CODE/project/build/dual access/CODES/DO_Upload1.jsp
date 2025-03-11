<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {color: #00a0cb}
.style2 {color: #000000}
.style34 {color: #FF0000; font-size: 24px;}
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
          <li class="active"><a href="DO_Main.jsp">Data Owner </a></li>
          <li><a href="DO_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span> File Keys </span></h2>
          <p><em><strong> Request Master Secret Key(MSK) And Content Key To Authority And Then Upload . </strong></em></p>
          <form id="form1" name="form1" method="post" action="DO_Upload2.jsp">
          <table width="819" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0;
			try 
	{		
		
				
			String dname=(String)application.getAttribute("doname");
			String fname=request.getParameter("fname");
			
			if(fname.equalsIgnoreCase("--Select File--"))
			{
			%>
						<h2 class="style2" >Select File To Upload</h2><br />
				<%
			
			}
			else
			{
			%>
            <tr>
              <td width="61" height="30"><div align="center" class="style21 style1"><strong><span class="style23"> ID </span></strong></div></td>
              <td width="111"><div align="center" class="style21 style1"><strong><span class="style23">File Name </span></strong></div></td>
              <td width="145"><div align="center" class="style21 style1"><strong><span class="style23">Date &amp; Time </span></strong></div></td>
              <td width="125"><div align="center" class="style21 style1"><strong><span class="style23">Content Key </span></strong></div></td>
              <td width="125"><div align="center" class="style21 style1"><strong><span class="style23">Master Secret Key </span></strong></div></td>
              <td width="125"><div align="center" class="style21 style1"><strong><span class="style23">Upload File</span></strong></div></td>
            </tr>
            <%
			String str="select * from ownerfiles where fname='"+fname+"'";
			ResultSet rs= connection.createStatement().executeQuery(str);
			if(rs.next())
			{
				i=rs.getInt(1);
				s2=rs.getString(2);
				s3=rs.getString(3);
				s4=rs.getString(4);
				s5=rs.getString(5);
				s6=rs.getString(6);
				s7=rs.getString(7);
				s8=rs.getString(8);
				
				
				
				
				
				
					%>
					<tr>
					<td height="28"><div align="center" class="style2"><%=i%></div></td>
					<td><div align="center" class="style2"><%=s2%></div></td>
					<td><div align="center" class="style2"><%=s7%></div></td>
					
					<%	
					if(s5.equalsIgnoreCase("No"))
					{
						%>
						<td><div class="style2">
						<div align="center"><a href="DO_ReqCK.jsp?usid=<%=i%>">Request Key</a></div>
						</div></td>
						<%
					}
					else
					{
						%>
						<td><div>
						<div align="center"><%=s5%></div>
						</div></td>
						<%
					}
					
					if(s4.equalsIgnoreCase("No"))
					{
						%>
						<td><div class="style2">
						<div align="center"><a href="DO_ReqMSK.jsp?usid=<%=i%>">Request Key</a></div>
						</div></td>
						<%
					}
					else
					{
						%>
						<td><div>
						<div align="center"><%=s4%></div>
						</div></td>
						
						<%
					}
					if(s4.equalsIgnoreCase("No")||s4.equalsIgnoreCase("Requested")||s5.equalsIgnoreCase("No")||s5.equalsIgnoreCase("Requested"))
					{
					%>
						<td>
						<div align="center"><h3>Keys Required To Upload</h3>
						</div></td>
						<%
					}
					else
					{
						
							%>
						<td>
						<div align="center">
						<input  type="hidden"  name="usid" value="<%=i%>" />
						<input type="submit" name="Submit" value="Upload File" />
						</div></td>
						<%
					}
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
          <table width="804" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <th width="817" scope="row"><div align="right"><a href="DO_Upload.jsp">Back</a></div></th>
            </tr>
          </table>
          </form>
          <p>&nbsp;</p>
        </div>
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
