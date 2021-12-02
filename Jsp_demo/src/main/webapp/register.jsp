<%@page import="com.demo.mypackage.StoreData"%>
<jsp:useBean id="obj" class="com.demo.mypackage.Employee">
</jsp:useBean>
<jsp:setProperty property="*" name="obj" />
<%
int i = StoreData.register(obj);
if (i > 0) {
%>
<%@ include file="main.html"%>
<%
}
%>


