

class ApiServices {
   final String _baseUrl =   const String.fromEnvironment("BASE_URL");

  String get baseUrl => _baseUrl;

  ///api url
  ///auth
  String get login => "$baseUrl/login";
  String get socialLogin => "$baseUrl/sociel_login";
  String get register => "$baseUrl/register";
  String get forgotPassword => "$baseUrl/sendOtp";
  String get verifyOtp => "$baseUrl/verifyOtp";
  String get resetPassword => "$baseUrl/resetPassword";
  String get changePassword => "$baseUrl/changePassword";
  String get deleteAccount => "$baseUrl/delete";




   /// home list
   String get gePlan => "$baseUrl/getMembershipPlans";
   String get geVideo => "$baseUrl/VideoPackages";
   String get purchasePlan => "$baseUrl/MembershipPayment";
   String get myPlan => "$baseUrl/getplans";
   String get getQuestion => "$baseUrl/getquestion";
   String get homeDetails => "$baseUrl/VideoPackagesDetails";

   /// profile api
     String get profile => "$baseUrl/GetProfile";
   String get uploadProfile => "$baseUrl/updateProfile";

   /// setting api
   String get privacyPolicy => "$baseUrl/privacy-policy";
   String get termsCondition   => "$baseUrl/terms-and-conditions";

}
