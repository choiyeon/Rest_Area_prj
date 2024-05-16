<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="searchRestArea.SearchRestAreaDAO"%>
<%@ page import="searchRestArea.RouteVO"%>
<%@ page import="java.util.List"%>

<%
String routeId = request.getParameter("routeId");
SearchRestAreaDAO sraDAO = SearchRestAreaDAO.getInstance();
List<RouteVO> routeList = null;


    routeList = sraDAO.searchByRoute(routeId);

%>
<div class="container">
    <div class="row">
        <%
        if (routeList != null && !routeList.isEmpty()) {
            for (RouteVO route : routeList) {
        %>
        <div class="col-md-12">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm position-relative">
                <div class="col p-4 d-flex flex-column position-static">
                    <div class="mb-0 rest_area_link">
                        <a href="#"><span data-lat="<%= route.getRestAreaLatitude() %>" data-lng="<%= route.getRestAreaLongitude() %>"></span><%= route.getRaName() %></a>
                    </div>
                    <div class="mb-1 text-body-secondary"><%= route.getRaAddr() %></div>
                    <p class="mb-auto">전화번호: <%= route.getRaTel() %></p>
                    <div class="rest_area_detail">
                        <a href="http://localhost/Rest_Area_prj/rest_area_detail_page/rest_area_detail_page.jsp?raNum=<%= route.getRaNum() %>&raName=<%= route.getRaName() %>&addr=<%= route.getRaAddr() %>" class="icon-link gap-1 icon-link-hover stretched-link">
                            <%= route.getRaName() %> 상세페이지
                        </a>
                    </div>
                </div>
                <div class="col-auto d-none d-lg-block">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="200" height="250" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
  <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5M4 15h3v-5H4zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1zm3 0h-2v3h2z"/>
					</svg>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-md-12">
            <p>해당 고속도로에 휴게소가 없습니다.</p>
        </div>
        <%
        }
        %>
    </div>
</div>
