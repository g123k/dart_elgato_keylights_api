import 'dart:convert';

import 'package:elgato_keylight_api/src/model/light_info.dart';
import 'package:elgato_keylight_api/src/model/light_options.dart';
import 'package:elgato_keylight_api/src/model/light_settings.dart';
import 'package:http/http.dart' as http;

/// Wrapper around the Elgato Key Light API.
/// To detect lights, please use the Bonjour protocol.
///
/// The API is divided in three parts:
/// - Options (current configuration of the light: on/off, temperature…)
/// - Accessory Info (details about a light: serial number…)
/// - Settings (some settings of the light: power on brightness…)
class ElgatoKeylightAPI {
  /// IP address of the light.
  ///
  /// Might be a regular IP address (eg 192.168.1.2) or a name
  /// (eg: elgato-key-light-air-ace6.local)
  final String ip;

  /// Port of the light
  final int port;

  ElgatoKeylightAPI({
    required this.ip,
    required this.port,
  })  : assert(ip.isNotEmpty),
        assert(port >= 0);


  /// Returns the current configuration of a light
  Future<KeyLightOptions> getLightOptions() {
    return http.get(Uri.parse(formatUrl('lights'))).then((response) {
      return KeyLightOptions.fromJSON(json.decode(response.body));
    });
  }

  /// Update a light configuration.
  /// Note: wait a few milliseconds between each request, as the call may be
  /// ignored otherwise
  Future<bool> updateLightOptions(KeyLightOptions newOptions) {
    return http
        .put(
      Uri.parse(formatUrl('lights')),
      body: jsonEncode(newOptions.toJSON()),
    )
        .then((response) {
      return response.statusCode == 200;
    });
  }

  /// Returns information about a light (serial number…)
  Future<KeyLightInfo> getLightAccessoryInfo() {
    return http.get(Uri.parse(formatUrl('accessory-info'))).then((response) {
      return KeyLightInfo.fromJSON(json.decode(response.body));
    });
  }

  /// Returns some extra information about a light
  Future<KeyLightSettings> getLightSettings() {
    return http.get(Uri.parse(formatUrl('lights/settings'))).then((response) {
      return KeyLightSettings.fromJSON(json.decode(response.body));
    });
  }

  String formatUrl(String endpoint) => 'http://$ip:$port/elgato/$endpoint';
}
