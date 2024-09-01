
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/models/data_model.dart';
import '../../../../core/utils/app-string.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_data_list_view.dart';
import '../../../../core/widgets/custom_header_text.dart';

class PeriodWarsSection extends StatelessWidget {
  const PeriodWarsSection({super.key, required this.warsList});
  final List<DataModel> warsList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderText(text: 'Historical wars'),
        const SizedBox(height: 16),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -52,
              right: 16,
              child: SvgPicture.asset(Assets.imagesDetails3),
            ),
            CustomDataListView(
                dataList: warsList)
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}