import 'package:flutter/material.dart';
import 'package:otlop_app/SignIn.dart';
import 'package:otlop_app/home_page.dart';
import 'package:otlop_app/text_style.dart';
import 'package:otlop_app/reusable_widgets.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create an account", style: AppTextStyles.boldtext),
                    Text(
                      "Connect with your friends today!",
                      style: AppTextStyles.greytext,
                    ),
                  ],
                ),
              ),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: AppTextStyles.orangetext),
                  SizedBox(height: 5),
                  Reuse.customTextField(label: "Enter your name"),
                  SizedBox(height: 5),
                  Text("Email Address", style: AppTextStyles.orangetext),
                  SizedBox(height: 5),
                  Reuse.customTextField(label: "Enter your email"),
                  SizedBox(height: 5),
                  Text("Phone Number", style: AppTextStyles.orangetext),
                  SizedBox(height: 5),
                  Reuse.customTextField(label: "Enter your phone"),
                  SizedBox(height: 5),
                  Text("Password", style: AppTextStyles.orangetext),
                  SizedBox(height: 5),
                  Reuse.customTextField(
                    label: "Please Enter Your Password",
                    icon: Icon(Icons.password),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            isChecked = !isChecked;
                            setState(() {});
                          },
                          icon: isChecked
                              ? Icon(Icons.check_box, color: Colors.green)
                              : Icon(Icons.check_box_outline_blank),
                        ),
                        Text("Remember Me"),
                        Spacer(),
                        GestureDetector(
                          child: Text(
                            "Forgot Password",
                            style: AppTextStyles.orangetext,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Reuse.orangeButton(context:context,page: HomePage(), text: "Sign Up")
                  ,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(width: 10),
                        Text("Or With"),
                        SizedBox(width: 10),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Reuse.customSocialMediaButton(
                          imageName: "images/github.svg",
                          text: "Git Hub",
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Reuse.customSocialMediaButton(
                          imageName: "images/gitlab.svg",
                          text: "Git Lab",
                        ),
                      ),
                    ],
                  ),SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: AppTextStyles.greytext,
                      ),
                      GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signin()),
                        );
                      },
                        child: Text("Login", style: AppTextStyles.orangetext),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
