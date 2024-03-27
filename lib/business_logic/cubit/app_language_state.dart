part of 'app_language_cubit.dart';

@immutable
sealed class AppLanguageState {}

final class AppLanguageInitial extends AppLanguageState {}

final class AppChangeLanguage extends AppLanguageState {
  final String? languageCode;

  AppChangeLanguage({required this.languageCode});
}
