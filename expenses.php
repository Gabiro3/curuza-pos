	<?php 


		include("includes/header.php"); 

	if(!isset($_SESSION['admin_username']))
	  {
	     echo "<script>document.location='login.php'</script>";
	  }
	  else
	  {



	?>

			<!-- Main Content-->
			<div class="main-content pt-0">
				<div class="container">
					<div class="inner-body">
						<!-- Page Header -->
						<div class="page-header">
							<div>
								<h2 class="main-content-title tx-24 mg-b-5">Expenses</h2>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Expenses</li>
								</ol>
							</div>
						</div>
						<!-- End Page Header -->

						<!-- Row -->
						<div class="row sidemenu-height">
							<div class="col-lg-12">
								<div class="card custom-card">
									<div class="card-body">
										<div class="row">

										<!-- Add Category Form -->
										<div class="col-md-6" style="border: 1px solid #eee; padding: 10px;">
										<div class="col">
										<form method="post" action="add-expenses.php" enctype="multipart/form-data">
										<div class="row row-sm">
											<div class="col-md-12 col-lg-12 col-xl-12">
												<div class="">
													<div class="col-md-9">
													 <label class="">Expenses Name </label>
													 <select name="expense_cat" class="form-control select select2">
													<option label="Date"></option>
													<?php 
														$get_cat = "SELECT * FROM tbl_expense_cat";
														$run_cat = mysqli_query($db, $get_cat);
														while($row_cat = mysqli_fetch_array($run_cat))
														{
															$expense_id = $row_cat['expense_cat_id'];
															$expense_name = $row_cat['expense_cat_name'];

															echo "<option value='$expense_id'>$expense_name</option>";
														}

													?>
													</select>
													</div> <br>

													<div class="form-group col-md-9">
														<label class=""> Amount  </label>
														<input class="form-control" required="" name="expense_amount" type="text">
													</div>
		
													<div class="form-group col-md-9">
												      <button type="submit" name="add_exp" class="btn ripple btn-main-primary">
														Add Expenses
													</button>
												  </div>
												</div>
											</div>
										</div>
										</form>
						                 </div>
										</div>


										<!--  -->
										<div class="col-md-6">
											<div class="table-responsive">
											<table class="table" id="example1">
												<thead>
													<tr>
														
														<th class="wd-15p">Expenses Name</th>
														<th class="wd-15p">Amount</th>
														<th class="wd-15p">Date</th>	
														<th class="wd-15p">Action</th>
													</tr>
												</thead>
												<tbody>
													<?php 

													$i = 0;
													$get_cat = "SELECT * FROM tbl_expenses";
													$run_cat = mysqli_query($db, $get_cat);

													while($row_cat  = mysqli_fetch_array($run_cat))
													{
														$expense_id  	= $row_cat['expense_id'];
														$expense_cat_id = $row_cat['expense_cat_id'];
														$expense_amt	= $row_cat['amount'];
														$expense_date	= $row_cat['date_added'];


														// GET EXPENSES
														$get_exp = "SELECT * FROM tbl_expense_cat WHERE expense_cat_id = '$expense_cat_id'";
														$run_exp = mysqli_query($db, $get_exp);
														$row_exp = mysqli_fetch_array($run_exp);
														$cat_name  = $row_exp['expense_cat_name'];


														$i++;

													?>
													<tr>
														<td><?php echo $cat_name; ?></td>
														<td><?php echo number_format($expense_amt,2); ?></td>
														<td><?php echo date("M d, Y h:i a",strtotime($expense_date));; ?></td>
														
														<td>
														<a class="btn ripple btn-primary" data-target="#update<?php echo $expense_id; ?>" data-toggle="modal" href="#update<?php echo $expense_id; ?>"><i class="fa fa-eye"></i></a>

														<a class="btn ripple btn-danger" data-target="#delete<?php echo $expense_id; ?>" data-toggle="modal" href="#delete<?php echo $expense_id; ?>">
															<i class="fa fa-trash"></i>
														</a>

														</td>

													</tr>

			<!-- Large Modal -->
			<div class="modal" id="update<?php echo $expense_id; ?>">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content modal-content-demo">
						<div class="modal-header">
							<h6 class="modal-title">Update Expenses Details</h6><button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<form method="post" action="update-expenses.php">
						    <div class="row">
						    
						    <div class="col-md-9">
							 <label class="">Expenses Name </label>
							 <input class="form-control" required="" name="expense_id" value="<?php echo $expense_id; ?>" type="hidden">
							 <select name="cat_name" class="form-control select select2">
						     <option value="<?php echo $expense_cat_id; ?>"><?php echo $cat_name; ?></option>
							 <?php

							 	$select_cat = "SELECT * FROM tbl_expense_cat";
							 	$get_cat    = mysqli_query($db, $select_cat);
						
							 	while($row = mysqli_fetch_array($get_cat))
							 	{
							 		$exp_id = $row['expense_cat_id'];
							 		$exp_name = $row['expense_cat_name'];
							 	

							 ?>
							 <option value="<?php echo $exp_id; ?>"><?php echo $exp_name; ?></option>
							<?php } ?>
						     </select>
							 </div>  


							 <div class="form-group col-md-9">
							 	<label class="">Amount</label>
							 	<input class="form-control" required="" name="expense_id" value="<?php echo $expense_id; ?>" type="hidden">
							 	<input class="form-control" required="" name="expense_amt" value="<?php echo $expense_amt; ?>" type="text">
							 </div>

							</div>

							
							
						</div>
						<div class="modal-footer">
							<button class="btn ripple btn-primary" type="submit">Update Expenses</button>
							<button class="btn ripple btn-secondary" data-dismiss="modal" type="button">Close</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!--End Large Modal -->


			 <!-- Delete Modal -->
			<div class="modal" id="delete<?php echo $expense_id; ?>">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content modal-content-demo">
						<div class="modal-header">
							<h6 class="modal-title">Delete Expenses Details</h6><button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body">
							<form action="expenses-del.php" method="post">
							<input type="hidden" class="form-control" name="expense_id" value="<?php echo $expense_id; ?>" required> 
                      
                                  <p>Are you sure you want to <b>Delete</b> this expenses?</p>
							
						</div>
						<div class="modal-footer">
							<button class="btn ripple btn-primary" name="delete" type="submit">Yes</button>
							<button class="btn ripple btn-danger" data-dismiss="modal" type="button">No</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!--End Delete Modal -->
													
												 <?php } ?>
												</tbody>
											</table>
										</div>
										</div>

										
									    </div>
										
									</div>
								</div>
							</div>
						</div>
						<!-- End Row -->
					</div>
				</div>
			</div>
			<!-- End Main Content-->


<?php  include("includes/footer.php"); ?>
<?php } ?>