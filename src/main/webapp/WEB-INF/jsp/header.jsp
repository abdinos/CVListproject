<%--
  Created by IntelliJ IDEA.
  User: a18013526
  Date: 06/11/2022
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html; charset=UTF-8" %>


<c:url var="bootstrap_css"
       value="/webjars/bootstrap/4.6.0-1/css/bootstrap.min.css" />
<c:url var="bootstrap_js"
       value="/webjars/bootstrap/4.6.0-1/js/bootstrap.min.js" />
<c:url var="jquery_js" value="/webjars/jquery/3.5.1/jquery.min.js" />
<c:url var="css" value="/style.css" />


<c:url var="vue_js" value="/webjars/vue/3.2.19/dist/vue.global.js" />
<c:url var="axios_js" value="/webjars/axios/0.22.0/dist/axios.min.js" />
<c:url var="vue_router_js" value="/webjars/vue-router/4.1.5/dist/vue-router.global.js" />

<html>
<head>
    <meta charset="UTF-8">
    <title>Spring boot application</title>
    <link rel="stylesheet" href="${css}">
    <link rel="stylesheet" href="${bootstrap_css}">
    <script src="${jquery_js}"></script>
    <script src="${bootstrap_js}"></script>
    <script src="${vue_js}"></script>
    <script src="${axios_js}"></script>
    <script src="${vue_router_js}"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

</head>
<body>

