import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:da_hood/pages/profilepage.dart';
import 'package:da_hood/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../helper/helpermethod.dart';
import '../widgets/crib_posts.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("Users Post").add({
        'UserEmail': currentUser.email,
        'message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });
    }
    setState(() {
      textController.clear();
    });
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const ProfilePage();
      },
    ));
  }

  bool isScrolledAlready = false;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: isScrolledAlready
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              onPressed: () {
                _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.bounceIn);

                setState(() {
                  isScrolledAlready = true;
                });
              },
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 40,
              ),
            )
          : SizedBox(),
      drawer: MyDrawer(
        ProfileTap: goToProfilePage,
        OnSignout: signOut,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue[800]),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("D E V C R I B",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue[800],
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users Post")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return CribPosts(
                          message: post['message'],
                          user: post['UserEmail'],
                          time: formatDate(post['TimeStamp']),
                          postId: post.id,
                          likes: List<String>.from(post['Likes'] ?? []),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error:${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MytextField(
                      controller: textController,
                      hintText: 'Type in Your Message',
                      obscureText: false),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: postMessage,
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue[800],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
