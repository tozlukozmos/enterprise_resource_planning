import 'package:flutter/material.dart';

class AppText {

  Widget header({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20, color: color, fontFamily: "SourceSansProBold"),
    );
  }

  Widget label({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 14, color: color, fontFamily: "SourceSansPro"),
    );
  }

  Widget labelBold({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 14, color: color, fontFamily: "SourceSansProBold"),
    );
  }

  Widget context({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 16, color: color, fontFamily: "SourceSansPro"),
    );
  }

  Widget contextBold({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 16, color: color, fontFamily: "SourceSansProBold"),
    );
  }

  Widget contextSmall({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 12, color: color, fontFamily: "SourceSansPro"),
    );
  }

}
