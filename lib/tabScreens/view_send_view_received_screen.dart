import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:flutter/material.dart';




class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() => _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState extends State<ViewSentViewReceivedScreen> {

  bool isViewSentClicked = true;
  List<String> viewSentList = [];
  List<String> viewReceivedList = [];
  List viewsList = [];

  getViewListKeys() async
  {
    if(isViewSentClicked)
    {
      var viewSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString()).collection("viewSent")
          .get();
      for(int i =0; i<viewSentDocument.docs.length; i++)
      {
        viewSentList.add(viewSentDocument.docs[i].id);
      }
      getKeysDataFromUsersCollection(viewSentList);
    }
    else
    {
      var viewReceiveDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString()).collection("viewReceived")
          .get();
      for(int i =0; i<viewReceiveDocument.docs.length; i++)
      {
        viewReceivedList.add(viewReceiveDocument.docs[i].id);
      }

      getKeysDataFromUsersCollection(viewReceivedList);
    }

  }

  getKeysDataFromUsersCollection(List<String> keysList) async
  {
    var allUsersDocument = await FirebaseFirestore.instance.collection("users").get();

    for(int i = 0; i<allUsersDocument.docs.length; i++)
    {
      for(int k = 0; k<keysList.length; k++)
      {
        if(((allUsersDocument.docs[i].data() as dynamic)["uid"]) == keysList[k])
        {
          viewsList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      viewsList;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getViewListKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: ()
              {
                viewSentList.clear();
                viewSentList = [];
                viewReceivedList.clear();
                viewReceivedList = [];
                viewsList.clear();
                viewsList = [];
                setState(() {
                  isViewSentClicked = true;
                });
                getViewListKeys();
              },
              child: Text(
                "Просмотренные",
                style: TextStyle(
                  color: isViewSentClicked ? Colors.white : Colors.grey,
                  fontWeight: isViewSentClicked ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,

                ),

              ),
            ),

            const Text(
              "    |     ",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            TextButton(
              onPressed: ()
              {
                viewSentList.clear();
                viewSentList = [];
                viewReceivedList.clear();
                viewReceivedList = [];
                viewsList.clear();
                viewsList = [];
                setState(() {
                  isViewSentClicked = false;
                });
                getViewListKeys();
              },
              child: Text(
                "Смотрели меня",
                style: TextStyle(
                  color: isViewSentClicked ? Colors.grey : Colors.white,
                  fontWeight: isViewSentClicked ? FontWeight.normal : FontWeight.bold,
                  fontSize: 14,

                ),

              ),
            ),

          ],

        ),
        centerTitle: true,
      ),
      body: viewsList.isEmpty
          ? const Center(
        child: Icon(Icons.person_off_sharp, color: Colors.white, size: 60, ),
      )
          : GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        children: List.generate(viewsList.length, (index)
        {
          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                color: Colors.blue.shade200,
                child: GestureDetector(
                  onTap: ()
                  {

                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(viewsList[index]["imageProfile"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Spacer(),

                            //имя и возраст на картинке в избранных
                            Text(
                              viewsList[index]["name"].toString() + " ⦿ " + viewsList[index]["age"].toString(),
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            //город и страна на картинке во вкладке избранные
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    viewsList[index]["city"].toString() + " ⦿ " + viewsList[index]["country"].toString(),
                                    maxLines: 2,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
