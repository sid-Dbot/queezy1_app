import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:queezy1_app/Views/resetPassword.dart';

import 'auth/authRepo.dart';

class Auth with ChangeNotifier {
  AWSauthRepo awSauthRepo;
  Auth({required this.awSauthRepo});
  String? email;
  String? password;
  setEmail(String text) {
    email = text;
    notifyListeners();
  }

  setPass(String p) {
    password = p;
  }

  resetPassword(String email) async {
    await awSauthRepo.resetPassword(email);
  }

  signIn(String email, String password) async {
    await awSauthRepo.signIn(email, password);
  }

  signUp(String email, String password, String userName) async {
    await awSauthRepo.signUp(email, password, userName);
  }
}

class SignUpSteps with ChangeNotifier {
  String? appBarTitle;
  String? textFieldTitle;
  double? progress;
  int? step;

  initialState() {
    appBarTitle = 'What\s your Email?';
    textFieldTitle = 'Email Address';
    progress = 0.33;
    step = 1;
    notifyListeners();
  }

  nextState(String appBar, String title, double p, int s) {
    appBarTitle = appBar;
    textFieldTitle = title;
    progress = p;
    step = s;
    notifyListeners();
  }
}
