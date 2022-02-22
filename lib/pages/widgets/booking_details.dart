import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehatdok/shared/shared.dart';

class RowDetails extends StatelessWidget {
  // const RowDetails({ Key? key }) : super(key: key);
  final String det1;
  final String det2;
  final Color clr;
  final FontWeight weight;

  RowDetails({this.det1, this.det2, this.clr, this.weight});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/ceklis.png",
              width: 30,
              height: 30,
            ),
            Expanded(
              child: Text(
                det1,
                style: blackTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              det2,
              style: GoogleFonts.poppins(color: clr, fontWeight: weight),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
