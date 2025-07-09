<?php 

	include("includes/db_conn.php");

	if(isset($_POST['update-profile']))
	{

		$admin_id = mysqli_real_escape_string($db, $_POST['admin_id']);
		$fullname = mysqli_real_escape_string($db, $_POST['fullname']);

		// image processing
		$admin_img    = $_FILES['user_img']['name'];
		$temp_name    = $_FILES['user_img']['tmp_name'];
		$shop_name    = $_POST['shop_name'];
        $phone_number = $_POST['phone_number'];
        $email        = $_POST['email'];
        $website      = $_POST['website'];
        $tax_no       = $_POST['tax_no'];
        $currency     = $_POST['currency'];
		move_uploaded_file($temp_name,"user_images/$admin_img");
		mysqli_query($db, "UPDATE tbl_shop_details SET 
        shop_name='$shop_name',
        phone_number='$phone_number',
        email='$email',
        website='$website',
        tax_no='$tax_no',
        currency='$currency'
        LIMIT 1
    ");

		if($admin_img == "")
		{
			$update_pro = "UPDATE admin_tbl SET fullname = '$fullname' WHERE admin_id = '$admin_id'";
			$run_pro    = mysqli_query($db, $update_pro);

			if($run_pro)
			{
				echo "<script>alert('Profile updated successfully!')</script>";
				echo "<script>document.location='profile.php'</script>";
			}
		}
		else
		{
			$update_pro = "UPDATE admin_tbl SET fullname = '$fullname', admin_img = '$admin_img' WHERE admin_id = '$admin_id'";
			$run_pro    = mysqli_query($db, $update_pro);

			if($run_pro)
			{
				echo "<script>alert('Profile updated successfully!')</script>";
				echo "<script>document.location='profile.php'</script>";
			}
		}
   }

 ?>