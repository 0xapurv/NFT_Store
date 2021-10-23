import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nft_marketplace/animations/image_animation.dart';
import 'package:nft_marketplace/routes.dart';
import 'package:nft_marketplace/widgets/bottom_left_clipper_bottom.dart';
import 'package:nft_marketplace/widgets/clip_shadow_path.dart';
import 'package:nft_marketplace/widgets/top_right_cipper_bottom.dart';
import 'package:nft_marketplace/widgets/top_right_clipper.dart';

import 'package:transparent_image/transparent_image.dart';

import 'login/bear_log_in_controller.dart';
import 'login/signin_button.dart';
import 'login/tracking_text_input.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bear_log_in_Controller _bear_log_inController;
  @override
  initState() {
    _bear_log_inController = bear_log_in_Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.0, 1.0],
                    colors: [
                      Colors.grey.shade900,
                      Colors.grey.shade800
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 200,
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: FlareActor(
                          "assets/Teddy.flr",
                          shouldClip: false,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.contain,
                          controller: _bear_log_inController,
                        )),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TrackingTextInput(
                                label: "Email",
                                hint: "What's your email address?",
                                onCaretMoved: (Offset? caret) {
                                  _bear_log_inController.lookAt(caret);
                                },
                              ),
                              TrackingTextInput(
                                label: "Password",
                                hint: "I'm not watching",
                                isObscured: true,
                                onCaretMoved: (Offset? caret) {
                                  _bear_log_inController.coverEyes(caret != null);
                                  _bear_log_inController.lookAt(null);
                                },
                                onTextChanged: (String value) {
                                  _bear_log_inController.setPassword(value);
                                },
                              ),
                              SigninButton(
                                child: Text("Sign In",
                                    style: TextStyle(
                                        fontFamily: "RobotoMedium",
                                        fontSize: 16,
                                        color: Colors.white)),
                                onPressed: () {
                                  _bear_log_inController.submitPassword();
                                  Navigator.of(context).pushReplacementNamed(RouteGenerator.homePage);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// rgb(235, 228, 229)
