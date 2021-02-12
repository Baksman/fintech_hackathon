import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
}