class AppLink {
  static String server = "https://amadytech.com/ecommerce/delivery";
  static String test = "$server/test.php";
  static String image = "$server/upload";
  static String imageCategories = "$image/categories";
  static String imageitems = "$image/items";
  /////==========================auth=====================================//////
  static String signup = "$server/auth/signup.php";
  static String verifycodesignup = "$server/auth/verifycode.php";
  static String login = "$server/auth/login.php";
  static String resend = "$server/auth/resend.php";
  /////=========================forgetpassword===========================//////
  static String chechemailforgetpassword =
      "$server/forgetpassword/chechemail.php";
  static String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
  static String ressetpassword = "$server/forgetpassword/ressetpassword.php";
  /////=============================orders==============================//////
  static String pendingorders = "$server/orders/pending.php";
  static String archiveorders = "$server/orders/archive.php";
  static String acceptedorders = "$server/orders/accepted.php";
  static String approveorders = "$server/orders/approve.php";
  static String doneorders = "$server/orders/done.php";
  static String ordersdetails = "$server/orders/details.php";
  static String polylines =
      "https://api.openrouteservice.org/v2/directions/driving-car";
  /////=============================cart==============================//////
  static String cartgetcountofitems = "$server/cart/getcountofitems.php";
/////=============================notifications==============================//////
  static String notifications = "$server/notifications/view.php";
/////=============================customersservice==============================//////
  static String customersservice = "$server/contactus/add.php";
  static String settings = "$server/settings.php";
}
