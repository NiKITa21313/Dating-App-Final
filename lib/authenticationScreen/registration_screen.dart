import 'dart:io';

import 'package:dating_app/authenticationScreen/login_screen.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}




class _RegistrationScreenState extends State<RegistrationScreen>
{
  //личная информация
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();


  //внешность
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //стиль жизни
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingToRelocateTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();


  //культурные ценности
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();

  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),

              const Text(
                "Создать аккаунт",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),


              const Text(
                "Начать сейчас",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 18,
              ),


              //выбор картинки/аватарки
              authenticationController.imageFile == null ?
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "images/profile_icon.jpg"
                ),
                backgroundColor: Colors.black,
              ) :
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FileImage(
                      File(
                        authenticationController.imageFile!.path,
                      ),
                    ),
                  ),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.pickImageFileFromGallery();
                      setState(() {
                        authenticationController.imageFile;
                      });

                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.captureImageFromPhoneCamera();
                      setState(() {
                        authenticationController.imageFile;
                      });


                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),




              const SizedBox(
                height: 25,
              ),

              //личная информация

              const Text(
                "Личная информация:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              //имя
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  lableText: "Имя",
                  iconData: Icons.person_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
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
                height: 18,
              ),

              //возраст
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  lableText: "Возраст",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //номер телефона
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneTextEditingController,
                  lableText: "Телефон",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //город
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  lableText: "Город",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //страна
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  lableText: "Страна",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //заголовок
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  lableText: "Заголовок",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //что вы ищете в новом партнере
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  lableText: "Что вы ищете в партнере",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),



              //Внешность:
              const Text(
                "Внешность:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
        //рост
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController: heightTextEditingController,
            lableText: "Рост",
            iconData: Icons.insert_chart,
            isObscure: false,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        //вес
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController: weightTextEditingController,
            lableText: "Вес",
            iconData: Icons.table_chart,
            isObscure: false,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        //телосложение
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:bodyTypeTextEditingController,
            lableText: "Телосложение",
            iconData: Icons.type_specimen,
            isObscure: false,
          ),
        ),


        const SizedBox(
          height: 15,
        ),




        //Стиль жизни
        const Text(
          "Стиль жизни:",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        //Любимый напиток
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController: drinkTextEditingController,
            lableText: "Любимый напиток",
            iconData: Icons.local_drink_outlined,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        //Вредные привычки
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController: smokeTextEditingController,
            lableText: "Курение",
            iconData: Icons.smoking_rooms,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        //Служба в армии
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:martialStatusTextEditingController,
            lableText: "Военная служба",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Дети
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:haveChildrenTextEditingController,
            lableText: "Есть ли у вас дети?",
            iconData: CupertinoIcons.person_3_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Сколько у вас детей
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:noOfChildrenTextEditingController,
            lableText: "Сколько у вас детей?",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Профессия
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:professionTextEditingController,
            lableText: "Профессия",
            iconData: Icons.business_center,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Статус занятости
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:employmentStatusTextEditingController,
            lableText: "Статус занятости",
            iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),


        //Доход
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:incomeTextEditingController,
            lableText: "Доход",
            iconData: CupertinoIcons.money_dollar_circle,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Жизненная ситуация
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:livingSituationTextEditingController,
            lableText: "Жизненная ситуация",
            iconData: CupertinoIcons.person_2_square_stack,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Готовность поменять место жительства
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:willingToRelocateTextEditingController,
            lableText: "Вы готовы переехать?",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Какие отношения вы ищете?
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:relationshipYouAreLookingForTextEditingController,
            lableText: "Какие отношения вы ищете?",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),


        //Культурные ценности
        const Text(
          "Культурные ценности:",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        //Национальность
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController: nationalityTextEditingController,
            lableText: "Национальность",
            iconData: Icons.flag,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        //Образование
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController: educationTextEditingController,
            lableText: "Образование",
            iconData: Icons.cast_for_education,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        //Ваш родной язык
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:languageSpokenTextEditingController,
            lableText: "Родной язык",
            iconData: CupertinoIcons.person_badge_plus_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Религия
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:religionTextEditingController,
            lableText: "Ваша религия",
            //assetRef: "images/logo.png",
            iconData: CupertinoIcons.checkmark_seal_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 18,
        ),

        //Этническая принадлежность
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTextFieldWidget(
            editingController:ethnicityTextEditingController,
            lableText: "Этническая принадлежность",
            iconData: CupertinoIcons.eye,
            isObscure: false,
          ),
        ),
        const SizedBox(
             height: 18,
        ),


              //кнопка создания аккаунта
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
                    if(authenticationController.imageFile != null)
                    {
                      if(
                      nameTextEditingController.text.trim().isNotEmpty
                      && emailTextEditingController.text.trim().isNotEmpty
                      && passwordTextEditingController.text.trim().isNotEmpty
                      && ageTextEditingController.text.trim().isNotEmpty
                      && phoneTextEditingController.text.trim().isNotEmpty
                      && cityTextEditingController.text.trim().isNotEmpty
                      && countryTextEditingController.text.trim().isNotEmpty
                      && profileHeadingTextEditingController.text.trim().isNotEmpty
                      && lookingForInaPartnerTextEditingController.text.trim().isNotEmpty

                      && heightTextEditingController.text.trim().isNotEmpty
                      && weightTextEditingController.text.trim().isNotEmpty
                      && bodyTypeTextEditingController.text.trim().isNotEmpty

                      && drinkTextEditingController.text.trim().isNotEmpty
                      && smokeTextEditingController.text.trim().isNotEmpty
                      && martialStatusTextEditingController.text.trim().isNotEmpty
                      && haveChildrenTextEditingController.text.trim().isNotEmpty
                      && noOfChildrenTextEditingController.text.trim().isNotEmpty
                      && professionTextEditingController.text.trim().isNotEmpty
                      && employmentStatusTextEditingController.text.trim().isNotEmpty
                      && incomeTextEditingController.text.trim().isNotEmpty
                      && livingSituationTextEditingController.text.trim().isNotEmpty
                      && willingToRelocateTextEditingController.text.trim().isNotEmpty
                      && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty

                      && nationalityTextEditingController.text.trim().isNotEmpty
                      && educationTextEditingController.text.trim().isNotEmpty
                      && languageSpokenTextEditingController.text.trim().isNotEmpty
                      && religionTextEditingController.text.trim().isNotEmpty
                      && ethnicityTextEditingController.text.trim().isNotEmpty)
                      {

                        setState(() {
                          showProgressBar = true;
                        });

                      await authenticationController.createNewUserAccount(
                          authenticationController.profileImage!,
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
                          nameTextEditingController.text.trim(),
                          ageTextEditingController.text.trim(),
                          phoneTextEditingController.text.trim(),
                          cityTextEditingController.text.trim(),
                          countryTextEditingController.text.trim(),
                          profileHeadingTextEditingController.text.trim(),
                          lookingForInaPartnerTextEditingController.text.trim(),

                          heightTextEditingController.text.trim(),
                          weightTextEditingController.text.trim(),
                          bodyTypeTextEditingController.text.trim(),

                          drinkTextEditingController.text.trim(),
                          smokeTextEditingController.text.trim(),
                          martialStatusTextEditingController.text.trim(),
                          haveChildrenTextEditingController.text.trim(),
                          noOfChildrenTextEditingController.text.trim(),
                          professionTextEditingController.text.trim(),
                          employmentStatusTextEditingController.text.trim(),
                          incomeTextEditingController.text.trim(),
                          livingSituationTextEditingController.text.trim(),
                          willingToRelocateTextEditingController.text.trim(),
                          relationshipYouAreLookingForTextEditingController.text.trim(),

                          nationalityTextEditingController.text.trim(),
                          educationTextEditingController.text.trim(),
                          languageSpokenTextEditingController.text.trim(),
                          religionTextEditingController.text.trim(),
                          ethnicityTextEditingController.text.trim(),
                        );
                        setState(() {
                          showProgressBar = false;
                        });

                        authenticationController.imageFile = null;

                      }
                      else
                      {
                        Get.snackbar("A Field as Empty", "Заполните все поля");
                      }

                    }
                    else
                    {
                      Get.snackbar("Image File Missing", "Вы не выбрали фото профиля");
                    }
                  },
                  child: const Center(
                    child: Text(
                        "Создать",
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

              //если у вас уже есть учетная запись, кнопка входа в аккаунт
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Уже есть аккаунт?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(

                    onTap: ()
                    {
                      Get.back();
                    },
                    child: const Text(
                      "Войти",
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

              const SizedBox(
                height: 25,
              ),



            ],
          ),
        ),
      ),
    );
  }
}

