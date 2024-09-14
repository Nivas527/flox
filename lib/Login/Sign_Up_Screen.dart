import 'package:flox/Google_signIn_Button_reuseable.dart';
import 'package:flox/InputTextField.dart';
import 'package:flox/Login/Button_Reuseable.dart';
import 'package:flox/Text_Button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {



  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/LoginpageBGimage.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -screenHeight * 0.04,
            right: -screenWidth * 0.05,
            child: CircleAvatar(
              radius: screenWidth * 0.24,
              backgroundImage: const AssetImage('assets/Circle.png'),
            ),
          ),
          Positioned(
            top: screenHeight * 0.01,
            right: screenWidth * 0.02,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: screenWidth * 0.18,
              backgroundImage: const AssetImage('assets/FOXL Logo.png'),
            ),
          ),
          Positioned(
            right: -screenWidth * 0.04,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Create a New Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 26,
                    height: 40.35 / 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: InputTextField(
                  ),
                ),
                Mybutton(
                  OnTap: () {
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.5,
                      height: 0.5,
                      color: const Color(0xff514B6B),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Or',
                      style: TextStyle(
                        color: Color(0xff514B6B),
                        fontSize: 12,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: screenWidth * 0.5,
                      height: 0.5,
                      color: const Color(0xff514B6B),
                    ),
                  ],
                ),
                GoogleSigninButton(
                  Googletext: 'Sign in with Google',
                  imagePath: 'assets/GoogleImage.png',
                  GoogleSignin: () {},
                ),
                TextButtonUser(
                  textreg: 'Sign in',
                  newbuttonregister: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
