import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:get/get.dart';

import '../accountSettingsScreen/account_settings_screen.dart';



class UserDetailsScreen extends StatefulWidget {

  String? userID;

  UserDetailsScreen({super.key, this.userID,});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

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

  String urlImage1 = 'https://firebasestorage.googleapis.com/v0/b/dating-app-81f12.appspot.com/o/Place%20Holder%2Fprofile_icon.jpg?alt=media&token=8db040d7-b572-4ffb-be15-a696580b31fa';
  String urlImage2 = 'https://firebasestorage.googleapis.com/v0/b/dating-app-81f12.appspot.com/o/Place%20Holder%2Fprofile_icon.jpg?alt=media&token=8db040d7-b572-4ffb-be15-a696580b31fa';
  String urlImage3 = 'https://firebasestorage.googleapis.com/v0/b/dating-app-81f12.appspot.com/o/Place%20Holder%2Fprofile_icon.jpg?alt=media&token=8db040d7-b572-4ffb-be15-a696580b31fa';
  String urlImage4 = 'https://firebasestorage.googleapis.com/v0/b/dating-app-81f12.appspot.com/o/Place%20Holder%2Fprofile_icon.jpg?alt=media&token=8db040d7-b572-4ffb-be15-a696580b31fa';
  String urlImage5 = 'https://firebasestorage.googleapis.com/v0/b/dating-app-81f12.appspot.com/o/Place%20Holder%2Fprofile_icon.jpg?alt=media&token=8db040d7-b572-4ffb-be15-a696580b31fa';

  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot)
          {
            if(snapshot.exists)
            {
              if(snapshot.data()!["urlImage1"] != null)
              {
                setState(() {
                  urlImage1 = snapshot.data()!["urlImage1"];
                  urlImage2 = snapshot.data()!["urlImage2"];
                  urlImage3 = snapshot.data()!["urlImage3"];
                  urlImage4 = snapshot.data()!["urlImage4"];
                  urlImage5 = snapshot.data()!["urlImage5"];
                });

              }

              setState(() {
                name = snapshot.data()!["name"];
                age = snapshot.data()!["age"].toString();
                phoneNo = snapshot.data()!["phoneNo"];
                city = snapshot.data()!["city"];
                country = snapshot.data()!["country"];
                profileHeading = snapshot.data()!["profileHeading"];
                lookingForInaPartner = snapshot.data()!["lookingForInaPartner"];

                weight = snapshot.data()!["weight"];
                height = snapshot.data()!["height"];
                bodyType = snapshot.data()!["bodyType"];

                drink = snapshot.data()!["drink"];
                smoke = snapshot.data()!["smoke"];
                martialStatus = snapshot.data()!["martialStatus"];
                haveChildren = snapshot.data()!["haveChildren"];
                noOfChildren = snapshot.data()!["noOfChildren"];
                profession = snapshot.data()!["profession"];
                employmentStatus = snapshot.data()!["employmentStatus"];
                income = snapshot.data()!["income"];
                livingSituation = snapshot.data()!["livingSituation"];
                willingToRelocate = snapshot.data()!["willingToRelocate"];
                relationshipYouAreLookingFor = snapshot.data()!["relationshipYouAreLookingFor"];

                nationality = snapshot.data()!["nationality"];
                education = snapshot.data()!["education"];
                languageSpoken = snapshot.data()!["languageSpoken"];
                religion = snapshot.data()!["religion"];
                ethnicity = snapshot.data()!["ethnicity"];

              });
            }
          });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Профиль",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: widget.userID == currentUserID ? false : true,
        leading: widget.userID != currentUserID ? IconButton(
            onPressed: ()
            {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_outlined,  size: 30,)
        ) : Container(),
        actions: [
          widget.userID == currentUserID ?
          Row(
            children: [
              IconButton(
                onPressed: ()
                {
                  Get.to(AccountSettingsScreen());
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                ),
              ),
            ],
          ) : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              //листать картинки своего профиля
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    indicatorBarColor: Colors.black.withOpacity(0.3),
                    autoScrollDuration: const Duration(seconds: 2),
                    animationPageDuration: const Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.black,
                    animationPageCurve: Curves.easeIn,
                    indicatorBarHeight: 30,
                    indicatorHeight: 10,
                    indicatorWidth: 10,
                    unActivatedIndicatorColor: Colors.grey,
                    stopAtEnd: false,
                    autoScroll: true,
                    items: [
                      Image.network(urlImage1, fit: BoxFit.cover,),
                      Image.network(urlImage2, fit: BoxFit.cover,),
                      Image.network(urlImage3, fit: BoxFit.cover,),
                      Image.network(urlImage4, fit: BoxFit.cover,),
                      Image.network(urlImage5, fit: BoxFit.cover,),

                    ],
                  )
                ),

              ),


              const SizedBox(
                height: 20.0,
              ),
              //личная информация
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Личная информация",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              //таблица с личной информацией
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(5.0),
                child:  Table(
                  children: [

                    //имя
                    TableRow(
                      children: [
                        const Text(
                          "Имя: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //возраст
                    TableRow(
                      children: [
                        const Text(
                          "Возраст: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    //Номер телефона
                    TableRow(
                      children: [
                        const Text(
                          "Телефон: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          phoneNo,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),

                    //город
                    TableRow(
                      children: [
                        const Text(
                          "Город: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          city,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    //ищу в партнере
                    TableRow(
                      children: [
                        const Text(
                          "Ищу: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          lookingForInaPartner,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),



                  ],
                ),
              ),

              //внешность
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Внешность: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              //таблица данных о внешности
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Table(
                  children: [
                    //рост
                    TableRow(
                      children: [
                        const Text(
                          "Рост: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          height,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //вес
                    TableRow(
                      children: [
                        const Text(
                          "Вес: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          weight,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //телосложение
                    TableRow(
                      children: [
                        const Text(
                          "Телосложение: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          bodyType,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),


              //жизненные принципы
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Жизненные принципы: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //таблица жизненных принципов
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Table(
                  children: [
                    //напиток
                    TableRow(
                      children: [
                        const Text(
                          "Любимый напиток: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          drink,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //курение
                    TableRow(
                      children: [
                        const Text(
                          "Курение: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          smoke,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //служба в армии
                    TableRow(
                      children: [
                        const Text(
                          "Служба: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          martialStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //дети
                    TableRow(
                      children: [
                        const Text(
                          "Дети: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          haveChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //сколько детей
                    TableRow(
                      children: [
                        const Text(
                          "Сколько детей: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          noOfChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //профессия
                    TableRow(
                      children: [
                        const Text(
                          "Профессия: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          profession,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //Занятость
                    TableRow(
                      children: [
                        const Text(
                          "Занятость: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          employmentStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //Доход
                    TableRow(
                      children: [
                        const Text(
                          "Доход: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          income,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //Жизненная ситуация
                    TableRow(
                      children: [
                        const Text(
                          "Жизненная ситуация: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          livingSituation,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //Желание переехать
                    TableRow(
                      children: [
                        const Text(
                          "Переезд: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          willingToRelocate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //Что ищете в партнере
                    TableRow(
                      children: [
                        const Text(
                          "Ищу в партнере: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          relationshipYouAreLookingFor,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),


              //культурные ценности
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Культурные ценности: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //таблица культурных ценностей
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Table(
                  children: [
                    //национальность
                    TableRow(
                      children: [
                        const Text(
                          "Нация: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          drink,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //образование
                    TableRow(
                      children: [
                        const Text(
                          "Образование: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          education,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //родной язык
                    TableRow(
                      children: [
                        const Text(
                          "Язык: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          languageSpoken,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //религия
                    TableRow(
                      children: [
                        const Text(
                          "Религия: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          religion,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),

                    const TableRow(
                        children:
                        [
                          Text(""),
                          Text(""),
                        ]
                    ),
                    //этническая принадлежность
                    TableRow(
                      children: [
                        const Text(
                          "Этнос: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          ethnicity,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                      ],
                    ),



                  ],
                ),
              ),



            ],
          ),
        ),
      ),

    );
  }
}
