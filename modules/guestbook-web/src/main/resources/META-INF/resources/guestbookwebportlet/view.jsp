<%@ include file="../init.jsp" %>


<%
long guestbookId = Long.valueOf((Long) renderRequest.getAttribute("guestbookId"));
%>

<aui:button-row cssClass="guestbook-buttons">
   <portlet:renderURL var="addEntryURL">
      <portlet:param name="mvcPath" value="/guestbookwebportlet/edit_entry.jsp"/>
      <portlet:param name="guestbookId" value="<%=String.valueOf(guestbookId)%>" />
   
   </portlet:renderURL>
   
   <aui:button onClick="<%=addEntryURL.toString()%>" value="Add Entry"></aui:button>
</aui:button-row>


<portlet:renderURL var="viewURL">
   <portlet:param name="mvcPath" value="/guestbookwebportlet/view.jsp"></portlet:param> 
</portlet:renderURL>


<liferay-ui:search-container total="<%=EntryLocalServiceUtil.getEntriesCount()%>">
   
   <liferay-ui:search-container-results
      results=
      "<%=EntryLocalServiceUtil.getEntries(
    		  scopeGroupId.longValue(), guestbookId, searchContainer.getStart(), searchContainer.getEnd()
    		  ) %>" 
   />
   
   
   
  
   <liferay-ui:search-container-row
      className="com.liferay.docs.guestbook.model.Entry" modelVar="entry">
      <liferay-ui:search-container-column-text property="entryId" />
      <liferay-ui:search-container-column-text property="message" />
      <liferay-ui:search-container-column-text property="name" />
      <liferay-ui:search-container-column-text property="email" />
	  <liferay-ui:search-container-column-text>
     	 <portlet:actionURL name="deleteEntry" var="deleteEntryURL">
            <portlet:param name="entryId" value="<%= String.valueOf(entry.getEntryId()) %>" />
            <portlet:param name="guestbookId" value="<%= String.valueOf(guestbookId) %>" />
         </portlet:actionURL>
         <liferay-ui:icon image="delete" url="<%=deleteEntryURL.toString() %>" />
      </liferay-ui:search-container-column-text>
      <liferay-ui:search-container-column-text>
     	 <portlet:renderURL var="editEntryURL">
         	   <portlet:param name="mvcPath" value="/guestbookwebportlet/edit_entry.jsp"/>
               <portlet:param name="entryId" value="<%= String.valueOf(entry.getEntryId()) %>" />
               <portlet:param name="guestbookId" value="<%= String.valueOf(guestbookId) %>" />
               <portlet:param name="email" value="<%= String.valueOf(entry.getEmail()) %>" />
               <portlet:param name="name" value="<%= String.valueOf(entry.getName()) %>" />
               <portlet:param name="message" value="<%= String.valueOf(entry.getMessage()) %>" />
         </portlet:renderURL>
               
         <liferay-ui:icon image="edit" url="<%=editEntryURL.toString() %>" />
      </liferay-ui:search-container-column-text>
   </liferay-ui:search-container-row>
   
   <liferay-ui:search-iterator />


</liferay-ui:search-container>