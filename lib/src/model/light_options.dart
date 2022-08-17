class KeyLightOptions {
  final int number;
  final Iterable<KeyLightOption> lights;

  KeyLightOptions._({
    required this.number,
    required this.lights,
  });

  KeyLightOptions.fromJSON(dynamic json)
      : assert(json is Map),
        number = json['numberOfLights'],
        lights = (json['lights'] as Iterable).map(
          (dynamic json) => KeyLightOption._fromJSON(json),
        );

  Map<String, dynamic> toJSON() => {
        'numberOfLights': number,
        'lights': lights.map((e) => e._toJSON()).toList(growable: false),
      };

  KeyLightOptions updateWith({
    bool? on,
    int? brightness,
    int? temperature,
  }) =>
      KeyLightOptions._(
        number: number,
        lights: lights.map(
          (e) => e.updateWith(
            isOn: on,
            brightness: brightness,
            temperature: temperature,
          ),
        ),
      );

  @override
  String toString() {
    return 'KeyLightOptions{number: $number, lights: $lights}';
  }
}

class KeyLightOption {
  final bool isOn;
  final int brightness;
  final int temperature;

  KeyLightOption._({
    required this.isOn,
    required this.brightness,
    required this.temperature,
  });

  KeyLightOption._fromJSON(dynamic json)
      : assert(json is Map),
        isOn = json['on'] == 1,
        brightness = json['brightness'],
        temperature = json['temperature'];

  Map<String, dynamic> _toJSON() => {
        'on': isOn ? 1 : 0,
        'brightness': brightness,
        'temperature': temperature,
      };

  KeyLightOption updateWith({
    bool? isOn,
    int? brightness,
    int? temperature,
  }) =>
      KeyLightOption._(
        isOn: isOn ?? this.isOn,
        brightness: brightness ?? this.brightness,
        temperature: temperature ?? this.temperature,
      );

  @override
  String toString() {
    return 'KeyLightOptionsLight{isOn: $isOn, brightness: $brightness, temperature: $temperature}';
  }
}
