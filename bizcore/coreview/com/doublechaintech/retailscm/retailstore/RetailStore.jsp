<%@ page import='java.util.*,com.doublechaintech.retailscm.*,com.doublechaintech.retailscm.retailstore.RetailStore'%>

<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sky" tagdir="/tags"%>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<!DOCTYPE html>
<html lang="en" slick-uniqueid="3"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="${baseURL}/" />    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   
    <title>  ${userContext.localeMap['@system_name']} </title>

    <!-- Bootstrap core CSS -->
    <link href="./bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./bootstrap/ie10-viewport-bug-workaround.css" rel="stylesheet">
 	<link href="./bootstrap/jquery-ui.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./bootstrap/dashboard.css" rel="stylesheet">
    <link href="./bootstrap/font-awesome.min.css" rel="stylesheet">
   
   

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./bootstrap/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 <style type="text/css">* {
 text-shadow: transparent 0px 0px 0px, rgba(0,0,0,0.68) 0px 0px 0px !important; 
}

</style>


</head>

  <body >


    <div class="container-fluid">
      <div class="row">
      
        <div class="col-xs-12 col-sm-12  col-md-12  main">
          
          <div class="table-responsive" id="content">
          <!-- real content -->

<c:set var="ownerBeanName" value="retailStore" scope="request"/>
<c:set var="ownerClassName" value="RetailStore" scope="request"/>




<div id="msg"></div>

<div class="row">

	<div class="col-xs-12 col-md-12">
			    <c:if test="${not empty result.errorMessageList}" >
    <ul>
    	<c:forEach var="item" items="${result.errorMessageList}">
    		
    		<div class="alert alert-success">
   ${item.sourcePosition} ${item.body}
</div>
    	</c:forEach>
    	</ul>
    </c:if>
</div>



</div> <!--<div class="row">-->

<div class="row">
	
</div>

<div class="row">
	
	<div class="col-xs-12 col-md-12">

	<ul class="nav nav-tabs" id="navi-tabs">
	  <li class="active"><a data-toggle="tab" href="#summary" class="disabled"><i class="fa  fa-home"></i> ${userContext.localeMap['@summary']}</a></li>
	 
	<% RetailStore result = (RetailStore)request.getAttribute("result");  %>
			<li><a data-toggle="tab" href="#consumerOrderList" class="disabled"> ${userContext.localeMap['consumer_order']}</a></li>
			<li><a data-toggle="tab" href="#retailStoreOrderList" class="disabled"> ${userContext.localeMap['retail_store_order']}</a></li>
			<li><a data-toggle="tab" href="#goodsList" class="disabled"> ${userContext.localeMap['goods']}</a></li>
			<li><a data-toggle="tab" href="#transportTaskList" class="disabled"> ${userContext.localeMap['transport_task']}</a></li>
			<li><a data-toggle="tab" href="#accountSetList" class="disabled"> ${userContext.localeMap['account_set']}</a></li>
 
	</ul>
	</div>
</div>
<div class="tab-content"  id='tab-content'>
<div id="summary" class="tab-pane fade in active">
<div class="row">
	
	<div class="col-xs-12 col-md-12">
	
	</div>
</div>

<div class="row" desc="show parent objects">
	
	   
	<c:set var="retailStore" value="${ result}" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstore/RetailStore$Summary.jsp" />

	
</div>

	
	

	<div class="row">
<c:set var="retailStoreCountryCenter" value="${ result.retailStoreCountryCenter}" scope="request" />
<c:set var="referName" value="" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstorecountrycenter/RetailStoreCountryCenter$Info.jsp" />

<c:set var="retailStoreCityServiceCenter" value="${ result.cityServiceCenter}" scope="request" />
<c:set var="referName" value="(cityServiceCenter)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstorecityservicecenter/RetailStoreCityServiceCenter$Info.jsp" />

<c:set var="retailStoreCreation" value="${ result.creation}" scope="request" />
<c:set var="referName" value="(creation)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstorecreation/RetailStoreCreation$Info.jsp" />

<c:set var="retailStoreInvestmentInvitation" value="${ result.investmentInvitation}" scope="request" />
<c:set var="referName" value="(investmentInvitation)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstoreinvestmentinvitation/RetailStoreInvestmentInvitation$Info.jsp" />

<c:set var="retailStoreFranchising" value="${ result.franchising}" scope="request" />
<c:set var="referName" value="(franchising)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstorefranchising/RetailStoreFranchising$Info.jsp" />

<c:set var="retailStoreDecoration" value="${ result.decoration}" scope="request" />
<c:set var="referName" value="(decoration)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstoredecoration/RetailStoreDecoration$Info.jsp" />

<c:set var="retailStoreOpening" value="${ result.opening}" scope="request" />
<c:set var="referName" value="(opening)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstoreopening/RetailStoreOpening$Info.jsp" />

