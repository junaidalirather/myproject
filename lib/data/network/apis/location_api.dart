import 'dart:io';

import 'package:turno_customer_application/data/network/api_endpoint.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

import '../api_provider.dart';

class LocationApi implements APIRequestRepresentable {
  String? mobile;

  LocationApi._({required this.mobile});

  LocationApi.fetch(String mobile) : this._(mobile: mobile);

  @override
  get body => {};

  @override
  String get endpoint => APIEndpoint.location;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    return "$mobile/locationList";
  }

  @override
  get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
