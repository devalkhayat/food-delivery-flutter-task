import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:food_delivery_app/core/widgets/custom_search_input.dart';

import '../home_strings.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: CustomSearchinput(hint:HomeStrings.searchInputPlaceHolder)),
        const SizedBox(width: 8.0,),
        Container(
            decoration: const BoxDecoration(color: colors.primaryColor, shape: BoxShape.circle,),
            child: IconButton(
                color: colors.white,
                onPressed: () => {},
                icon: SvgPicture.asset("assets/images/ic_filter.svg",color:colors.white))),
      ],
    );
  }
}