<c:set var="retailStoreClosing" value="${ result.closing}" scope="request" />
<c:set var="referName" value="(closing)" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstoreclosing/RetailStoreClosing$Info.jsp" />

</div>








	





	</div><!-- end of <div id="summary" class="tab-pane fade in active">-->

	

		<c:if test='${not empty userContext.accessTokens["consumerOrderList"] or ignoreListAccessControl}'>
		<c:set var="consumerOrderList" value="${result.consumerOrderList}" scope="request"/>
		<c:set var="consumerOrderListName" value="consumerOrderList" scope="request"/>
		<div id="consumerOrderList" class="tab-pane fade sublist" refer-name="store">
			<sky:include page="com/doublechaintech/retailscm/consumerorder/ConsumerOrder$List.jsp"
					referName="store"/>
		</div>
	</c:if>
	<c:if test='${not empty userContext.accessTokens["retailStoreOrderList"] or ignoreListAccessControl}'>
		<c:set var="retailStoreOrderList" value="${result.retailStoreOrderList}" scope="request"/>
		<c:set var="retailStoreOrderListName" value="retailStoreOrderList" scope="request"/>
		<div id="retailStoreOrderList" class="tab-pane fade sublist" refer-name="buyer">
			<sky:include page="com/doublechaintech/retailscm/retailstoreorder/RetailStoreOrder$List.jsp"
					referName="buyer"/>
		</div>
	</c:if>
	<c:if test='${not empty userContext.accessTokens["goodsList"] or ignoreListAccessControl}'>
		<c:set var="goodsList" value="${result.goodsList}" scope="request"/>
		<c:set var="goodsListName" value="goodsList" scope="request"/>
		<div id="goodsList" class="tab-pane fade sublist" refer-name="retail_store">
			<sky:include page="com/doublechaintech/retailscm/goods/Goods$List.jsp"
					referName="retailStore"/>
		</div>
	</c:if>
	<c:if test='${not empty userContext.accessTokens["transportTaskList"] or ignoreListAccessControl}'>
		<c:set var="transportTaskList" value="${result.transportTaskList}" scope="request"/>
		<c:set var="transportTaskListName" value="transportTaskList" scope="request"/>
		<div id="transportTaskList" class="tab-pane fade sublist" refer-name="end">
			<sky:include page="com/doublechaintech/retailscm/transporttask/TransportTask$List.jsp"
					referName="end"/>
		</div>
	</c:if>
	<c:if test='${not empty userContext.accessTokens["accountSetList"] or ignoreListAccessControl}'>
		<c:set var="accountSetList" value="${result.accountSetList}" scope="request"/>
		<c:set var="accountSetListName" value="accountSetList" scope="request"/>
		<div id="accountSetList" class="tab-pane fade sublist" refer-name="retail_store">
			<sky:include page="com/doublechaintech/retailscm/accountset/AccountSet$List.jsp"
					referName="retailStore"/>
		</div>
	</c:if>

	

</div><!--<div class="tab-content" style="padding-top: 10px">-->




 <!-- /real content -->
          
          
          </div>
        </div><!--  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> -->
        </div><!-- <div class="row"> -->
        </div>
        
  
<div id="footer">
  <div class="col-xs-12 navbar-inverse navbar-fixed-bottom">
  <div class="row" id="bottomNav">
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/home/"><i class="glyphicon glyphicon-home"></i><br/>${userContext.localeMap['@home_page']}</a>
    </div>
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/home/"><i class="glyphicon glyphicon-envelope"></i><br>${userContext.localeMap['@message']}</a>
    </div>
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/home/"><i class="glyphicon glyphicon-envelope"></i><br>${userContext.localeMap['@message']}</a>
    </div>
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/showlogin/">
    	<i class="glyphicon glyphicon-user"></i><br>${userContext.localeMap['@log_out']}</a>
    </div>
  </div>
  </div>
</div>   <!-- --><!-- /.footer -->
        
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./bootstrap/jquery.min.js"></script>
    <script src="./bootstrap/jquery-ui.min.js"></script>
    
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="./bootstrap/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="./bootstrap/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./bootstrap/ie10-viewport-bug-workaround.js"></script>
    <script src="./scripts/qrcode.js" type="text/javascript"></script>    
    <script>

 	var qrLocaleLabel = "${userContext.localeMap['@qr_code']}";
 	var scanQRTips = "${userContext.localeMap['@qr_scan_to_continue']}";
 	$("a[data-toggle='tab']").removeClass("disabled");
 	
	
</script>
     <script src="./scripts/common.js" type="text/javascript"></script>
     <script src="./bootstrap/bootstrap3-typeahead.js" type="text/javascript"></script>


</body></html>


