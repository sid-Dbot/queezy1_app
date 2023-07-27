import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Auth with ChangeNotifier {
  String? email;
  String? password;
  String? userName;
  int step=0 ;

  _nextStep() {
    step += 1;
  }
}
