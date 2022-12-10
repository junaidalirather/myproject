class FlavorSettings {
  final String apiBaseUrl;

  //Add any additional flavor-specific settings here.

  FlavorSettings.dev() : apiBaseUrl = 'http://65.2.85.3:8888';

  FlavorSettings.prod() : apiBaseUrl = 'https://api.turnoclub.com';
}
