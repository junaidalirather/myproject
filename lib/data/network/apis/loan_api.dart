import 'dart:io';

import 'package:turno_customer_application/data/network/api_endpoint.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

import '../api_provider.dart';

class LoanAPI implements APIRequestRepresentable {
  String? mobile,loanAgreementId;

  LoanAPI._({required this.mobile, required this.loanAgreementId});

  LoanAPI.fetch(String mobile,String loanAgreementId) : this._(mobile: mobile,loanAgreementId: loanAgreementId);

  @override
  get body => {};

  @override
  String get endpoint => APIEndpoint.loanapi;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    return "/loans/$loanAgreementId";
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
