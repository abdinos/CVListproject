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
    <nav class="navbar navbar-dark bg-dark">
        <div class="d-flex justify-content-start">
            <a class="btn btn-outline-light" href="/cvList">Resumes</a>
        </div>
        <div class="d-flex justify-content-end">
            <a class="btn btn-outline-light" href="/profile">Profile</a>
        </div>
        <%--            <a class="navbar-brand" href="/logout">Logout</a>--%>
    </nav><br>
    <div class="container">
        <h1> Search Result</h1>
        <table class="table">
            <c:forEach items="${cvResult}" var="cv">
                <tr>
                    <td> <c:out value="${cv.cvName}" /> </td>
                    <td><button v-on:click="getCvActivities(${cv.id})">Montrer</button></td>
                </tr>
            </c:forEach>
        </table>
        <table class="table">
            <c:forEach items="${personResult}" var="person">
                <tr>
                    <td> <c:out value="${person.firstName}" /> </td>
                    <td> <c:out value="${person.lastName}" /> </td>
                    <td><button v-on:click="getCvActivities(${person.curriculumVitae.id})">Montrer</button></td>
                </tr>
            </c:forEach>
        </table>


        <div v-if="(cv != null)">
            <h1>Personne</h1>
            <p>nom : {{cv.person.firstName}} {{cv.person.lastName}}</p>
            <h1>CV</h1>
            <p>nom : {{cv.cvName}}</p>
            <h1>Liste des activities</h1>
            <table class="table">
                <tr>
                    <th>Titre</th>
                    <th>Description</th>
                    <th>Nature</th>
                    <th>Website</th>
                    <th>Year</th>
                </tr>
                <tr v-for="activity in cv.activities">
                    <td>{{activity.title}}</td>
                    <td>{{activity.description}}</td>
                    <td>{{activity.nature}}</td>
                    <td>{{activity.website}}</td>
                    <td>{{activity.year}}</td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script src="${app}"></script>

<%@ include file="/WEB-INF/jsp/footer.jsp"%>

