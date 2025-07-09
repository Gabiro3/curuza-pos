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
								<h2 class="main-content-title tx-24 mg-b-5">Profile</h2>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
								</ol>
							</div>
						</div>
						<!-- End Page Header -->

						<!-- Row -->
						<div class="row sidemenu-height">
							<div class="col-lg-12">
								<div class="card custom-card">
									<div class="card-body">
									<?php
  $username = $_SESSION['admin_username'];
  $get_ad   = "SELECT * FROM admin_tbl WHERE admin_username = '$username'";
  $run_ad   = mysqli_query($db, $get_ad);
  $row_ad   = mysqli_fetch_array($run_ad);

  $admin_id  = $row_ad['admin_id'];
  $fullname  = $row_ad['fullname'];
  $admin_img = $row_ad['admin_img'];

  $shop_query = mysqli_query($db, "SELECT * FROM tbl_shop_details LIMIT 1");
  $shop_row   = mysqli_fetch_array($shop_query);

  $shop_name    = $shop_row['shop_name'];
  $phone_number = $shop_row['phone_number'];
  $email        = $shop_row['email'];
  $website      = $shop_row['website'];
  $tax_no       = $shop_row['tax_no'];
  $currency     = $shop_row['currency'];
?>
									 <form method="post" action="update-profile.php" enctype="multipart/form-data">
  <div class="row row-sm">
    <div class="col-md-12 col-lg-12 col-xl-12">
      <div class="form-group col-md-9">
        <label>Full Name</label>
        <input type="hidden" name="admin_id" value="<?php echo $admin_id; ?>">
        <input class="form-control" required value="<?php echo $fullname; ?>" name="fullname" type="text">
      </div>

      <hr>
      <h5 class="text-primary">Shop Details</h5>

      <div class="form-group col-md-9">
        <label>Shop Name</label>
        <input class="form-control" name="shop_name" value="<?php echo $shop_name; ?>" required type="text">
      </div>

      <div class="form-group col-md-9">
        <label>Phone Number</label>
        <input class="form-control" name="phone_number" value="<?php echo $phone_number; ?>" required type="text">
      </div>

      <div class="form-group col-md-9">
        <label>Email</label>
        <input class="form-control" name="email" value="<?php echo $email; ?>" type="email">
      </div>

      <div class="form-group col-md-9">
        <label>Website</label>
        <input class="form-control" name="website" value="<?php echo $website; ?>" type="text">
      </div>

      <div class="form-group col-md-9">
        <label>Tax Number (TIN)</label>
        <input class="form-control" name="tax_no" value="<?php echo $tax_no; ?>" type="text">
      </div>

      <div class="form-group col-md-9">
        <label>Currency</label>
        <input class="form-control" name="currency" value="<?php echo $currency; ?>" type="text">
      </div>

      <div class="form-group col-md-9">
        <button class="btn ripple btn-primary" name="update-profile" type="submit">Update Details</button>
      </div>
    </div>
  </div>
</form>
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