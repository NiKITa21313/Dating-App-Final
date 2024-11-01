import 'package:dating_app/tabScreens/favorite_sent_favorite_received_screen.dart';
import 'package:dating_app/tabScreens/like_sent_like_received_screen.dart';
import 'package:dating_app/tabScreens/swipping_screen.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:dating_app/tabScreens/view_send_view_received_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  List tabScreenList =
  [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(userID: FirebaseAuth.instance.currentUser!.uid,)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber)
        {
          setState(() {
            screenIndex = indexNumber;
          });

        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: screenIndex,
        items: const [

          //переход на экран смахивания для поиска других пользователей
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: ""
          ),

          //просмотренные
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
                size: 30,
              ),
              label: ""
          ),

          //избранные
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
              ),
              label: ""
          ),

          //лайкнутые
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ""
          ),


          //личные данные пользователя
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: ""
          ),

        ],
        ),
      body: tabScreenList[screenIndex],
    );
  }
}
