<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Authority Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style24 {color: #FF0000; font-size: 24px;}
.style25 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style24">Dual Access Control for Cloud-Based Data Storage and Sharing</a><a href="index.html"></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="DO_Login.jsp">Data Owner </a></li>
          <li><a href="DU_Login.jsp">User</a></li>
          <li><a href="A_Login.jsp">Authority</a></li>
          <li><a href="C_Login.jsp">Cloud</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Authentication Login </span></h2>
          <p><img src="images/Login.jpg" width="176" height="138" /></p>
          <form action="A_Authentication.jsp" method="post" id="leavereply">
            <p class="style25"><strong>Name (required)&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </label>
              <input name="userid" type="text" class="box" id="name" value="" />
            </strong></p>
            <p><span class="style25"><strong> Password (required</strong></span>)&nbsp;&nbsp;&nbsp;
                </label>
                <input type="password" id="pass" name="pass" class="box" />
            </p>
            <p>&nbsp; </p>
            <input name="imageField" type="submit"  class="LOGIN" id="imageField" value="Login" />
            <input type="reset" name="imageField" id="imageField"  class="RESET" />
          </form>
          <p>&nbsp;</p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
            <li><a href="DU_Login.jsp">User</a></li>
            <li><a href="C_Login.jsp">Cloud</a></li>
            <li><a href="A_Login.jsp">Authority</a></li>
            <li><a href="DO_Login.jsp">Data Owner</a></li>
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