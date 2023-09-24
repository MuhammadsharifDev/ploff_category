import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_part/home/bloc/home_bloc.dart';

class BottomListViewWidget extends StatelessWidget {
  const BottomListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      height: media.height * 40 / 812,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.getCategoryResponse?.categories?.length,
            itemBuilder: (context, index) {
              var sort = state.getCategoryResponse?.categories?[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  right: 16,
                ),
                child: Container(
                  width: media.width * 100 / 375,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(sort?.title?.uz ?? 'no things'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
