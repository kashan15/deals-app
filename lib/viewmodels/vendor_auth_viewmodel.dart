import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart' as stacked;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:deals_app/modules/allServices/navigation_service.dart'
as my_nav_service;


class VendorAuthViewModel extends BaseViewModel {

  var navigationService = my_nav_service.NavigationService();
  late SharedPreferences prefs;
  var dio = Dio();





}
