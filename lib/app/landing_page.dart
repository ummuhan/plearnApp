//Uygulama ilk açıldığında kullanılacak ola sayfadır.
import 'package:englishapp/app/sign_in/wellcome.dart';
import 'package:englishapp/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class landingPage extends StatelessWidget {

      @override
      Widget build(BuildContext context) {
        final _userModel=Provider.of<UserModel>(context);

        if(_userModel.state==ViewState.Idle){
          if(_userModel.user==null){
             return wellcomePage();
          }else{
            return homePage(user: _userModel.user);
          }
        }else{
          return Scaffold(
            body: Center(),
            
          );

        }
      }

} 
