class ApiConfig {
  ApiConfig._();

  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const Duration sendTimeout = Duration(milliseconds: 15000);
  static const String contentType = 'application/json; charset=utf-8';

  // AUTH
  static const String authLogin = 'web-admin/auth/login';
  static const String authManpower = 'mobile/scan-manpower';

  //AREA
  static const String getArea = 'mobile/areas';
  static const String getAreaProsesItem = 'mobile/area-process-items';

  static const String postScanQr = 'mobile/scan-qr';
  
  static const String postCreateAreaProcess = 'mobile/area-process-items';
  static const String getRbSpec = 'rb-specifications';
  static const String getNgTypes = 'rb-judgements';
  
  
}
