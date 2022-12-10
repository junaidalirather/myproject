import 'dart:io';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum AuthType { login }

class LoginAPI implements APIRequestRepresentable {
  final AuthType type;
  String? mobile;

  LoginAPI._({required this.type, this.mobile});

  LoginAPI.login(String mobile) : this._(type: AuthType.login, mobile: mobile);

  @override
  String get endpoint => APIEndpoint.loginapi;

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return "$mobile";
      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'}
  ;

  @override
  get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  get body => {};
}
