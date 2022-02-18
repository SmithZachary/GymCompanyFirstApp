import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bar_gym/screens/photoTest/widgets/home/home_screen.dart';
import 'package:the_bar_gym/theme.dart';
import 'package:the_bar_gym/screens/photoTest/utils/image_gallery_list.dart';
import 'package:the_bar_gym/screens/photoTest/utils/image_notifier.dart';


class PhotoDisplay extends StatelessWidget {
  const PhotoDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImageNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageGalleryList(),
        ),
      ],
      child: MaterialApp(
        title: 'Image Gallery',
        debugShowCheckedModeBanner: false,

        home: const HomePhotoScreen(),
      ),
    );
  }
}
