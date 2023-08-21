<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="menu">
		<div class="menu-item" onclick="url('main')"><i class="xi-home xi-x"></i> MAIN</div>
		<div class="menu-item" onclick="url('multiBoard')"><i class="xi-document xi-x"></i> BOARD</div>
		<div class="menu-item" onclick="url('post')"><i class="xi-border-color xi-x"></i> POST</div>
		<div class="menu-item" onclick="url('member')"><i class="xi-group xi-x"></i> MEMBER</div>
		<div class="menu-item" onclick="url('comment')"><i class="xi-comment xi-x"></i> COMMENT</div>
		<div class="menu-item" onclick="url('message')"><i class="xi-message xi-x"></i> MESSAGE</div>
		<div class="menu-item" onclick="url('mail')"><i class="xi-gmail xi-x"></i> MAIL</div>
		<div class="menu-item" onclick="url('notice')"><i class="xi-globus xi-x"></i> NOTICE</div>
		<div class="menu-item" onclick="url('logout')"><i class="xi-power-off xi-x"></i> LOGOUT</div>
	</div>
	<script>function url(url){location.href="./" + url;}</script>
	