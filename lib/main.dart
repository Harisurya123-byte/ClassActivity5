import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

  // Simulate fetching weather (replace with API call in real case)
  void fetchWeather() {
    setState(() {
      // Simulated data (replace with real fetched data)
      cityName = _cityController.text;
      temperature = '25°C';
      weatherCondition = 'Sunny';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field for city name
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Button to fetch weather
            Center(
              child: ElevatedButton(
                onPressed: fetchWeather,
                child: Text('Fetch Weather'),
              ),
            ),
            SizedBox(height: 30),

            // Display weather information (city name, temperature, and condition)
            Text(
              'City: ${cityName.isEmpty ? 'City Name' : cityName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Temperature: ${temperature.isEmpty ? 'N/A' : temperature}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Condition: ${weatherCondition.isEmpty ? 'N/A' : weatherCondition}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
