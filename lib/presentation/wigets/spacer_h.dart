import 'package:flutter/material.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';

class SpacerH extends StatelessWidget {
  const SpacerH({this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: value ?? Dimens.space8,
    );
  }
}
