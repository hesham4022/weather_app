import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app2/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app2/views/search_page.dart';
import 'package:weather_app2/widgets/no_weather_body.dart';
import 'package:weather_app2/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const HomeScaffold(), // 🟢 انقل الـ UI لهنا
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<GetWeatherCubit>(context),
                      child: const SearchPage(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLaodedState) {
            return WeatherInfoBody();
          } else {
            return const Center(child: Text('Oops, there was an error.'));
          }
        },
      ),
    );
  }
}
