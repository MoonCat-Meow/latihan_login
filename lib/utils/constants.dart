import 'package:flutter/material.dart';

Color kPrimaryColor(BuildContext context) =>
    Theme.of(context).scaffoldBackgroundColor;

Color kSecondaryColor(BuildContext context) =>
    Theme.of(context).primaryColor; // fallback
