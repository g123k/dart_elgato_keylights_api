import 'package:elgato_keylight_api/elgato_keylight_api.dart';
import 'package:elgato_keylight_api/src/model/light_options.dart';

void main(List<String> arguments) {
  ElgatoKeylightAPI api = ElgatoKeylightAPI(
    ip: 'elgato-key-light-air-ace6.local',
    port: 9123,
  );

  printLightDetails(api);
}

Future<void> printLightDetails(ElgatoKeylightAPI api) async {
  print('Light accessory info...');
  print(await api.getLightAccessoryInfo());
  print('\nLight settings...');
  print(await api.getLightSettings());
  print('\nLight options...');
  KeyLightOptions lightOptions = await api.getLightOptions();
  print(lightOptions);

  api.updateLightOptions(
    lightOptions.updateWith(on: !lightOptions.lights.first.isOn),
  );
}
