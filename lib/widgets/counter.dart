// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class VpTextFormField extends StatelessWidget {
//   const VpTextFormField(this.formControlName, this.hintText,
//       {required this.maxLength,
//         this.textAlign = TextAlign.left,
//         required this.validationMessages});
//
//   final TextAlign textAlign;
//   final String formControlName;
//   final String hintText;
//   final int maxLength;
//   final Map<String, String> Function(AbstractControl<dynamic>)
//   validationMessages;
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveTextField(
//         formControlName: formControlName,
//         validationMessages: validationMessages,
//         maxLength: maxLength,
//         buildCounter: counter(context,
//             currentLength: 0, isFocused: false, maxLength: maxLength),
//         decoration: InputDecoration(hintText: hintText),
//         textAlign: textAlign);
//   }
// }
//
// Widget Function(BuildContext,
//     {int currentLength, bool isFocused, int maxLength}) counter(
//     BuildContext context, {
//       int currentLength,
//       bool isFocused,
//       int maxLength,
//     }) {
//   return (context, {currentLength, isFocused, maxLength}) => Container(
//       child: Text(
//         '$currentLength of $maxLength characters',
//         semanticsLabel: 'character count',
//       ),
//       alignment: Alignment.bottomRight);
// }