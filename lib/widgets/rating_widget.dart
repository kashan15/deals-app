import 'package:deals_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  dynamic initialRating;
  RatingWidget({this.initialRating});


  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction:
      Axis.horizontal,
      allowHalfRating: true,
      itemSize: 2.h,
      itemCount: 5,
      itemPadding: EdgeInsets
          .symmetric(
          horizontal:
          1.0),
      itemBuilder:
          (context, _) =>
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
      onRatingUpdate:
          (rating) {
        print(rating);
      },
    );
  }
}
