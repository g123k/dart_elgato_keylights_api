import 'dart:convert';

import 'package:elgato_keylight_api/src/model/light_info.dart';
import 'package:elgato_keylight_api/src/model/light_options.dart';
import 'package:elgato_keylight_api/src/model/light_settings.dart';
import 'package:http/http.dart' as http;

class ElgatoKeylightAPI {
  final String ip;
  final int port;

  ElgatoKeylightAPI({
    required this.ip,
    required this.port,
  })  : assert(ip.isNotEmpty),
        assert(port >= 0);

  Future<KeyLightOptions> getLightOptions() {
    return http.get(Uri.parse(formatUrl('lights'))).then((response) {
      return KeyLightOptions.fromJSON(json.decode(response.body));
    });
  }

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

  Future<KeyLightInfo> getLightAccessoryInfo() {
    return http.get(Uri.parse(formatUrl('accessory-info'))).then((response) {
      return KeyLightInfo.fromJSON(json.decode(response.body));
    });
  }

  Future<KeyLightSettings> getLightSettings() {
    return http.get(Uri.parse(formatUrl('lights/settings'))).then((response) {
      return KeyLightSettings.fromJSON(json.decode(response.body));
    });
  }

  String formatUrl(String endpoint) => 'http://$ip:$port/elgato/$endpoint';
}
