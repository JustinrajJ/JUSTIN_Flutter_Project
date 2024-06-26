import 'dart:convert';
import 'dart:ui'; // Import for blur effect
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherappfinal/splashScreen.dart';

void main() {
  runApp(weatherApp());
}

class weatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _weatherAppState createState() => _weatherAppState();
}

class _weatherAppState extends State<WeatherApp> {
  String apiKey = '9a7cf1644da0b43d16b0f30b7a5f1b15';
  String city = 'Chennai';
  late String apiUrl;

  double temperature = 0.0;
  String weatherDescription = '';
  double humidity = 0.0;
  double windSpeed = 0.0;

  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        temperature = data['main']['temp'];
        weatherDescription = data['weather'][0]['description'];
        humidity = data['main']['humidity'].toDouble();
        windSpeed = data['wind']['speed'].toDouble();
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<String>> fetchCitySuggestions(String query) async {
    // Replace with your actual city suggestions API endpoint
    final response = await http.get(Uri.parse('https://api.example.com/cities?query=$query'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map<String>((city) => city['name']).toList();
    } else {
      throw Exception('Failed to load city suggestions');
    }
  }

  void updateWeather() {
    setState(() {
      city = cityController.text;
      apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    });
    fetchWeather();
  }

  DecorationImage _buildWeatherImage() {
    String imagePath = '';

    if (temperature > 30) {
      imagePath = 'images/sunny.gif';
    } else if (temperature > 21) {
      imagePath = 'images/giphy.gif';
    } else if (temperature <= 20) {
      imagePath = 'images/rainy.gif';
    } else {
      imagePath = 'images/Weather Icons.gif';
    }

    return DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RefreshIndicator(
          onRefresh: fetchWeather,
          child: Stack(
            children: [
              // Blurred background image
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: _buildWeatherImage(),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                  child: Container(
                    color: Colors.black.withOpacity(0.6), // Transparent container to apply blur effect
                  ),
                ),
              ),
              // Foreground content
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 50, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) async {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return await fetchCitySuggestions(textEditingValue.text);
                        },
                        onSelected: (String selection) {
                          setState(() {
                            city = selection;
                            cityController.text = selection;
                            updateWeather();
                          });
                        },
                        fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                          return TextField(
                            style: TextStyle(color: Colors.white),
                            controller: cityController,
                            focusNode: fieldFocusNode,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Enter City Name',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            onSubmitted: (_) => updateWeather(),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height/1.7,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$city',
                                style: TextStyle(fontSize: 25, color: Colors.white,),
                              ),
                              Text(
                                '${temperature.toStringAsFixed(1)}°C',
                                style: TextStyle(fontSize: 80, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1), // Set opacity to 0.1
                              borderRadius: BorderRadius.circular(20), // Set border radius
                            ),
                            child: ListTile(
                              title: Text(
                                'Weather: $weatherDescription',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1), // Set opacity to 0.1
                              borderRadius: BorderRadius.circular(20), // Set border radius
                            ),
                            child: ListTile(
                              title: Text(
                                'Humidity: ${humidity.toStringAsFixed(1)}%',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1), // Set opacity to 0.1
                              borderRadius: BorderRadius.circular(20), // Set border radius
                            ),
                            child: ListTile(
                              title: Text(
                                'Wind Speed: ${windSpeed.toStringAsFixed(1)} m/s',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
