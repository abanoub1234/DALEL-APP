import 'package:flutter/material.dart';
import '../../../../../core/utils/app-string.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../custom_category_list_view.dart';
import '../historical_souvenirs_widget.dart';

class HistoricalSouvenirsSection extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalSouvenirs,),
        SizedBox(height: 16,),
        HistoricalSouvenirsWidget(),
        SizedBox(height: 32,),
      ],
    );
  }
}