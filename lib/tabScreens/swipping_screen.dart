import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/controllers/profile-controller.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SwippingScreen extends StatefulWidget {

  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen>
{
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";

  readCurrentUserdata() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((dataSnapshot)
    {
      setState(() {
        senderName = dataSnapshot.data()!["name"].toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
        {
          return PageView.builder(
            itemCount: profileController.allUsersProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index)
            {
              final eachProfileInfo = profileController.allUsersProfileList[index];

              return DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        eachProfileInfo.imageProfile.toString(),
                      ),
                      fit: BoxFit.cover,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: IconButton(
                            onPressed: ()
                            {


                            },
                            icon: const Icon(
                              Icons.filter_list,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      //данные пользователя
                      GestureDetector(
                        onTap: ()
                        {
                          profileController.viewSentAndViewReceived(
                            eachProfileInfo.uid.toString(),
                            senderName
                          );

                          Get.to(UserDetailsScreen(
                            userID: eachProfileInfo.uid.toString(),

                          ));
                        },
                        child: Column(
                          children: [
                            //отображение имени пользователя
                            Text(
                              eachProfileInfo.name.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                            //отображение возраста - города
                            Text(
                              eachProfileInfo.age.toString() + " ⦿ " + eachProfileInfo.city.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 4,
                              ),
                            ),

                            const SizedBox(
                              height: 5,
                            ),

                            //отображение профессии и религии в блоках после имени и города
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white30,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    )
                                  ),
                                  child: Text(
                                    eachProfileInfo.profession.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,

                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),

                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      )
                                  ),
                                  child: Text(
                                    eachProfileInfo.religion.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,

                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //страна и этническая принадлежность
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      )
                                  ),
                                  child: Text(
                                    eachProfileInfo.country.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,

                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),

                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      )
                                  ),
                                  child: Text(
                                    eachProfileInfo.ethnicity.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,

                                    ),
                                  ),
                                ),
                              ],
                            ),





                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      //кнопки для лайков фаворитов и перехода в чат
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //кнопка избранное
                          GestureDetector(
                            onTap: ()
                            {
                              profileController.favoriteSentAndFavoriteReceived(
                                eachProfileInfo.uid.toString(),
                                senderName

                              );
                            },
                            child: Image.asset(
                              "images/favorite.png",
                              width: 60,
                            ),

                          ),

                          //кнопка чат
                          GestureDetector(
                            onTap: ()
                            {

                            },
                            child: Image.asset(
                              "images/chat.png",
                              width: 90,
                            ),

                          ),

                          //кнопка лайк
                          GestureDetector(
                            onTap: ()
                            {
                              profileController.likeSentAndLikeReceived(
                                  eachProfileInfo.uid.toString(),
                                  senderName

                              );


                            },
                            child: Image.asset(
                              "images/like.png",
                              width: 60,
                            ),

                          ),
                          
                        ],
                      ),




                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
