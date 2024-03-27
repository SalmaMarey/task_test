import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:markaz_el_amal/app_localizations.dart';
import 'package:markaz_el_amal/business_logic/cubit/app_language_cubit.dart';
import 'package:markaz_el_amal/constants/shared_preferences.dart';
import 'package:markaz_el_amal/data/models/enums/languages_event_type.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLanguageCubit()
        ..appLanguageFunction(LanguageEventEnums.initialLanguage),
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          if (state is AppChangeLanguage) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              locale: Locale(state.languageCode!),
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocale, supportLocales) {
                for (var locale in supportLocales) {
                  if (deviceLocale != null) {
                    if (deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                }
                return supportLocales.first;
              },
              home: Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      Text(
                          AppLocalizations.of(context)!.translate("home_page")),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AppLanguageCubit>(context)
                              .appLanguageFunction(
                                  LanguageEventEnums.arabicLanguage);
                          sharedPreferences!.setString('lang', 'ar');
                        },
                        child: const Text('ar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AppLanguageCubit>(context)
                              .appLanguageFunction(
                                  LanguageEventEnums.englishLanguage);
                          sharedPreferences!.setString('lang', 'en');
                        },
                        child: const Text('en'),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportLocales) {
              for (var locale in supportLocales) {
                if (deviceLocale != null) {
                  if (deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
              }
              return supportLocales.first;
            },
            home: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.translate("home_page")),
                    ElevatedButton(
                      onPressed: () {
                        sharedPreferences!.setString('lang', 'ar');
                      },
                      child: const Text('ar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        sharedPreferences!.setString('lang', 'en');
                      },
                      child: const Text('en'),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
