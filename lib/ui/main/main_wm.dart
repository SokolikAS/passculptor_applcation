import 'package:code_generator_app/objects/code_generator.dart';
import 'package:code_generator_app/objects/saved_json.dart';
import 'package:code_generator_app/ui/main/main_model.dart';
import 'package:code_generator_app/ui/main/main_screen.dart';
import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract interface class IMainScreenWidgetModel implements IWidgetModel {
  TextEditingController get wordController;

  TextEditingController get keyController;

  TextEditingController get loginController;

  ValueNotifier<String> get result;

  void onEnterTap();

  void onPasswordTap();

  void onObscureKeyTap();

  void onObscureLoginTap();

  ValueNotifier<bool> get isLoginObscured;

  ValueNotifier<bool> get isKeyObscured;

  void onDrawerTap(BuildContext context);

  BuildContext get context;

  ValueNotifier<bool> get doSave;

  void onSaveCheckTap();

  void onGuideTap();

  ValueNotifier<EntityState<Map<String, Set<String>>>>
      get savedWebsitesListenable;

  void onDrawerChanged(bool isDrawerOpened);
}

MainScreenWidgetModel defaultMainScreenWidgetModelFactory(
    BuildContext context) {
  return MainScreenWidgetModel(
    MainScreenModel(),
  );
}

class MainScreenWidgetModel extends WidgetModel<MainScreen, IMainScreenModel>
    implements IMainScreenWidgetModel {
  MainScreenWidgetModel(super.model);

  final _wordController = TextEditingController();

  @override
  TextEditingController get wordController => _wordController;

  final _keyController = TextEditingController();

  @override
  TextEditingController get keyController => _keyController;

  final _loginController = TextEditingController();

  @override
  TextEditingController get loginController => _loginController;

  final _result = ValueNotifier('Здесь появится пароль');

  @override
  ValueNotifier<String> get result => _result;

  @override
  Future<void> initWidgetModel() async {
    _jsonWebsites = await SavedJSon.create('saved_passwords');

    super.initWidgetModel();
  }

  @override
  Future<void> onEnterTap() async {
    result.value = CodeGenerator.generate(
      _wordController.text,
      _keyController.text,
      _loginController.text,
    );

    if (doSave.value) {
      _jsonWebsites.addPairToJson(
        _keyController.text,
        _wordController.text,
      );

      needsDrawerUpdate = true;
    }
  }

  @override
  void onPasswordTap() {
    ScaffoldMessenger.of(context).clearSnackBars();
    Clipboard.setData(
      ClipboardData(text: _result.value),
    ).then(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Пароль успешно скопирован!',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }

  @override
  void onObscureKeyTap() => _isKeyObscured.value = !_isKeyObscured.value;

  @override
  void onObscureLoginTap() => _isLoginObscured.value = !_isLoginObscured.value;

  final _isLoginObscured = ValueNotifier<bool>(true);

  @override
  ValueNotifier<bool> get isLoginObscured => _isLoginObscured;

  final _isKeyObscured = ValueNotifier<bool>(true);

  @override
  ValueNotifier<bool> get isKeyObscured => _isKeyObscured;

  @override
  void onDrawerTap(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  final _doSave = ValueNotifier<bool>(false);

  @override
  ValueNotifier<bool> get doSave => _doSave;

  @override
  void onSaveCheckTap() => _doSave.value = !_doSave.value;

  @override
  void onGuideTap() {
    // TODO: implement onGuideTap
  }

  @override
  Future<void> onDrawerChanged(bool isDrawerOpened) async {
    if (isDrawerOpened && needsDrawerUpdate) {
      await _initDrawer();
    }
  }

  Future<void> _initDrawer() async {
    _savedWebsitesEntity.loading();
    await Future.delayed(const Duration(seconds: 2));

    try {
      _savedWebsitesEntity.content(_jsonWebsites.jsonMap);
    } on Exception {
      _savedWebsitesEntity.error();
    }

    needsDrawerUpdate = false;
  }

  late final SavedJSon _jsonWebsites;

  bool needsDrawerUpdate = true;

  final _savedWebsitesEntity = EntityStateNotifier<Map<String, Set<String>>>();

  @override
  ValueNotifier<EntityState<Map<String, Set<String>>>>
      get savedWebsitesListenable => _savedWebsitesEntity;
}
