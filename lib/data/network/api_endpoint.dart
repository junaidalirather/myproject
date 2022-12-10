class APIEndpoint {
  static String baseUrl = "";

  static String get location => "$baseUrl/user/";

  static String get loginapi => "$baseUrl/otp/generateAndSend?mobile=";

  static String get otpapi => "$baseUrl/otp/verify";

  static String get vehicleapi => "$baseUrl/user/";

  static String get loanapi => "$baseUrl/user/";

  static String get smsdump => "$baseUrl/user/data/sms";

  static String get supportapi => "$baseUrl/user";

  static String get referralStatusDetails => "$baseUrl/user";
}
