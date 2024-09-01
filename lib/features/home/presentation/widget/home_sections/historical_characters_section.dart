import 'package:flutter/material.dart';
import '../../../../../core/utils/app-string.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../custom_category_list_view.dart';

class HistoricalCharactersSection extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalCharacters,),
        SizedBox(height: 16,),
        CustomCategoryListView(),
        SizedBox(height: 32,),
      ],
    );
  }
}