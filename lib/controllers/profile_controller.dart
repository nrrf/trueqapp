import 'package:get/state_manager.dart';
import 'package:trueqapp/api/user_api.dart';
import 'package:trueqapp/models/user.dart';

class ProfileController extends GetxController {
  bool _loading = true;
  bool get loading => _loading;
  late User _user;
  User get user => _user;
  RegExp _regex = new RegExp(r'[a-zA-Z]');
  RegExp get regex => _regex;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadUser();
  }

  Future<void> loadUser() async {
    _user = await UserApi.instance.aboutMe();
    _loading = false;
    update(
      ['user'],
    );
  }

  String obscurePassword(){
    return _user.password.replaceAll(_regex, '●');
  }
}
