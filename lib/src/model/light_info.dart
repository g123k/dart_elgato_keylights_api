/// Information about an Elgato Keylight
/// The display name and features may be empty
class KeyLightInfo {
  final String productName;
  final int hardwareBoardType;
  final int firmwareBuildNumber;
  final String firmwareVersion;
  final String serialNumber;
  final String? displayName;
  final Iterable<String>? features;
  final KeyLightInfoWifi? wifi;

  KeyLightInfo.fromJSON(dynamic json)
      : assert(json is Map),
        productName = json['productName'],
        hardwareBoardType = json['hardwareBoardType'],
        firmwareBuildNumber = json['firmwareBuildNumber'],
        firmwareVersion = json['firmwareVersion'],
        serialNumber = json['serialNumber'],
        displayName = json['displayName'],
        features = json['features'] is Iterable
            ? (json['features'] as Iterable)
                .map((dynamic item) =>
                    item is String && item.isNotEmpty ? item : null)
                .where((element) => element != null)
                .cast()
            : null,
        wifi = json['wifi-info'] != null
            ? KeyLightInfoWifi._fromJSON(json['wifi-info'])
            : null;

  @override
  String toString() {
    return 'KeyLightInfo{productName: $productName, hardwareBoardType: $hardwareBoardType, firmwareBuildNumber: $firmwareBuildNumber, firmwareVersion: $firmwareVersion, serialNumber: $serialNumber, displayName: $displayName, features: $features, wifi: $wifi}';
  }
}

class KeyLightInfoWifi {
  final String ssid;
  final int frequency;
  final int rssi;

  KeyLightInfoWifi._fromJSON(dynamic json)
      : assert(json is Map),
        ssid = json['ssid'],
        frequency = json['frequencyMHz'],
        rssi = json['rssi'];

  @override
  String toString() {
    return 'KeyLightInfoWifi{ssid: $ssid, frequency: $frequency, rssi: $rssi}';
  }
}
