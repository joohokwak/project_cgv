<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   /* Remove the navbar's default margin-bottom and rounded borders */ 
   
   .navbar {
     margin-bottom: 0;
     border-radius: 0;
   }
</style>
<div class="container text-left" style="margin-left: 10px">
    <h1>Admin page</h1>      
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/">Main</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/admin/main">Admin Home</a></li>
        <li><a href="#">회원관리</a></li>
        <li><a href="#">게시판관리</a></li>
        <li><a href="#">영화관리</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      </ul>
    </div>
  </div>
</nav>
