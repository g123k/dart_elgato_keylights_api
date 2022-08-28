/// Data provided for a given Elgato Key Light.
class KeyLightSettings {
  final int powerOnBehavior;
  final int powerOnBrightness;
  final int powerOnTemperature;
  final int switchOnDurationMs;
  final int switchOffDurationMs;
  final int colorChangeDurationMs;

  KeyLightSettings.fromJSON(dynamic json)
      : assert(json is Map),
        powerOnBehavior = json['powerOnBehavior'],
        powerOnBrightness = json['powerOnBrightness'],
        powerOnTemperature = json['powerOnTemperature'],
        switchOnDurationMs = json['switchOnDurationMs'],
        switchOffDurationMs = json['switchOffDurationMs'],
        colorChangeDurationMs = json['colorChangeDurationMs'];

  @override
  String toString() {
    return 'KeyLightSettings{powerOnBehavior: $powerOnBehavior, powerOnBrightness: $powerOnBrightness, powerOnTemperature: $powerOnTemperature, switchOnDurationMs: $switchOnDurationMs, switchOffDurationMs: $switchOffDurationMs, colorChangeDurationMs: $colorChangeDurationMs}';
  }
}
