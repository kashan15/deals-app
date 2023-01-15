import 'package:deals_app/app/locator.dart';
import 'package:deals_app/views/contact_us.dart';
import 'package:deals_app/views/discount_offer.dart';
import 'package:deals_app/views/edit_profile.dart';
import 'package:deals_app/views/favourite/favourites.dart';
import 'package:deals_app/views/forgetpass_one.dart';
import 'package:deals_app/views/friend/chatScreen.dart';
import 'package:deals_app/views/friend/chat_screen.dart';
import 'package:deals_app/views/friend/friends_list.dart';
import 'package:deals_app/views/friend/friends_profile.dart';
import 'package:deals_app/views/friend/inbox.dart';
import 'package:deals_app/views/interest_one.dart';
import 'package:deals_app/views/location.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/utils/size_config.dart';
import 'package:deals_app/views/bookings.dart';
import 'package:deals_app/views/checkInScreen.dart';
import 'package:deals_app/views/forgetpass.dart';
import 'package:deals_app/views/friend/inbox.dart';
import 'package:deals_app/views/interest/interest.dart';
import 'package:deals_app/views/login.dart';
import 'package:deals_app/views/main_views/main_views.dart';
import 'package:deals_app/views/notification/notification.dart';
import 'package:deals_app/views/onboarding.dart';
import 'package:deals_app/views/register.dart';
import 'package:deals_app/views/reviews.dart';
import 'package:deals_app/views/reviews_one.dart';
import 'package:deals_app/views/search.dart';
import 'package:deals_app/views/search_food_drink.dart';
import 'package:deals_app/views/settings.dart';
import 'package:deals_app/views/splash.dart';
import 'package:deals_app/views/user_profile.dart';
import 'package:deals_app/views/verification.dart';
import 'package:deals_app/views/votings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import '../utils/screen_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configure();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      home: MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MainViews(index: 0);
          },);},
    );}}
