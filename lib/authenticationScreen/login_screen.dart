import 'package:dating_app/authenticationScreen/registration_screen.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  var controllerAuth = AuthenticationController.authController;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [

                const SizedBox(
                  height: 130,
                ),
                
                Image.asset(
                  "images/logo.png",
                   width: 300,
                ),

                Text(
                  "Привет",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  "Войдите, чтобы найти лучшую пару",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),


                //ввод почты
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: emailTextEditingController,
                    lableText: "Email",
                    iconData: Icons.email_outlined,
                    isObscure: false,
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                //ввод пароля
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 55,
                  child: CustomTextFieldWidget(
                    editingController: passwordTextEditingController,
                    lableText: "Пароль",
                    iconData: Icons.lock_outline,
                    isObscure: true,
                  ),
                ),

                const SizedBox(
                  height: 23,
                ),

                //кнопка входа
                Container(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 50,
                  decoration: const BoxDecoration (
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),

                    ),
                  ),
                  child: InkWell(
                    onTap: () async
                    {
                      if(emailTextEditingController.text.trim().isNotEmpty
                      && passwordTextEditingController.text.trim().isNotEmpty)
                      {
                       setState(() {
                         showProgressBar = true;
                       });

                        await controllerAuth.loginUser(
                            emailTextEditingController.text.trim(),
                            passwordTextEditingController.text.trim()
                        );

                       setState(() {
                         showProgressBar = false;
                       });

                      }
                      else
                      {
                        Get.snackbar("Нет почты или пароля", "Заполните все поля");
                      }

                    },
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  ),
                ),


                const SizedBox(
                  height: 18,
                ),

                //если нет аккаунта, ссылка для создания аккаунта
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      "Нет аккаунта?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),

                    InkWell(

                      onTap: ()
                      {
                        Get.to(RegistrationScreen());
                      },
                      child: const Text(
                        "Зарегистрироваться",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 16,
                ),

                showProgressBar == true
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                      )
                    : Container(),

              ],
            ),
        ),

      ),
    );
  }
}