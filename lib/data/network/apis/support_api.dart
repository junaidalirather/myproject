import 'dart:io';
import 'package:turno_customer_application/data/network/api_request_representable.dart';
import '../api_endpoint.dart';
import '../api_provider.dart';

class SupportAPI implements APIRequestRepresentable {
  SupportAPI._();

  SupportAPI.fetch() : this._();

  @override
  String get endpoint => APIEndpoint.supportapi;

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

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

  @override
  String get path {
    return '/help';
  }
}
