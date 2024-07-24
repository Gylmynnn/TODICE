import 'package:flutter/material.dart';

class SettingsModel {
  final Icon leading;
  final String title;
  final VoidCallback onTap;

  SettingsModel({
    required this.leading,
    required this.title,
    required this.onTap,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        leading: json['leading'],
        title: json['title'],
        onTap: json['onTap'],
      );

  Map<String, dynamic> toJson() => {
        'leading': leading,
        'title': title,
        'onTap': onTap,
      };
}
