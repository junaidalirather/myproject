import 'dart:io';

import 'package:telephony/telephony.dart';
import 'package:turno_customer_application/data/network/api_endpoint.dart';
import 'package:turno_customer_application/data/network/api_provider.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

class BackGroundAPI implements APIRequestRepresentable {
  String? mobile;
  String? dataPushAt;
  List<SmsMessage> smsDump;

  BackGroundAPI._({required this.mobile,required this.dataPushAt, required this.smsDump});

  BackGroundAPI.pushSmsDump(String mobile,String dataPushAt, List<SmsMessage> smsDump) : this._(mobile: mobile,dataPushAt:dataPushAt, smsDump:smsDump);

  @override
  String get endpoint => APIEndpoint.smsdump;

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
  Map<String,dynamic> get body {
    return {"mobile": "$mobile", "dataPushAt": "$dataPushAt","smsDump":smsDump};
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint;
}
