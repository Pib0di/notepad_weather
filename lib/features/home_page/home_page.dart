import 'package:dio/dio.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad_weather/features/home_page/bloc/home_page_bloc.dart';
import 'package:notepad_weather/features/home_page/service/home_page_service.dart';
import 'package:notepad_weather/generated/assets.dart';
import 'package:notepad_weather/network/api/weather/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageService homePageService = HomePageService();

  // late final HomePageBloc bloc = HomePageBloc();
  late final HomePageBloc bloc = BlocProvider.of<HomePageBloc>(context);

  late Dio dio;
  late Weather weather;
  late ScrollController _scrollController = ScrollController();
  final Key _listKey = UniqueKey();
  var flag = false;
  @override
  void initState() {
    dio = Dio();
    weather = Weather(dio);

    homePageService.initial(context, bloc);

    _scrollController = ScrollController();

    homePageService.scrollController = _scrollController;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final widgetWidth = _scrollController.position.maxScrollExtent /
          homePageService.cardMonth.length;
      _scrollController
        ..jumpTo(maxScrollExtent / 2 + widgetWidth / 4)
        ..addListener(() {
          final maxScrollExtent = _scrollController.position.maxScrollExtent;
          homePageService.cardMonth.length;
          final currentScrollPosition = _scrollController.position.pixels;

          if ((maxScrollExtent - currentScrollPosition).abs() < 100) {
            homePageService.addCardMonth();
            setState(() {});
            // homePageService.bloc.add(Increment());
            print(homePageService.cardMonth.length);
          }
        });
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Погодный календарь'),
        leading: IconButton(
          onPressed: () {
            context.go('/sign-in');
          },
          icon: const Icon(Icons.question_mark_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      }),
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            Assets.assetImageFreeIconCloudy1163661,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(Increment());
          // setState(() {});
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CreateNote()),
          // );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          print('update');
          return ListView.builder(
            key: _listKey,
            scrollDirection: Axis.horizontal,
            itemCount: homePageService.cardMonth.length,
            padding: const EdgeInsets.all(8.0),
            controller: homePageService.scrollController,
            itemBuilder: (BuildContext context, int index) {
              return homePageService.cardMonth.values.elementAt(index);
            },
          );
        },
      ),
    );
  }
}
