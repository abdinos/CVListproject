<%--
  Created by IntelliJ IDEA.
  User: a18013526
  Date: 11/11/2022
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/jsp/header.jsp"%>

<c:url var="home" value="/aaa" />
<c:url var="app" value="/app.js" />

<div id="myApp">
    <div class="container">
        <h1> My CVs</h1>
        <form action="/result/find" id="searchForm" >
            <button class="btnSearchInput" type="button"><i class="fas fa-search"></i></button>
            <input  class="searchInput" type="search" placeholder="Rechercher..." aria-label="Search" name="name">
        </form>
        <h1>resultat</h1>
        <table class="table">
            <tr>
                <th>CV</th>
                <th>voir CV </th>
            </tr>
            <c:forEach items="${cvResult}" var="cv">
                <tr>
                    <td> <c:out value="${cv.cvName}" /> </td>
                    <td><button v-on:click="getCvActivities(${cv.id})">Montrer</button></td>
                </tr>
            </c:forEach>
        </table>

        <div v-if="(cv != null)">
            <h1>CV</h1>
            <p>nom : {{cv.cvName}}</p>
            <h1>Liste des activities</h1>
            <table class="table">
                <tr>
                    <th>Titre</th>
                    <th>Description</th>
                    <th>Site</th>
                    <th>Annee</th>
                </tr>
                <tr v-for="activity in cv.activities">
                    <td>{{activity.title}}</td>
                    <td>{{activity.description}}</td>
                    <td>{{activity.website}}</td>
                    <td>{{activity.year}}</td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script src="${app}"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>
