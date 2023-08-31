import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white70,
          iconTheme: const IconThemeData(color: Colors.black87),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _weatherDescription(),
              const Divider(),
              _temperature(),
              const Divider(),
              _temperatureForecast(),
              const Divider(),
              _footerRating(),
            ],
          ),
        ))
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://cdn.pixabay.com/photo/2019/05/19/23/47/clouds-4215608_1280.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Friday - September 1',
        style: TextStyle(
            color: Colors.black87, fontSize: 32, fontWeight: FontWeight.w600),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        style: TextStyle(color: Colors.black54, fontSize: 15),
      )
    ],
  );
}

Row _temperature() {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(
            Icons.cloud_rounded,
            color: Colors.blue.shade300,
            size: 50,
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '22\u2103 Cloudy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Some Place',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20}\u2103',
          style: const TextStyle(fontSize: 15),
        ),
        avatar: Icon(
          Icons.cloud,
          color: Colors.blue.shade200,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(style: BorderStyle.none),
          // side: BorderSide(color: Colors.black26),
        ),
        backgroundColor: Colors.grey.shade200,
      );
    }),
  );
}

Row _footerRating() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[600],
      ),
      const Icon(
        Icons.star,
        size: 20,
        color: Colors.black45,
      ),
      const Icon(
        Icons.star,
        size: 20,
        color: Colors.black45,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
      stars,
    ],
  );
}
