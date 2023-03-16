<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> cooklist = (List<ClsDto>)request.getAttribute("cookReclist");
List<ClsDto> designlist = (List<ClsDto>)request.getAttribute("designReclist");
%>

<h2>추천 클래스</h2>

<div style="height: 300px; position: relative; padding: 0 30px">
	<h3 style="text-align: left;">요리</h3>
	<a href="/LearnRun/cls?category=cook" class="btn btn-dark" style="font-size: 10pt;position: absolute;top: 0;right: 0;margin-right: 30px;">요리 클래스 더보기</a>
	<hr>
	<table width="100%" border="1" style="text-align: center; padding-left: 10%; padding-right: 10%;">
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
	
		<tbody>
			<%
			if(cooklist == null || cooklist.size() == 0){
			%>
				<tr>
					<td colspan="4">클래스가 없습니다.</td>
				</tr>
			<%
			}
			else {
				int i = 0;
				while(i<cooklist.size())
				{
					%>
					<tr>
						<%
						for(int j=0; i<cooklist.size()&&j<4; j++){
							ClsDto cls = cooklist.get(i);
							%>
							<td>
								<a href="clsDetail?seq=<%=cls.getSeq() %>">
									<%=cls.getTitle() %>
								</a>
							</td>
							<%
							i++;
						}
						%>
					</tr>
					<%
				}
			}
			%>
		</tbody>
	</table>
</div>

<div style="height: 300px; position: relative; padding: 0 30px">
	<h3 style="text-align: left;">디자인</h3>
	<a href="/LearnRun/cls?category=design" class="btn btn-dark" style="font-size: 10pt;position: absolute;top: 0;right: 0;margin-right: 30px;">디자인 클래스 더보기</a>
	<hr>
	<table width="100%" border="1" style="text-align: center; padding-left: 10%; padding-right: 10%;">
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
	
		<tbody>
			<%
			if(designlist == null || designlist.size() == 0){
			%>
				<tr>
					<td colspan="4">클래스가 없습니다.</td>
				</tr>
			<%
			}
			else {
				int i = 0;
				while(i<designlist.size())
				{
					%>
					<tr>
						<%
						for(int j=0; i<designlist.size()&&j<4; j++){
							ClsDto cls = designlist.get(i);
							%>
							<td>
								<a href="clsDetail?seq=<%=cls.getSeq() %>">
									<%=cls.getTitle() %>
								</a>
							</td>
							<%
							i++;
						}
						%>
					</tr>
					<%
				}
			}
			%>
		</tbody>
	</table>
</div>