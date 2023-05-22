import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'like_button.dart';

class CribPosts extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  const CribPosts(
      {Key? key,
      required this.message,
      required this.user,
      required this.likes,
      required this.postId})
      : super(key: key);

  @override
  State<CribPosts> createState() => _CribPostsState();
}

class _CribPostsState extends State<CribPosts> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentuser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('Users Post').doc(widget.postId);
    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentuser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentuser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 25, left: 5, right: 25),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Column(
            children: [
              LikeButton(
                isLiked: isLiked,
                onTap: toggleLike,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.likes.length.toString(),
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.message,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
