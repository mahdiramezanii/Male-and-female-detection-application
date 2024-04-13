class ApiException implements Exception{

  String message;

  ApiException({
    
    required this.message,

  });

}