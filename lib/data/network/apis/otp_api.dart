import 'dart:io';

import 'package:turno_customer_application/data/network/api_endpoint.dart';
import 'package:turno_customer_application/data/network/api_provider.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

class OtpAPI implements APIRequestRepresentable {
  String? mobile;
  String? otp;

  OtpAPI._({required this.mobile, required this.otp});

  OtpAPI.verify(String mobile, String otp) : this._(mobile: mobile, otp: otp);

  @override
  String get endpoint => APIEndpoint.otpapi;

  @override
  String get path {
    return "";
  }

  @override
  get query => null;

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  @override
  Map<String, String> get body {
    return {"mobile": "$mobile", "otpCode": "$otp"};
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint;
}
