
import 'package:get_it/get_it.dart';


import '../../data/api.dart';
import '../../data/sharePrefs/share_prefs.dart';
import '../../data/sharePrefs/share_prefs_impl.dart';

final GetIt di=GetIt.instance;

void diSetup(){
  di.registerLazySingleton<SharePrefs>(() => SharePrefsImpl());
  di.registerLazySingleton<Api>(() => Api(),);
}