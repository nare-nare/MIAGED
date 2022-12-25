import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged/const/AppColors.dart';
import 'package:miaged/ui/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged/ui/bottom_nav_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miaged/widgets/myTextField.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _datenController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _codepController = TextEditingController();
  TextEditingController _villeController = TextEditingController();
  bool _obscureText = true;

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _datenController.text =
            "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef
        .doc(_emailController.text)
        .set({
          "nom": _nomController.text,
          "prenom": _prenomController.text,
          "daten": _datenController.text,
          "address": _addressController.text,
          "codep": _codepController.text,
          "ville": _villeController.text,
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (_) => BottomNavController())))
        .catchError((error) => print("something is wrong. $error"));
  }

  signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        sendUserDataToDB();
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vinted_color,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 22.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "exemple@gmail.com",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                              fontSize: 15.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),

                        TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: "password must be 6 character",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            labelText: 'PASSWORD',
                            suffixIcon: _obscureText == true
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      size: 20.w,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      size: 20.w,
                                    )),
                          ),
                        ),
                        

                        myTextField("Nom", TextInputType.text, _nomController),
                        myTextField(
                            "Prenom", TextInputType.text, _prenomController),
                        myTextField(
                            "Address", TextInputType.text, _addressController),
                        myTextField("Code postal", TextInputType.number,
                            _codepController),
                        myTextField(
                            "Ville", TextInputType.text, _villeController),

                        TextField(
                          controller: _datenController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "date de naissance",
                            suffixIcon: IconButton(
                              onPressed: () => _selectDateFromPicker(context),
                              icon: Icon(Icons.calendar_today_outlined),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        SizedBox(
                          height: 50.h,
                        ),
                        // elevated button
                        SizedBox(
                          width: 1.sw,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {
                              signUp();
                            },
                            child: Text(
                              "Creer mon compte",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.vinted_color,
                              elevation: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Avez vous deja un compte?",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                "Connectez-vous",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.vinted_color,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
