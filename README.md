[English](https://github.com/appano1/juso/blob/main/README.md) | [한국어](https://github.com/appano1/juso/blob/main/translations/ko_KR/README.md)

# JUSO

Flutter package for address search in Korea

## Usage

Use `JusoWebView` for using [Kakao Korean address API](https://postcode.map.daum.net/guide)

```dart
const Scaffold(
  appBar: AppBar(),
  body: JusoWebView(),
);
```

`JusoWebView` will return `Juso` instance.

```dart
TextButton(
  onPressed: () async {
    final juso = await Navigator.push<Juso?>(
      context,
      MaterialPageRoute(builder: (context) => const JusoScreen()),
    );

    setState(() {
      this.juso = juso;
    });
  },
  child: const Text("Let's find Korean address 🚀"),
);
```

Use `address` when you want only basic address.

```dart
if (juso != null) Text('Address: ${juso!.address}');
```

Otherwise, following [this guide](https://postcode.map.daum.net/guide) for using  details of `Juso`.

## Setup

### IOS

Add following codes to your `Info.plist`

```xml
<key>NSAppTransportSecurity</key>
<dict>
  <!-- add this key to allow loading of local resources -->
  <key>NSAllowsLocalNetworking</key>
  <true/>
  <!-- add this key to show webview content  -->
  <key>NSAllowsArbitraryLoadsInWebContent</key>
  <true/>
</dict>
```

### Android

Android API level should be upper than 19
Please check your `<app dir>/android/app`

```gradle
android {
    ...
    defaultConfig {
        ...
        minSdkVersion 19
    }
}
```
