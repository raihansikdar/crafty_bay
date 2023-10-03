class Urls{
  Urls._();

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";
  static String verifyEmail({required String email}) => "$_baseUrl/UserLogin/$email";
  static String verifyOtp({required String email,required String otp}) => "$_baseUrl/VerifyLogin/$email/$otp";
  static String carouselSliderCard = "$_baseUrl/ListProductSlider";
  static String getCategoryList = "$_baseUrl/CategoryList";
}