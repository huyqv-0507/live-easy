class Env {
  //static const String host = '10.0.2.2';
  static const String host = 'api.dominos.reso.vn';
  //static const String port = '5001';
  static const String tokenPrefs = "idToken";

  static const String tokenDominos =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQxOTI5ZmY0NWM2MDllYzRjNDhlYmVmMGZiMTM5MmMzOTEzMmQ5YTEiLCJ0eXAiOiJKV1QifQ";
  static String dataUrl(String dataUrl) {
    return 'http://' + host + '/api/v2/' + dataUrl;
  }
}
