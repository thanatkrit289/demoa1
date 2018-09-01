import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

const APP_ID = null;
const ADS_BANNER = null;
const ADS_INTERSTITIAL = null;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() =>  _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fcontent = 24.0;

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: APP_ID != null ? [APP_ID] : null,
    keywords: ['Games', 'Puzzles'],
  );

  BannerAd bannerAd;
  InterstitialAd interstitialAd;
  RewardedVideoAd rewardedVideoAd;

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
//        adUnitId: ADS_BANNER,
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

  InterstitialAd buildInterstitial() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
//        adUnitId: ADS_INTERSTITIAL,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.failedToLoad) {
            interstitialAd..load();
          } else if (event == MobileAdEvent.closed) {
            interstitialAd = buildInterstitial()..load();
          }
          print(event);
        });
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
//    FirebaseAdMob.instance.initialize(appId: APP_ID);
    bannerAd = buildBanner()..load();
    interstitialAd = buildInterstitial()..load();
  }

  @override
  Widget build(BuildContext context) {
    bannerAd..show();
//    interstitialAd..show();

    Widget widgetContent1 = new Container(
        padding: new EdgeInsets.all(20.0),
        child:
        new Text(
          "Typhoon Nabi (pronounced [na.bi]), known in the Philippines as Typhoon Jolina, "
              "was a powerful typhoon that struck southwestern Japan in September 2005. "
              "The 14th named storm of the 2005 Pacific typhoon season, "
              "Nabi formed on August 29 to the east of the Northern Mariana Islands. "
              "It moved westward and passed about 55 km (35 mi) north of Saipan on August 31 "
              "as an intensifying typhoon. On the next day, the Joint Typhoon Warning Center "
              "upgraded the storm to super typhoon status, with winds equivalent to that of a "
              "Category 5 hurricane on the Saffir-Simpson Hurricane Scale. "
              "The Japan Meteorological Agency estimated peak ten-minute winds of 175 km/h "
              "(110 mph) on September 2. Nabi weakened while curving to the north, "
              "striking the Japanese island of Kyushu on September 6. After brushing South Korea,"
              " the storm turned to the northeast, passing over Hokkaido before becoming "
              "extratropical on September 8. \$",
          style: new TextStyle(
              fontSize: fcontent
          ),
        )
    );

    Widget widgetContent2 = new Container(
        padding: new EdgeInsets.all(20.0),
        child:
        new Text(
          "Typhoon Nabi (pronounced [na.bi]), known in the Philippines as Typhoon Jolina, "
              "was a powerful typhoon that struck southwestern Japan in September 2005. "
              "The 14th named storm of the 2005 Pacific typhoon season, "
              "Nabi formed on August 29 to the east of the Northern Mariana Islands. "
              "It moved westward and passed about 55 km (35 mi) north of Saipan on August 31 "
              "as an intensifying typhoon. On the next day, the Joint Typhoon Warning Center "
              "upgraded the storm to super typhoon status, with winds equivalent to that of a "
              "Category 5 hurricane on the Saffir-Simpson Hurricane Scale. "
              "The Japan Meteorological Agency estimated peak ten-minute winds of 175 km/h "
              "(110 mph) on September 2. Nabi weakened while curving to the north, "
              "striking the Japanese island of Kyushu on September 6. After brushing South Korea,"
              " the storm turned to the northeast, passing over Hokkaido before becoming "
              "extratropical on September 8. \$",
          style: new TextStyle(
              fontSize: fcontent
          ),
        )
    );

    Widget widgetImage1 = new Container(
      padding: EdgeInsets.all(15.0),
      child: new Image.asset('images/logo.png', width: 100.0, fit: BoxFit.cover,),
    );

    Widget widgetEmpt = new Container(
        padding: new EdgeInsets.all(20.0)
    );

    return  Scaffold(
        appBar: AppBar(
          title: Text('Twitter'),
          backgroundColor: Colors.blue,
        ),
        body: new ListView(children: <Widget>[
          widgetImage1, widgetContent1, widgetContent2, widgetEmpt
        ],)
    );
  }
}