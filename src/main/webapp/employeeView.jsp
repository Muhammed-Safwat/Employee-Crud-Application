<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="lang" value="${pageContext.request.locale.language}" />
<html lang="en">
	<head>	
		<title>Servlet, JSP, JDBC and MVC Example</title>
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">		

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
		<style>
				  body {
				        color: #566787;
						background: #f5f5f5;
						font-family: 'Varela Round', sans-serif;
						font-size: 13px;
					}
					.table-wrapper {
				        background: #fff;
				        padding: 20px 25px;
				        margin: 30px 0;
						border-radius: 3px;
				        box-shadow: 0 1px 1px rgba(0,0,0,.05);
				    }
					.table-title {        
						padding-bottom: 15px;
						background: #435d7d;
						color: #fff;
						padding: 16px 30px;
						margin: -20px -25px 10px;
						border-radius: 3px 3px 0 0;
				    }
				    .table-title h2 {
						margin: 5px 0 0;
						font-size: 24px;
					}
					.table-title .btn-group {
						float: right;
					}
					.table-title .btn {
						color: #fff;
						float: right;
						font-size: 13px;
						border: none;
						min-width: 50px;
						border-radius: 2px;
						border: none;
						outline: none !important;
						margin-left: 10px;
					}
					.table-title .btn i {
						float: left;
						font-size: 21px;
						margin-right: 5px;
					}
					.table-title .btn span {
						float: left;
						margin-top: 2px;
					}
				    table.table tr th, table.table tr td {
				        border-color: #e9e9e9;
						padding: 12px 15px;
						vertical-align: middle;
				    }
					table.table tr th:first-child {
						width: 60px;
					}
					table.table tr th:last-child {
						width: 100px;
					}
				    table.table-striped tbody tr:nth-of-type(odd) {
				    	background-color: #fcfcfc;
					}
					table.table-striped.table-hover tbody tr:hover {
						background: #f5f5f5;
					}
				    table.table th i {
				        font-size: 13px;
				        margin: 0 5px;
				        cursor: pointer;
				    }	
				    table.table td:last-child i {
						opacity: 0.9;
						font-size: 22px;
				        margin: 0 5px;
				    }
					table.table td a {
						font-weight: bold;
						color: #566787;
						display: inline-block;
						text-decoration: none;
						outline: none !important;
					}
					table.table td a:hover {
						color: #2196F3;
					}
					table.table td a.edit {
				        color: #FFC107;
				    }
				    table.table td a.delete {
				        color: #F44336;
				    }
				    table.table td i {
				        font-size: 19px;
				    }
					table.table .avatar {
						border-radius: 50%;
						vertical-align: middle;
						margin-right: 10px;
					}
				    .pagination {
				        float: right;
				        margin: 0 0 5px;
				    }
				    .pagination li a {
				        border: none;
				        font-size: 13px;
				        min-width: 30px;
				        min-height: 30px;
				        color: #999;
				        margin: 0 2px;
				        line-height: 30px;
				        border-radius: 2px !important;
				        text-align: center;
				        padding: 0 6px;
				    }
				    .pagination li a:hover {
				        color: #666;
				    }	
				    .pagination li.active a, .pagination li.active a.page-link {
				        background: #03A9F4;
				    }
				    .pagination li.active a:hover {        
				        background: #0397d6;
				    }
					.pagination li.disabled i {
				        color: #ccc;
				    }
				    .pagination li i {
				        font-size: 16px;
				        padding-top: 6px
				    }
				    .hint-text {
				        float: left;
				        margin-top: 10px;
				        font-size: 13px;
				    }    
					/* Custom checkbox */
					.custom-checkbox {
						position: relative;
					}
					.custom-checkbox input[type="checkbox"] {    
						opacity: 0;
						position: absolute;
						margin: 5px 0 0 3px;
						z-index: 9;
					}
					.custom-checkbox label:before{
						width: 18px;
						height: 18px;
					}
					.custom-checkbox label:before {
						content: '';
						margin-right: 10px;
						display: inline-block;
						vertical-align: text-top;
						background: white;
						border: 1px solid #bbb;
						border-radius: 2px;
						box-sizing: border-box;
						z-index: 2;
					}
					.custom-checkbox input[type="checkbox"]:checked + label:after {
						content: '';
						position: absolute;
						left: 6px;
						top: 3px;
						width: 6px;
						height: 11px;
						border: solid #000;
						border-width: 0 3px 3px 0;
						transform: inherit;
						z-index: 3;
						transform: rotateZ(45deg);
					}
					.custom-checkbox input[type="checkbox"]:checked + label:before {
						border-color: #03A9F4;
						background: #03A9F4;
					}
					.custom-checkbox input[type="checkbox"]:checked + label:after {
						border-color: #fff;
					}
					.custom-checkbox input[type="checkbox"]:disabled + label:before {
						color: #b8b8b8;
						cursor: auto;
						box-shadow: none;
						background: #ddd;
					}
					/* Modal styles */
					.modal .modal-dialog {
						max-width: 400px;
					}
					.modal .modal-header, .modal .modal-body, .modal .modal-footer {
						padding: 20px 30px;
					}
					.modal .modal-content {
						border-radius: 3px;
					}
					.modal .modal-footer {
						background: #ecf0f1;
						border-radius: 0 0 3px 3px;
					}
				    .modal .modal-title {
				        display: inline-block;
				    }
					.modal .form-control {
						border-radius: 2px;
						box-shadow: none;
						border-color: #dddddd;
					}
					.modal textarea.form-control {
						resize: vertical;
					}
					.modal .btn {
						border-radius: 2px;
						min-width: 100px;
					}	
					.modal form label {
						font-weight: normal;
					}
	</style>
	
			<script>
			fetch("http://localhost:8086/employee-crud-project/list").then(res => JSON.parse(res) ).then(data => console.log(data));
			var app = angular.module('employeeApp', []);
			
			app.controller('employeeCtrl', function($scope) 
			{
				$scope.updateEmployee = function(employeeId)
				{
					var employeeDetails = '';					
					$.ajax
					(
		  				{
		  					url : '/employee-crud-project/get',
		  					async : false,
		  					dataType : "html",
		  					type : "POST",
		  					data : {"employeeId" : employeeId},
		  					success : function(data, textStatus, jqXHR) 
		  					{
		  						if(data != ""){employeeDetails = data;} 				 
		  						else {employeeDetails = '';}		  						
		  					},
		  					error : function(jqXHR, textStatus, errorThrown) 
		  					{
		  						console.log("something went wrong==>", errorThrown);
		  						employeeDetails = '';
		  						alert('exception, errorThrown==>' + errorThrown);
		  					}
		  				}
					);
					
					var employeeParsed = JSON.parse(employeeDetails);
					console.log('employeeDetails' + employeeParsed.name);

					$scope.employee = employeeParsed;
					console.log('$scope.employee' + $scope.employee.name);
					
					return employeeParsed;
				}
			});
		
			$(document).ready(function()
			{
				// Activate tooltip
				$('[data-toggle="tooltip"]').tooltip();
				
				// Select/Deselect checkboxes
				var checkbox = $('table tbody input[type="checkbox"]');
				$("#selectAll").click(function()
				{
					if(this.checked)
					{
						checkbox.each(function()
						{
							this.checked = true;
						});
					} 
					else
					{
						checkbox.each(function()
						{
							this.checked = false;                        
						});
					} 
				});
				
				checkbox.click(function()
				{
					if(!this.checked)
					{
						$("#selectAll").prop("checked", false);
					}
				});
	
				$('#deleteBtn').click
				(
					function()
					{
				  		var deletedEmployees = [];
				  		$("input:checkbox[class='employeeCheck']:checked").each(function(){    
				  			deletedEmployees.push($(this).val());    		
				  		});
				  		
				  		deletedEmployees = deletedEmployees.join(",")
				  		var employeeIds = deletedEmployees.toString();			  		
		
				  		$.ajax(
		  				{
		  					url : '/employee-crud-project/delete',
		  					async : false,
		  					dataType : "html",
		  					type : "POST",
		  					data : {"employeeIds" : employeeIds},
		  					success : function(data, textStatus, jqXHR) 
		  					{
		  						if(data != ""){response = data;} 				 
		  						else {response = '';}	  						
		  						window.location.href = '/employee-crud-project/';
		  					},
		  					error : function(jqXHR, textStatus, errorThrown) 
		  					{
		  						console.log("something went wrong==>", errorThrown);
		  						response = '';
		  						alert('exception, errorThrown==>' + errorThrown);
		  					}
		  				});
					}
				);
			});
	
			function toggleCheckBox(employeeId)
			{			
			    $("#employee"+employeeId).prop('checked', true);
			}
		</script>
