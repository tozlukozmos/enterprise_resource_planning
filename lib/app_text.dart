import 'package:flutter/material.dart';

class AppText {

  static Widget header({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20, color: color, fontFamily: "SourceSansProBold"),
    );
  }

  static Widget label({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 14, color: color, fontFamily: "SourceSansPro"),
    );
  }

  static Widget labelBold({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 14, color: color, fontFamily: "SourceSansProBold"),
    );
  }

  static Widget context({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 16, color: color, fontFamily: "SourceSansPro"),
    );
  }

  static Widget contextBold({
    required String data,
    required Color color,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 16, color: color, fontFamily: "SourceSansProBold"),
    );
  }

  static Widget contextSmall({
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
