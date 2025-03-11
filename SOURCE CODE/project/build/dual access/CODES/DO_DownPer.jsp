<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<body>
<html>		  
 <%

try
	{
		String id=request.getParameter("usid");
		
		String query1="select * from cloudserver where id='"+id+"'";
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(query1);
		while(rs.next())
		{
			String s2=rs.getString(2);
			String s3=rs.getString(8);
			
			String query="select * from download_perm where fname='"+s2+"' and owner='"+s3+"'";
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query);
			if(rs1.next())
			{
				response.sendRedirect("DO_DownloadPer.jsp?id="+id+"");
			}
			else
			{
				String query2="insert into download_perm(owner,fname,doctor_per,nurse_per,cardiologist_per) values ('"+s3+"','"+s2+"','No','No','No')";
				Statement st2=connection.createStatement();
				st2.executeUpdate(query2);
				
				response.sendRedirect("DO_DownloadPer.jsp?id="+id+"");
			}
		}
		connection.close();
	}
	catch(Exception e)
	{
	out.println(e);
	}

%>

</body></html>
