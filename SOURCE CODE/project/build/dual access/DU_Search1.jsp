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
.style35 {color: #FF0000}
.style36 {font-weight: bold; font-size: 24;}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style34">Dual Access Control for Cloud-Based Data Storage and Sharing</a><a href="index.html"></a><a href="index.html"></a><a href="index.html"></a><a href="index.html"></a></h1>
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
          <h2><span> Search  </span> Files </h2>
          <p><span class="style1">Role : (<%=application.getAttribute("urole")%>)</span></p>
          <p>&nbsp;</p>
          <table width="524" border="1.5" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="74" height="29" bgcolor="#FFFF00"><div align="center" class="style35"><span class="style36">File ID </span></div></td>
              <td width="144" bgcolor="#FFFF00"><div align="center" class="style35"><span class="style36">File Name </span></div></td>
              <td width="124" bgcolor="#FFFF00"><div align="center" class="style35"><span class="style36">Rank </span></div></td>
              <td width="172" bgcolor="#FFFF00"><div align="center" class="style35"><span class="style36">Download</span></div></td>
            </tr>
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
    String user=(String)application.getAttribute("uname");
try 
  {
            String keyword = request.getParameter("t14");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		String search = new String(Base64.encode(keyword.getBytes()));
			
			
			String strQuery21 ="insert into transaction(user,fname,task,dt) values('"+user+"','"+keyword+"','Search','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery21);
			
			
			String strQuery22 ="insert into search(user,keyword,dt) values('"+user+"','"+keyword+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery22);
			
		String urole=(String)application.getAttribute("urole");
		String role="";
		if(urole.equalsIgnoreCase("Doctor"))
			{
				role="doctor_per";
			}
			else if(urole.equalsIgnoreCase("Nurse"))
			{
				role="nurse_per";
			}
			else if(urole.equalsIgnoreCase("Cardiologist"))
			{
				role="cardiologist_per";
			}
			else
			{}
		
				
				
				String found="NO";
			String query4="select * from cloudserver  "; 
			Statement st4=connection.createStatement();
			ResultSet rs=st4.executeQuery(query4);
			while ( rs.next() )
			{
				s2=rs.getString(2);
					
				
				String Qu = "select * from search_perm where fname='"+s2+"' and "+role+"='Permitted'";
				ResultSet rs11 = connection.createStatement().executeQuery(Qu);
				if(rs11.next()==true)
				{
					String query5="select * from cloudserver where fname='"+s2+"'  "; 
					Statement st5=connection.createStatement();
					ResultSet rs5=st5.executeQuery(query5);
					if ( rs5.next() )
					{
						i=rs5.getInt(1);
						s3=rs5.getString(3);
						s4=rs5.getString(6);
						
						c.init(Cipher.DECRYPT_MODE,key);
						String decryptedValue = new String(Base64.decode(s3.getBytes()));
						
						
						if((decryptedValue.toLowerCase().contains(keyword.toLowerCase()))||(s2.toLowerCase().contains(keyword.toLowerCase())))
						{
								int updaterank = Integer.parseInt(s4)+1;
								String strQuery2 = "update cloudserver set rank='"+updaterank+"' where fname='"+s2+"'";
								connection.createStatement().executeUpdate(strQuery2);
								
								found="YES";
								%>
								<tr>
								<td height="28"><div align="center"><%=i%></div></td>
								<td><div align="center"><%=s2%></div></td>
								<td><div align="center"><%=s4%></div></td>
								<td><div align="center"><a href="DU_DownloadSearch.jsp?fname=<%=s2%>"> <%=s2%> </a></div></td>
								</tr>
								<%
							
						}
					}
				}
					
			}	
			if(found.equals("NO"))
				{ 
					%>
					<h2>No File Found !!! OR NO ACCESS PERMISSION FROM DATA OWNER</h2>
					<%
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
          <p align="right"><a href="DU_Search.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
            <li><a href="DU_Main.jsp">Home</a></li>
            <li><a href="DU_ViewFiles.jsp">View Files </a></li>
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
