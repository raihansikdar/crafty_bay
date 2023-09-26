class Urls{
  Urls._();

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";
  static String verifyEmail({required String email}) => "$_baseUrl/UserLogin/$email";
}