import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/news%20cubit/newscubit_cubit.dart';
import 'package:news/widgets/news_tile.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.category});
  final String category;
  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = (context).read<NewsCubit>();
      cubit.getnews(category: widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is Newsloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsSucces) {
          final newslist = state.newsmodel;
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 25),
            physics: const BouncingScrollPhysics(),
            itemCount: newslist.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsTile(
                newsModel: newslist[index],
              );
            },
          );
        } else if (state is NewsFailure) {
          return const Text("any thing");
        } else {
          return const Text("try again");
        }
      },
    );
  }
}
