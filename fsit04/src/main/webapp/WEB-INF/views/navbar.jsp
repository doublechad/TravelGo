<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-md navbar-dark fixed-top cell" id="title_nav" style="background:#99BBFF;">
  <a class="navbar-brand" href="./" id="tilte_bt">TravelGO</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"style="border-width:2px">
    <span class="navbar-toggler-icon" id="sp"></span>
  </button>
  <div class="collapse navbar-collapse " id="collapsibleNavbar">
    <ul class="navbar-nav" >
      <li class="nav-item"style="color:black">
        <a class="nav-link" href="./gmap" style="color:black;text-align:center">行程規劃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./album"style="color:black;text-align:center">相片集</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./tourism"style="color:black;text-align:center">景點介紹</a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item"  >
        <a class="nav-link sign" href="./sign"title="Sign"style="border-style:dashed;text-align:center">登入</a>
      </li>
    </ul>
  </div>
</nav>