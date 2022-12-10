

import 'dart:io';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum ReferralType {postDetails,getAllReferrals}

class CustomerReferralAPI implements APIRequestRepresentable {
  final ReferralType? type;
  String? mobile;
  dynamic referralModel;

  CustomerReferralAPI._({this.mobile,this.type,this.referralModel});

  CustomerReferralAPI.fetch(String mobile,ReferralType type) : this._(mobile: mobile,type:type);
  CustomerReferralAPI.post(dynamic referralModel,ReferralType type) : this._(referralModel: referralModel,type:type);


  @override
  get body {
    switch (type) {
      case ReferralType.getAllReferrals:
        return {};
      case ReferralType.postDetails:
        return referralModel;
      default:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.referralStatusDetails;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    switch (type) {
      case ReferralType.getAllReferrals:
        return HTTPMethod.get;
      case ReferralType.postDetails:
        return HTTPMethod.post;
      default:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case ReferralType.getAllReferrals:
        return "/$mobile/referrals";
      case ReferralType.postDetails:
        return "/referral";
      default:
        return "";
    }
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
