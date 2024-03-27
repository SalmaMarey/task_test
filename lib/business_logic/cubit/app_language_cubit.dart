import 'package:bloc/bloc.dart';
import 'package:markaz_el_amal/constants/shared_preferences.dart';
import 'package:markaz_el_amal/data/models/enums/languages_event_type.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(AppLanguageInitial());

  appLanguageFunction(LanguageEventEnums eventType) {
    switch (eventType) {
      case LanguageEventEnums.initialLanguage:
        if (sharedPreferences!.getString('lang') != null) {
          if (sharedPreferences!.getString('lang') == 'ar') {
            emit(AppChangeLanguage(languageCode: 'ar'));
          } else {
            emit(AppChangeLanguage(languageCode: 'en'));
          }
        }
        break;
      case LanguageEventEnums.arabicLanguage:
        sharedPreferences!.setString('lang', 'ar');
        emit(AppChangeLanguage(languageCode: 'ar'));
        break;
      case LanguageEventEnums.englishLanguage:
        sharedPreferences!.setString('lang', 'en');
        emit(AppChangeLanguage(languageCode: 'en'));
        break;
    }
  }
}
