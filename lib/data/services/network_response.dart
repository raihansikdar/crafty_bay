class NetworkResponse{
  final bool isSuccess;
  final int statusCode;
  final dynamic responseJsonBody;

  NetworkResponse({required this.isSuccess, required this.statusCode,required this.responseJsonBody});
}