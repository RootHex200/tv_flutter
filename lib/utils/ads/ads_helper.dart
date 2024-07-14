// ad_helper.dart
import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7366330184905246/6639918512'; // Test rewarded ad unit ID for Android
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313'; // Test rewarded ad unit ID for iOS
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

}

// Admob: 

// App ID: ca-app-pub-7366330184905246~2509580749
// Banner ID: ca-app-pub-7366330184905246/7957504077
// Interstitial ID: ca-app-pub-7366330184905246/8448458660
// Reward ID: ca-app-pub-7366330184905246/6639918512