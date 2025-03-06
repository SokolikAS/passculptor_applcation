import 'package:code_generator_app/objects/code_generator.dart';
import 'package:code_generator_app/objects/saved_json.dart';
import 'package:code_generator_app/ui/main/main_model.dart';
import 'package:code_generator_app/ui/main/main_screen.dart';
import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:elementary/elementary.dart';
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

  ValueNotifier<SavedJSon> get savedPasswords;
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
  void onEnterTap() {
    result.value = CodeGenerator.generate(
      _wordController.text,
      _keyController.text,
      _loginController.text,
    );

    if (doSave.value) {
      _savedPasswords.value.add(_keyController.text, _wordController.text);
      print(_savedPasswords.value);
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

  final _savedPasswords = ValueNotifier<SavedJSon>(SavedJSon());

  @override
  ValueNotifier<SavedJSon> get savedPasswords => _savedPasswords;
}
