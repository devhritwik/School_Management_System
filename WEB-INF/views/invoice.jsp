<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page session="true"%>
<spring:url var="style" value="/style" />

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/invoice.css" />


<div class="container">
    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Rajkiya Senior Secondary School</h2><h3 class="pull-right">Bill No: ${bill.billNo}</h3>
    			<br/>
    			<h4>Mahadewa, Bathnaha, Sitamarhi, Bihar-843327</h4>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Student ID</strong><br>
    					Student's Name<br>
    					Class<br>
    					Father's Name<br>
    					<br/>
    					By Accountant<br>
    					
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>${bill.ofStudent}</strong><br>
    					${student.firstName} ${student.middleName} ${student.lastName} <br>
    					${class1.className}<br>
    					${parent.fatherFirstName} ${parent.fatherMiddleName} ${parent.fatherLastName}<br>
    					<br/>
    					${accountant.firstName} ${accountant.middleName} ${accountant.lastName}<br>
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    					Cash<br>
    					
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Date:</strong><br>
    					${bill.date}<br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Fees Description</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Title</strong></td>
        							<td class="text-right"><strong>Rupees</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<tr>
    								<td>Amount</td>
    								<td class="text-right">${bill.amount}</td>
    							</tr>
                                <tr>
        							<td>Concession</td>
    								<td class="text-right">${bill.concession}</td>
    							</tr>
                                <tr>
            						<td>Fine</td>
    								<td class="text-right">${bill.fine}</td>
    							</tr>
    							<tr>
    								<td class="thick-line"><strong>Total</strong></td>
    								<c:set var="total" value="${0}"/>
    								<c:set var="total" value="${total + bill.amount - bill.concession + bill.fine}" />
    								<td class="thick-line text-right">${total}</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>