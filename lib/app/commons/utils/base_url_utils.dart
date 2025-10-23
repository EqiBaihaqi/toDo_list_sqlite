class BaseUrl {

  // String url = "http://192.168.82.120:8000";
  // String url = "http://192.168.82.48:8001";
  String url = "https://sim-traceability-monitoring.dev.ragdalion.com";
 

  String getUrlDevice() {
    return '$url/api/';
  }

  String getWsDevice() { 
    return 'ws://$url/ws';
  }
}
