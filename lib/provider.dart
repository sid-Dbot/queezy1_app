import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'auth/authRepo.dart';

class Auth with ChangeNotifier {
  AWSauthRepo awSauthRepo;
  Auth({required this.awSauthRepo});

  String? email;
  String? password;
  String? userName;
  int step = 0;

  _nextStep() {
    step += 1;
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
