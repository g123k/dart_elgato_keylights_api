# Elgato Keylight API for Dart

## Features

This package provides an API for Elgato Keylights.

## Not covered

This plugin doesn't handle how to find a light IP address in your network. The [multicast_dns library](https://pub.dev/packages/multicast_dns)  should help you by using this query: 

```dart
ResourceRecordQuery.serverPointer('_elg._tcp.local');
```

## Getting started

For each light, you first have to create an `ElgatoKeylightAPI` object:

```dart
ElgatoKeylightAPI api = ElgatoKeylightAPI(
  ip: 'elgato-key-light-air-ace6.local',
  port: 9123,
);
```

## Get light info

There are three endpoints available: 

- `getLightOptions`
- `getLightAccessoryInfo`
- `getLightSettings`

## Update a light

After calling `getLightOptions()`, update the object and send it to `updateLightOptions()`:

```dart
KeyLightOptions lightOptions = await api.getLightOptions();

  api.updateLightOptions(
    lightOptions.updateWith(on: !lightOptions.lights.first.isOn),
  );
```

## Example of data

- Light accessory:

```json
{
  productName: "Elgato Key Light Air", 
  hardwareBoardType: 200, 
  firmwareBuildNumber: 216, 
  firmwareVersion: "1.0.3", serialNumber: "XXX", 
  displayName: "May be empty", 
  features: ["lights"], 
  wifi: {
    ssid: "XXX", 
    frequency: 1234, 
    rssi: -1
  }
}
```
 
- Light settings:
```json
{
  powerOnBehavior: 1,
  powerOnBrightness: 20, 
  powerOnTemperature: 213, 
  switchOnDurationMs: 100, 
  switchOffDurationMs: 300, 
  colorChangeDurationMs: 100
}
```


- Light options:
```json
{
  number: 1,
  lights: [
    {
      isOn: true,
      brightness: 28,
      temperature: 279
    }
  ]
```