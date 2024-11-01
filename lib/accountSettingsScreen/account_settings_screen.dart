import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/homeScreen/home_screen.dart';
import 'package:dating_app/widgets/custom_text_field_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';




class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen>
{
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlsList = [];
  double val = 0;


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



  //******************************
  String name = '';
  String age = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  String height = '';
  String weight = '';
  String bodyType = '';

  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';



  chooseImage() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  uploadImages() async
  {
    int i = 1;

    for(var img in _image)
    {
      setState(() {
        val = i / _image.length;
      });

      var refImages = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg");

      await refImages.putFile(img)
              .whenComplete(() async
      {
        await refImages.getDownloadURL().then((urlImage)
        {
          urlsList.add(urlImage);
          i++;
        });
      });

    }

  }

  retrieveUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
      {
        setState(() {

          name = snapshot.data()!['name'];
          nameTextEditingController.text = name;
          age = snapshot.data()!['age'].toString();
          ageTextEditingController.text = age;
          phoneNo = snapshot.data()!['phoneNo'];
          phoneTextEditingController.text = phoneNo;
          city = snapshot.data()!['city'];
          cityTextEditingController.text = city;
          country = snapshot.data()!['country'];
          countryTextEditingController.text = country;
          profileHeading = snapshot.data()!['profileHeading'];
          profileHeadingTextEditingController.text = profileHeading;
          lookingForInaPartner = snapshot.data()!['lookingForInaPartner'];
          lookingForInaPartnerTextEditingController.text = lookingForInaPartner;

          weight = snapshot.data()!['weight'];
          weightTextEditingController.text = weight;
          height = snapshot.data()!['height'];
          heightTextEditingController.text = height;
          bodyType = snapshot.data()!['bodyType'];
          bodyTypeTextEditingController.text = bodyType;

          drink = snapshot.data()!['drink'];
          drinkTextEditingController.text = drink;
          smoke = snapshot.data()!['smoke'];
          smokeTextEditingController.text = smoke;
          martialStatus = snapshot.data()!['martialStatus'];
          martialStatusTextEditingController.text = martialStatus;
          haveChildren = snapshot.data()!['haveChildren'];
          haveChildrenTextEditingController.text = haveChildren;
          noOfChildren = snapshot.data()!['noOfChildren'];
          noOfChildrenTextEditingController.text = noOfChildren;
          profession = snapshot.data()!['profession'];
          professionTextEditingController.text = profession;
          employmentStatus = snapshot.data()!['employmentStatus'];
          employmentStatusTextEditingController.text = employmentStatus;
          income = snapshot.data()!['income'];
          incomeTextEditingController.text = income;
          livingSituation = snapshot.data()!['livingSituation'];
          livingSituationTextEditingController.text = livingSituation;
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          willingToRelocateTextEditingController.text = willingToRelocate;
          relationshipYouAreLookingFor = snapshot.data()!['relationshipYouAreLookingFor'];
          relationshipYouAreLookingForTextEditingController.text = relationshipYouAreLookingFor;

          nationality = snapshot.data()!['nationality'];
          nationalityTextEditingController.text = nationality;
          education = snapshot.data()!['education'];
          educationTextEditingController.text = education;
          languageSpoken = snapshot.data()!['languageSpoken'];
          languageSpokenTextEditingController.text = languageSpoken;
          religion = snapshot.data()!['religion'];
          religionTextEditingController.text = religion;
          ethnicity = snapshot.data()!['ethnicity'];
          ethnicityTextEditingController.text = ethnicity;

        });
      }
    });
  }



  updateUserDataToFirestoreDatabase(
      String name,
      String age, String phoneNo,
      String city, String country,
      String profileHeading, String lookingForInaPartner,

      String height, String weight, String bodyType,

      String drink, String smoke,
      String martialStatus, String haveChildren,
      String noOfChildren, String profession,
      String employmentStatus, String income,
      String livingSituation, String willingToRelocate,
      String relationshipYouAreLookingFor,

      String nationality, String education,
      String languageSpoken, String religion, String ethnicity,
      ) async
  {
    showDialog(
        context: context,
        builder: (context)
        {
          return const AlertDialog(
            content: SizedBox(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("загрузка фото..."),

                  ],
                ),
              ),
            ),
          );
        }
    );

    await uploadImages();

    await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID)
      .update({
      "name": name,
      "age": age,
      "phoneNo": phoneNo,
      "city": city,
      "country": country,
      "profileHeading": profileHeading,
      "lookingForInaPartner": lookingForInaPartner,

      "height": height,
      "weight": weight,
      "bodyType": bodyType,

      "drink": drink,
      "smoke": smoke,
      "martialStatus": martialStatus,
      "haveChildren": haveChildren,
      "noOfChildren": noOfChildren,
      "profession": profession,
      "employmentStatus": employmentStatus,
      "income": income,
      "livingSituation": livingSituation,
      "willingToRelocate": willingToRelocate,
      "relationshipYouAreLookingFor": relationshipYouAreLookingFor,

      "nationality": nationality,
      "education": education,
      "languageSpoken": languageSpoken,
      "religion": religion,
      "ethnicity": ethnicity,

      "urlImage1": urlsList[0].toString(),
      "urlImage2": urlsList[1].toString(),
      "urlImage3": urlsList[2].toString(),
      "urlImage4": urlsList[3].toString(),
      "urlImage5": urlsList[4].toString(),

      });

    Get.snackbar("Обновление", "Ваши данные обновлены");

    Get.to(HomeScreen());

    setState(() {
      uploading = false;
      _image.clear();
      urlsList.clear();
    });
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Информация профиля" : "Выберите 5 фотографий",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          next
          ? Container()
          : IconButton(
              onPressed: ()
              {
                if(_image.length == 5)
                {
                  setState(() {
                    uploading = false;
                    next = true;
                  });
                }
                else
                {
                  Get.snackbar("5 фото", "Выберите 5 фотографий");
                }
              },
              icon: const Icon(Icons.navigate_next_outlined, size: 36,),
          ),
        ],
      ),
      body: next
      ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(
                height: 2,
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



              //Стиль жизни ********************
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
                    if(
                    nameTextEditingController.text.trim().isNotEmpty
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
                      _image.length > 0 ?
                      await updateUserDataToFirestoreDatabase(

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
                      ) : null;
                    }
                    else
                    {
                      Get.snackbar("A Field as Empty", "Заполните все поля");
                    }
                  },
                  child: const Center(
                    child: Text(
                        "Обновить",
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



            ],
          ),
        ),
      )
      : Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: GridView.builder(
              itemCount: _image.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index)
              {
                return index == 0
                ? Container(
                  color: Colors.white30,
                  child: Center(
                    child: IconButton(
                      onPressed: ()
                      {
                        if(_image.length < 5)
                        {
                          !uploading ? chooseImage() : null;
                        }
                        else
                        {
                          setState(() {
                            uploading == true;
                          });

                          Get.snackbar("Уже выбрано 5 фото", "Все 5 фото установлены");
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                )
                : Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                          _image[index - 1]
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
