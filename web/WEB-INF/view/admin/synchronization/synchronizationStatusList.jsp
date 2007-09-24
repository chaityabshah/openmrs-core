<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="View Synchronization Status" otherwise="/login.htm" redirect="/admin/synchronization/synchronizationStatus.list" />

<%@ include file="/WEB-INF/template/header.jsp" %>

<%@ include file="localHeader.jsp" %>

<h2><spring:message code="Synchronization.status.title"/></h2>

<form id="syncCreateTx" action="synchronizationStatus.list" method="post">
	<input type="submit" value='<spring:message code="SynchronizationStatus.createTx"/>'/>
	<input type="hidden" name="action" value="createTx"/>
</form>

<br/>

<b class="boxHeader"><spring:message code="Synchronization.changes.recent"/></b>
<div class="box">
	<table id="syncChangesTable" cellpadding="4">
		<thead>
			<tr>
				<th><spring:message code="SynchronizationStatus.itemTypeAndGuid" /></th>
				<th><spring:message code="SynchronizationStatus.timestamp" /></th>
				<th><spring:message code="SynchronizationStatus.itemState" /></th>
				<th><spring:message code="SynchronizationStatus.recordState" /></th>
				<th><spring:message code="SynchronizationStatus.retryCount" /></th>
			</tr>
		</thead>
		<tbody id="globalPropsList">
			<c:forEach var="syncRecord" items="${synchronizationStatusList}" varStatus="status">
				<tr>
					<td>
						<b>${recordTypes[syncRecord.guid]}</b><br>
						${itemGuids[syncRecord.guid]}
					</td>
					<td><openmrs:formatDate date="${syncRecord.timestamp}" format="dd-MMM-yyyy HH:mm:ss" /></td>
					<td style="text-align:center;">
						<c:forEach var="syncItem" items="${syncRecord.items}" varStatus="status">
							${syncItem.state}
						</c:forEach>
					</td>
					<td style="text-align:center;">${syncRecord.state}</td>
					<td style="text-align:center;">${syncRecord.retryCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>
