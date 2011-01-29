<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@taglib prefix="dddtags" uri="dddtags"%>
<%@tag body-content="scriptless"%>
<%@ attribute name="categoryNameInSession" rtexprvalue="true"
	required="true"%>
<%@ attribute name="categoryName" rtexprvalue="true" required="true"%>
<%@ attribute name="subcategoryName" rtexprvalue="true" required="false"%>
<%@ attribute name="subsubcategoryName" rtexprvalue="true"	required="false"%>
<%@ attribute name="defaultValue" rtexprvalue="true"	required="false"%>
<%@ attribute name="categorySectionStart" fragment="true"	required="false"%>
<%@ attribute name="categorySectionEnd" fragment="true" required="false"%>
<%@ attribute name="subcategorySectionStart" fragment="true"	required="false"%>
<%@ attribute name="subcategorySectionEnd" fragment="true"	required="false"%>
<%@ attribute name="subsubcategorySectionStart" fragment="true"	required="false"%>
<%@ attribute name="subsubcategorySectionEnd" fragment="true"	required="false"%>
<script>
<c:if test="${! empty subcategoryName}">
	function catChange(cat) {
		var arr = new Array();
		arr =  document.documentElement.getElementsByTagName( "div" );
		for ( var i = 0; i < arr.length; i++) {
			var obj = arr[i];
			if (obj.id != cat){
				obj.style.display = 'none'
				var childNodesArray = obj.childNodes;
				for ( var j = 0; j < childNodesArray.length; j++) { 					
					var childobj = childNodesArray[j];
					if (childobj.tagName=="SELECT"){
						childobj.disabled = true						
					}					
				}
			} else {
				obj.style.display = 'block'
				var childNodesArray = obj.childNodes;
				for ( var j = 0; j < childNodesArray.length; j++) { 					
					var childobj = childNodesArray[j];
					if (childobj.tagName=="SELECT"){
						childobj.disabled = false
						childobj.value ='${defaultValue}'
					}
				
				}
			}
		}

		
	}
</c:if>

<c:if test="${! empty subsubcategoryName}">
	function subcatChange(cat,subcat) {
		var arr = new Array();
		
		arr =  document.documentElement.getElementsByTagName( "div" );
		for ( var i = 0; i < arr.length; i++) {
			var obj = arr[i];
			if (!(obj.id == cat || obj.id == subcat)){
				obj.style.display = 'none'
				var childNodesArray = obj.childNodes;
				for ( var j = 0; j < childNodesArray.length; j++) { 					
					var childobj = childNodesArray[j];
					if (childobj.tagName=="SELECT"){
						childobj.disabled = true					
					}
				}
			} else {
				obj.style.display = 'block'
				var childNodesArray = obj.childNodes;
				for ( var j = 0; j < childNodesArray.length; j++) { 					
					var childobj = childNodesArray[j];
					if (childobj.tagName=="SELECT"){
						childobj.disabled = false
						if (obj.id != cat){
							childobj.value = '${defaultValue}'	
						}						
					}
				}
				
			}
		}

	}
</c:if>
</script>

<%--   Get the value from the session --%>
<dddtags:sessiontag name="${categoryNameInSession}"	var="categoryValuesFromSession">

<%--  HTML Formatting Before Category --%>
<jsp:invoke fragment="categorySectionStart" />

<%--  Category Select Box --%>
<select name='${categoryName}' onchange="catChange(this.value)">
	<c:if test="${! empty defaultValue}">
		<option value=${defaultValue} >${defaultValue}</option>
	</c:if>
	<c:if test="${! empty categoryValuesFromSession}">
		<c:forEach items="${categoryValuesFromSession}" var="categoryMap">
			<option value=${categoryMap.key}>${categoryMap.key}</option>
		</c:forEach>
	</c:if>
	<c:if test="${empty categoryValuesFromSession}">
		<option value='${defaultValue}' >${defaultValue}</option>
	</c:if>
</select>

<%--  HTML Formatting After Category --%>
<jsp:invoke fragment="categorySectionEnd" />

<%--  HTML Formatting Before Sub-Category --%>
<jsp:invoke fragment="subcategorySectionStart" />

<%-- Sub Category Select Box --%>
<c:if test="${! empty subcategoryName}">
	<c:forEach items="${categoryValuesFromSession}" var="categoryMap" varStatus="status">
		<div style="display: none" id="${categoryMap.key}">
			<select name=${subcategoryName} onchange="subcatChange('${categoryMap.key}',this.value)">
				<c:if test="${! empty defaultValue}">
					<option value='${defaultValue}' >${defaultValue}</option>
				</c:if>
				<c:forEach items="${categoryMap.value}" var="subcategoryMap">
					<option value=${subcategoryMap.key}>${subcategoryMap.key}</option>
				</c:forEach>
			</select>
		</div>
	</c:forEach>
</c:if>

<%--  HTML Formatting After Sub Category --%>
<jsp:invoke fragment="subcategorySectionEnd" />

<%--  HTML Formatting Before Sub Sub Category --%>
<jsp:invoke fragment="subsubcategorySectionStart" />


<%-- Sub Sub Category Select Box --%>
<c:if test="${! empty subsubcategoryName}">
	<c:forEach items="${categoryValuesFromSession}" var="categoryMap" varStatus="status">
		<c:forEach items="${categoryMap.value}" var="subcategoryMap">
			<div style="display: none" id="${subcategoryMap.key}">
				<select	name=${subsubcategoryName}>
					<c:if test="${! empty defaultValue}">
						<option value='${defaultValue}' >${defaultValue}</option>
					</c:if>
					<c:forEach items="${subcategoryMap.value}" var="subsubcategory">
						<option value=${subsubcategory}>${subsubcategory}</option>
					</c:forEach>
				</select>
			</div>
		</c:forEach>
	</c:forEach>
</c:if>

<%--  HTML Formatting After Sub Category --%>
<jsp:invoke fragment="subsubcategorySectionEnd" />

</dddtags:sessiontag>