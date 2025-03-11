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
          <h2><span>Upload Status </span></h2>
          <p>&nbsp;</p>
            <%
	String s1="",s2="No",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0;
			try 
	{		
		long stime=System.currentTimeMillis();
				
			String dname=(String)application.getAttribute("doname");
			String id=request.getParameter("usid");
			
			
			
			
			String str="select * from ownerfiles where id='"+id+"'";
			ResultSet rs= connection.createStatement().executeQuery(str);
			if(rs.next())
			{
				i=rs.getInt(1);
				s2=rs.getString(2); // Fname
				s3=rs.getString(3);
				s4=rs.getString(4);
				s5=rs.getString(5);
				s6=rs.getString(6);
				s7=rs.getString(7);
				s8=rs.getString(8);
				
      		String keys=s5;
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String cont = new String(Base64.encode(s3.getBytes()));
      			String dt = new String(Base64.encode(s7.getBytes()));
				
				

			String namefile=request.getRealPath("file");
      		PrintStream p = new PrintStream(new FileOutputStream(namefile+"/"));
			p.print(new String(cont));
      		String h1="";
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(namefile+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
			String str1="select * from cloudserver where fname='"+s2+"' ";
			ResultSet rs1= connection.createStatement().executeQuery(str1);
			if(rs1.next()==true)
			{
			
			 String cfname=rs1.getString(2);
			 String ctrap=rs1.getString(11);
			 
			 if(ctrap.equals(h1)  )
			 {
				%>
						<h2 class="style2" >Deduplication Occures !!! Avoid this File To Upload</h2><br />
				<%
	
			}
			else 
				{
				
				Statement st=connection.createStatement();
			st.executeUpdate("insert into  cloudserver(fname,ct,cont_k,sec_k,rank,dt,downer,download_per,search_per,trapdoor) values ('"+s2+"','"+cont+"','"+s5+"','"+s4+"','"+s6+"','"+dt+"','"+s8+"','No','No','"+h1+"')");	
			
			st.executeUpdate("delete from ownerfiles where id='"+id+"'");
			
			
			
							long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+s2+"','"+ttime+"','"+tpt+"')"); 
										
			
			
			%>
						<h2 class="style2" >File Uploaded Sucessfully</h2><br />
				<%
				}
				
				
				}
				
				else if(rs1.next()==false)
				{
				Statement st=connection.createStatement();
			st.executeUpdate("insert into  cloudserver(fname,ct,cont_k,sec_k,rank,dt,downer,download_per,search_per,trapdoor) values ('"+s2+"','"+cont+"','"+s5+"','"+s4+"','"+s6+"','"+dt+"','"+s8+"','No','No','"+h1+"')");	
			
			st.executeUpdate("delete from ownerfiles where id='"+id+"'");
			
			
			
							long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+s2+"','"+ttime+"','"+tpt+"')"); 
										
			
			
			%>
						<h2 class="style2" >File Uploaded Sucessfully</h2><br />
				<%
				
				
				}

	}	
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%><div align="right"><a href="DO_Upload.jsp">Back</a></div>
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
