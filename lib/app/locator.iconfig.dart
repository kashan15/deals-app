import 'package:deals_app/viewmodels/main_viewmodel.dart';
import 'package:deals_app/viewmodels/vendor_auth_viewmodel.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String? environment}) async{
  g.registerLazySingleton<MainViewModel>(() => MainViewModel());
  g.registerLazySingleton<VendorAuthViewModel>(() => VendorAuthViewModel());
}