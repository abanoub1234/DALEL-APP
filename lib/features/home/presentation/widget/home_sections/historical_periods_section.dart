import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/utils/app-string.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../historical_periods_widget.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {



        return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderText(text: AppStrings.historicalPeriodswars),
                //Text(snapshot.data!.docs[0]['name']),

                SizedBox(height: 16,),
                HistoricalPeriods(),
                SizedBox(height: 32,)
              ],
                );


      // builder: (context) {
      //   return Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     CustomHeaderText(text: AppStrings.historicalPeriods),
      //     SizedBox(height: 16,),
      //     HistoricalPeriods(),
      //     SizedBox(height: 32,)
      //   ],
      //     );
      // }

  }
}