<%@ tag description="Student Message of the day" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="teammates.common.util.Config" %>
<c:set var="motdUrl" value="<%= Config.inst().STUDENT_MOTD_URL %>" />
<c:if test="${not empty motdUrl}">
    <script>
        var motdUrl = window.location.origin + '/<c:out value="${motdUrl}" />';
    </script>
    <script type="text/javascript" src="/js/studentMotd.js"></script>
    <div class="container theme-showcase" id="student-motd-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-body padding-top-0">
                        <div class="row">
                            <div class="col-sm-12">
                                <p class="padding-15px margin-0">
                                    <b class="text-color-gray">TEAMMATES Message of the day</b>
                                    &nbsp;
                                    <button type="button" class="close" aria-label="Close" onclick="closeMotd();">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" id="student-motd">
                                <%-- Message of the day loads here --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>