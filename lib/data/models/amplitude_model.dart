

class AmplitudeModel {
  String? mobile;
  String? userLanguage;
  String? dateTime;
  double? appVersion;
  double? latitude;
  double? longitude;

  AmplitudeModel(
      {this.mobile,
      this.userLanguage,
      this.dateTime,
      this.appVersion,
      this.latitude,
      this.longitude}) {}

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'userLanguage': userLanguage,
        'latitude': latitude,
        'longitude': longitude,
        'dateTime': dateTime,
        'appVersion': appVersion,
      };
}
