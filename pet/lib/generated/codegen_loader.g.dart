// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "my_notes": "Мои заметки",
  "update": "Обновить",
  "new_todo": "Новая заметка",
  "save": "Обновить",
  "water_meter": "Счетчик воды",
  "weather": "Погода",
  "settings": "Настройки",
  "languish": "Язык",
  "color_theme": "Цветовая схема",
  "failed_to_load_album": "Ошибка загрузки альбома",
  "wind": "Ветер",
  "pressure": "Давление",
  "humidity": "Влажность",
  "cancel": "Отменить"
};
static const Map<String,dynamic> en = {
  "my_notes": "My notes",
  "update": "Update",
  "new_todo": "New todo",
  "save": "Save",
  "water_meter": "Water meter",
  "weather": "Weather",
  "settings": "Settings",
  "languish": "Languish",
  "color_theme": "Color theme",
  "failed_to_load_album": "Failed to load album",
  "wind": "Wind",
  "pressure": "Pressure",
  "humidity": "humidity",
  "cancel": "cancel"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
