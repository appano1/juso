[English](https://github.com/appano1/juso/blob/main/README.md) | [한국어](https://github.com/appano1/juso/blob/main/translations/ko_KR/README.md)

# JUSO

대한민국 우편번호 서비스를 위한 플러터 패키지입니다.

## 사용방법

`JusoWebView`로 [카카오 우편번호 서비스](https://postcode.map.daum.net/guide)를 이용하세요.

```dart
const Scaffold(
  appBar: AppBar(),
  body: JusoWebView(),
);
```

`JusoWebView`는 `Juso` 인스턴스를 반환합니다.

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

단순히 기본 주소만 이용하길 원한다면 `address`를 이용하세요.

```dart
if (juso != null) Text('주소: ${juso!.address}');
```

세부 정보를 이용하고 싶으시다면, 해당 [가이드](https://postcode.map.daum.net/guide)에서 `Juso`의 세부 정보를 확인해보세요.

## Setup

### IOS

아래 코드를 `Info.plist`에 추가해주세요.

```plist
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

`<app dir>/android/app`에서 안드로이드 API 수준을 19 이상으로 설정해주세요.

```gradle
android {
    ...
    defaultConfig {
        ...
        minSdkVersion 19
    }
}
```