</head>
<body ng-app="employeeApp" ng-controller="employeeCtrl">
		<div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>
								Manage <b>Employees</b>
							</h2>
						</div>
						<div class="col-sm-6">
							<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
								<i class="material-icons">&#xE147;</i> 
								<span>Add New Employee</span>
								</a> 
							<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal">
								<i class="material-icons">&#xE15C;</i> <span>Delete</span>
							</a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>
								<span class="custom-checkbox"> 
									<input type="checkbox" id="selectAll"> 
									<label for="selectAll"></label>
								</span>
							</th>
							<th>Name</th>
							<th>Email</th>
							<th>Address</th>
							<th>Phone</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="employee" items="${employees}" begin="0">
							<tr>
								<td>
									<span class="custom-checkbox"> 
										<input type="checkbox" name="employee${employee.id}" id="employee${employee.id}" class="employeeCheck" value="${employee.id}">
										<label for="${employee.id}"></label>
									</span>
								</td>
								<td>${employee.name}</td>
								<td>${employee.email}</td>
								<td>${employee.address}</td>
								<td>${employee.phone}</td>
								<td>
									<a href="#editEmployeeModal" ng-click="updateEmployee(${employee.id})" class="edit" data-toggle="modal">
										<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
									</a> 
									<a href="#deleteEmployeeModal" onclick="toggleCheckBox(${employee.id})" class="delete" data-toggle="modal">
										<i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	<!-- Edit Modal HTML -->
 	<jsp:include page="addEmployeeView.jsp"></jsp:include>
	<!-- Edit Modal HTML -->
	 <jsp:include page="updateEmployeeView.jsp"></jsp:include>
	<!-- Delete Modal HTML -->
	 <jsp:include page="deleteEmpolyeeView.jsp"></jsp:include>
</body>
</html>