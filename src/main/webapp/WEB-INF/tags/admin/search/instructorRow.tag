<%@ tag description="instructorResultsTable.tag - instructor results row" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="teammates.common.util.Const" %>
<%@ attribute name="instructor" type="teammates.ui.template.AdminSearchInstructorRow" required="true" %>

<tr id="${instructor.id}"  class="instructorRow">

    <%-- Course --%>
    <c:choose>
        <c:when test="${not empty instructor.courseName}">
            <td data-toggle="tooltip" data-placement="top" title="${instructor.courseName}">
                ${instructor.courseId} 
            </td>
        </c:when>
        <c:otherwise>
            <td>${instructor.courseId}</td>
        </c:otherwise>
    </c:choose>
    
    <%-- Name --%>
    <td>${instructor.name}</td>
    
    <%-- Google ID --%>
    <td> 
        <a href="${instructor.googleIdLink}" target="blank" class="homePageLink">
            ${empty instructor.googleId ? "" : instructor.googleId} <%-- also checks if it is null --%>
        </a>                              
    </td>
    
    <%-- Institute --%>
    <td>${empty instructor.institute ? "" : instructor.institute}</td> <%-- also checks if it is null --%>
    
    <%-- Options --%>
    <td>
        <c:if test="${not empty instructor.viewRecentActionsId}">
            <form method="post" target="blank" action="<%=Const.ActionURIs.ADMIN_ACTIVITY_LOG_PAGE%>">
                <button type="submit" id="${instructor.viewRecentActionsId}_recentActions"
                        class="btn btn-link btn-xs recentActionButton">
                        
                    <span class="glyphicon glyphicon-zoom-in"></span>View Recent Actions
                </button>
                <input type="hidden" name="filterQuery" value="person:${instructor.viewRecentActionsId}">
            </form>
        </c:if>
    </td>
</tr>    
                                  
<tr class="has-danger list-group fslink fslink_instructor fslink${instructor.id}" style="display: none;">
    <td colspan="5">
        <ul class="list-group">
            <%-- Email --%>
            <li class="list-group-item list-group-item-success has-success">
                <strong>Email</strong>
                <input value="${instructor.email}" readonly="readonly" class="form-control" />
            </li>
             
             <%-- Course join link --%>
            <c:if test="${not empty instructor.courseJoinLink}">
                <li class="list-group-item list-group-item-info">
                    <strong>Course Join Link</strong>
                    <input value="${instructor.courseJoinLink}" readonly="readonly" class="form-control" />
                </li>
            </c:if>                               
        </ul>
    </td>
</tr>                 
