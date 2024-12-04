import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:food_delivery_app/feature/profile/ui/profile_strings.dart';

class UserInfo extends StatelessWidget {
  UserInfo({super.key});
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Card(
      elevation: 1,
      color: colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [getTop(),const SizedBox(height: 8.0,), getBottom()],
        ),
      ),
    );
  }

  getTop() {
    return Row(
      children: [
        Expanded(flex: 1, child: getThumbnail()),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(flex: 2, child: getNamePhone()),
      ],
    );
  }

  getThumbnail() {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              elevation: 0.0,
              color: colors.blueSky,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  "https://www.pngall.com/wp-content/uploads/15/Man-Face-PNG-Images.png",
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(left :10.0,bottom: 10.0),
                child: Container(
                  width: 40,
                    height: 40,
                    decoration: const BoxDecoration(color: colors.white,shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 40, color: colors.white2, spreadRadius: 0)
                      ],
                    ),
                    child: IconButton(
                        onPressed: () => {},
                        icon: SizedBox(width: 30,height: 30,child: SvgPicture.asset("assets/images/ic_camera.svg",)))),
              ))
        ],
      ),
    );
  }

  getNamePhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Adam Stoeme",
          style: Theme.of(_context).textTheme.labelLarge,
        ),
        const SizedBox(
          width: 120,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: DottedLine(
              dashGapLength: 0.0,
              dashColor: colors.gray12,
            ),
          ),
        ),
        getSection(ProfileStrings.phoneNumber, "00201112817226")
      ],
    );
  }

  getBottom() {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSection(ProfileStrings.emailLabel, "mz.alkhayat@hotmail.com"),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: DottedLine(
              dashGapLength: 0.0,
              dashColor: colors.gray12,
            ),
          ),
          getSection(ProfileStrings.addressLabel,
              "Cite 1500/200/1300 logts ain arnat setif")
        ],
      ),
    );
  }

  getSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(_context)
              .textTheme
              .bodySmall
              ?.copyWith(color: colors.black),
        ),
        Text(
          value,
          style: Theme.of(_context)
              .textTheme
              .bodySmall
              ?.copyWith(color: colors.gray14),
        )
      ],
    );
  }
}
