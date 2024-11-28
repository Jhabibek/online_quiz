import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_quiz/admin/add_question.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2,
              ),
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 52, 53, 51), Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.vertical(
                  top:
                      Radius.elliptical(MediaQuery.of(context).size.width, 110),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Form(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Admin Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 160, 160, 147),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: usernameController,
                                  validator: (value) {
                                    if (value == null || value.length < 5) {
                                      return 'Please Enter Username ';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 160, 160, 147),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 160, 160, 147),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.length < 8) {
                                      return 'Please Enter Valid Password..';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 160, 160, 147),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () => loginAdmin(),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "LogIn",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
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
            ),
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection('Admin').get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != usernameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Id Doesn't match ",
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        } else if (result.data()['password'] !=
            passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Password is incorrect",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else {
          Route route = MaterialPageRoute(builder: (context) => AddQuestion());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
