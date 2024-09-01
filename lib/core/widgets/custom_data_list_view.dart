
import 'package:flutter/material.dart';


import '../models/data_model.dart';
import 'custom_data_list_view_item.dart';

class CustomDataListView extends StatelessWidget {
   CustomDataListView({
    super.key,
    required this.dataList

  });

   final List<DataModel> dataList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        clipBehavior: Clip.none,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return CustomDataListViewItem(
            model: dataList[index],

          );
        },
      ),
    );
  }
}