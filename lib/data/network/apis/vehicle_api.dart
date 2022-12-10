import 'dart:io';

import 'package:turno_customer_application/data/network/api_provider.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

import '../api_endpoint.dart';

class VehicleAPI implements APIRequestRepresentable {
  String? mobile;

  VehicleAPI._({required this.mobile});

  VehicleAPI.fetch(String mobile) : this._(mobile: mobile);

  @override
  get body => {};

  @override
  String get endpoint => APIEndpoint.vehicleapi;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    return "$mobile/vehicles";
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
