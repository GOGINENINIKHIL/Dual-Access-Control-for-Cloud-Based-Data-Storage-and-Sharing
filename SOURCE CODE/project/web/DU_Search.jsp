<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style15 {color: #fff;
	font-weight: bold;
}
.style16 {font-size: 12px;
	color: #FF0000;
}
.style1 {	color: #666666;
	font-weight: bold;
}
.style34 {color: #FF0000; font-size: 24px;}
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
          <form id="form1" method="post" action="DU_Search1.jsp">
            <p>&nbsp;</p>
            <table width="487" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
              <tr>
                <th width="236" height="40" scope="row"><div align="left"><span class="style15"><span class="odd  style16">Enter The Keyword To Search : </span></span></div></th>
                <td width="320"><span class="style15">
                  <input required="required" name="t14" type="text" value="" size="30" />
                </span></td>
              </tr>
            </table>
            <p align="center" class="style15">&nbsp;</p>
            <p align="center">
              <input type="submit" name="Submit2" value="SEARCH" />
            </p>
          </form>
          <p align="justify">&nbsp;</p>
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
