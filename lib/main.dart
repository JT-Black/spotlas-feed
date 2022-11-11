import 'package:flutter/material.dart';
import 'package:spaces/spaces.dart';
import 'package:spotlas_feed/presentation_layer/screens/feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotlas',
      theme: ThemeData(
        primarySwatch: white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => Spacing(
        dataBuilder: (context) {
          final mediaQuery = MediaQuery.of(context);
          if (mediaQuery.size.width < 375) {
            return SpacingData.fromSpaces(
                extraSmall: 1,
                small: 2,
                semiSmall: 4,
                normal: 8,
                semiBig: 12,
                big: 16,
                extraBig: 32);
          } else if (mediaQuery.size.width > 374 && mediaQuery.size.width < 428) {
            return SpacingData.fromSpaces(
                extraSmall: 2,
                small: 4,
                semiSmall: 8,
                normal: 12,
                semiBig: 16,
                big: 24,
                extraBig: 48);
          }
          return SpacingData.fromSpaces(
              extraSmall: 3,
              small: 6,
              semiSmall: 12,
              normal: 16,
              semiBig: 24,
              big: 32,
              extraBig: 56);
        },
        child: child ?? const SizedBox(),
      ),
      home: const Feed(),
    );
  }
}

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
