import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(double fs, Color clr, [FontWeight? fw]) {
  return GoogleFonts.nunito(fontSize: fs, color: clr, fontWeight: fw);
}

showProgressIndicator() {
  return SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      );
    },
  );
}
