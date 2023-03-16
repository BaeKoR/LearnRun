<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> list = (List<ClsDto>)request.getAttribute("bestClslist");
%>

<h2>인기 클래스</h2>

<table width="100%" border="1" style="text-align: center; padding-left: 10%; padding-right: 10%;">
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	</colgroup>

	<tbody>
		<%
		if(list == null || list.size() == 0){
		%>
			<tr>
				<td colspan="4">클래스가 없습니다.</td>
			</tr>
		<%
		}
		else {
			int i = 0;
			while(i<list.size())
			{
				%>
				<tr>
					<%
					for(int j=0; i<list.size()&&j<4; j++){
						ClsDto cls = list.get(i);
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