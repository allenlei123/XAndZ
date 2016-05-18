<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en-US" ng-app="weiboApp">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>Weibo Demo</title>
	
	    <!-- Loading Bootstrap -->
	    <link href="<%=contextPath %>/public/javascripts/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">
	    <link href="<%=contextPath %>/public/styles/DT_bootstrap.css" rel="stylesheet">
	
	    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
	    <script src="<%=contextPath %>/public/javascripts/html5shiv.js"></script>
	    <script src="<%=contextPath %>/public/javascripts/respond.min.js"></script>
	
	    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <script src="<%=contextPath %>/public/javascripts/jquery-2.0.0.min.js"></script>
	    <script src="<%=contextPath %>/public/javascripts/jquery.dataTables.min.js"></script>
	    <script src="<%=contextPath %>/public/javascripts/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	
	    <!-- custom js -->
	    <script src="<%=contextPath %>/public/javascripts/utilJs/tools.js"></script>
	
	    <script src="<%=contextPath %>/public/javascripts/bootstrap-pagination.js"></script>
	
	    <style>
	
	        .dataTables_wrapper .row,.row{
	            margin-right: 0px;
	            margin-left: 0px;
	        }
	
	        .loadingIcon{
	            position: fixed;
	            top: 45%;
	            left: 45%;
	        }
	
	        .leftAlign{
	            padding-left: 30px;
	        }
	
	        .prizeList{
	            border: 1px solid silver;
	            padding-top:15px;
	        }
	        .centerPagination{
	            text-align: center;;
	        }
	
	        .padding8{
	            padding-top: 8px;
	        }
	
	        body {
	            min-height: 2000px;
	            padding-top: 70px;
	        }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <div class="row">
	           <h1>Weibo List</h1>
	        </div>
	        <div class="row" style="margin-top: 20px;">
	            <table id="userTable" class="table table-striped table-bordered table-hover table-responsive">

				</table>
	        </div>
	
	    </div> <!-- /container -->
	
	 </body>
	<script>
		$(function(){
			callAjax("../getWeiboList", function(data){
				//callback function
				console.log(data);
				$('#userTable').DataTable( {
				    data: data.statuses,
				    columns: [
				        { data: 'id',sTitle:"Weibo ID", width: "10%" },
				        { data: 'text',sTitle:"Weibo Content"},
				        { data: 'created_at',sTitle:"Weibo Created Time", width: "25%" }
				    ],
				    "sDom": "<'row'<'col-sm-offset-8 col-sm-4'f>r>t<'row'<'col-sm-6'i><'col-sm-offset-2 col-sm-4'l><'col-sm-12 centerPagination'p>>",
			        "sPaginationType": "bootstrap",
			        "asStripClasses":['odd', 'even'],
			        "bJQueryUI":true,
			        "bLengthChange":true,
			        "bPaginage":true,
			        "bInfo":true,
			        "bFilter": false,
			        "bSort":false,
			        "headerCallback": function( thead, data, start, end, display ) {
			            $(thead).find('th').removeClass().addClass("btn-danger");
			          },
			        "fnRowCallback": function( nRow, rowData, iDisplayIndex ) {
			        	if (iDisplayIndex % 6 == 1)
			            	$(nRow).find("td").addClass("btn-warning");
			        	else if (iDisplayIndex % 6 == 4)
			            	$(nRow).find("td").addClass("btn-success");
			            return nRow;
			        }
				} );
			}, {}, 'GET');
		});
	</script>
</html>