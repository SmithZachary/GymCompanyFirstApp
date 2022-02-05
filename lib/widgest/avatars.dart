import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_bar_gym/models/user_model.dart';

class Avatar extends StatefulWidget {
  Avatar({
    Key? key,
    this.url,
    required this.radius,
    this.onTap,
  }) : super(key: key);

   Avatar.smallMedium({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 21,
        super(key: key);

  Avatar.small({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 18,
        super(key: key);

  Avatar.medium({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 26,
        super(key: key);

 Avatar.large({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 34,
        super(key: key);

  final double radius;
  final String? url;
  final VoidCallback? onTap;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
super.initState();

     FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
      this.loggedInUser = UserModel.formMap(value.data());

    });
    // var userPic = loggedInUser.picURL;

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: _avatar(context),
    );
  }

  Widget _avatar(BuildContext context) {
    var firstInitial = loggedInUser.fullName![0];
    int index = 0;
    final List<Color> colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange
    ];
    final _random = Random();

    if (widget.url != null) {
      return CircleAvatar(
        radius: widget.radius,
        backgroundImage: CachedNetworkImageProvider(widget.url!),
        backgroundColor: Theme.of(context).cardColor,
      );
    } else {
      return CircleAvatar(
        radius: widget.radius,
        backgroundColor: Colors.white70,
        child: Center(
          child: Text(
           loggedInUser.userName!,
            style: TextStyle(fontSize: widget.radius),
          ),
        ),
      );
    }
  }
}
