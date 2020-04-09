//Uygulama ilk açıldığında kullanılacak ola sayfadır.
import 'package:englishapp/app/sign_in/wellcome.dart';
import 'package:englishapp/ui/homepage.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return WellcomePage();
      } else {
        return HomePage(user: _userModel.user);
      }
    } else {
      return Scaffold(
        body: Center(),
      );
    }
  }
}
