import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_bar_gym/widgest/avatars.dart';
import 'package:the_bar_gym/widgest/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = context.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Profile'),
        leading: Center(
          child: IconBackground(
            icon: Icons.arrow_back_ios_new,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'hero-profile-picture',
              child: Avatar.large(url: 'user?.image'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No name'),
            ),
            const Divider(),
            const _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

class _SignOutButton extends StatefulWidget {
  const _SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  __SignOutButtonState createState() => __SignOutButtonState();
}

class __SignOutButtonState extends State<_SignOutButton> {
  bool _loading = false;

  // Future<void> _signOut() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //
  //   try {
  //     await StreamChatCore.of(context).client.disconnectUser();
  //
  //     Navigator.of(context).pushReplacement(SelectUserScreen.route);
  //   } on Exception catch (e, st) {
  //     logger.e('Could not sign out', e, st);
  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: () {},
            child: const Text('Sign out'),
          );
  }
}
