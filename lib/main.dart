import 'package:flutter/material.dart';
import 'dart:math'; // For generating random numbers

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather App',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Set the theme to purple
      ),
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
  
  // Variables to store the current weather data
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

  // Variables to store the 7-day forecast
  List<Map<String, String>> forecast = [];

  // Simulate fetching current weather data
  void fetchWeather() {
    setState(() {
      // Get the entered city name from the TextField
      cityName = _cityController.text;

      // Create a random number generator
      final random = Random();

      // Generate a random temperature between 15°C and 30°C
      temperature = '${15 + random.nextInt(16)}°C';

      // List of possible weather conditions
      List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

      // Randomly select a weather condition
      weatherCondition = weatherConditions[random.nextInt(weatherConditions.length)];
    });
  }

  // Simulate fetching 7-day weather forecast
  void fetch7DayForecast() {
    setState(() {
      final random = Random();
      List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

      // Clear previous forecast
      forecast.clear();

      // Generate weather data for the next 7 days
      for (int i = 0; i < 7; i++) {
        // Generate random temperature between 15°C and 30°C
        String dayTemperature = '${15 + random.nextInt(16)}°C';

        // Randomly select a weather condition
        String dayCondition = weatherConditions[random.nextInt(weatherConditions.length)];

        // Add to the forecast list
        forecast.add({
          'day': 'Day ${i + 1}', // Example: Day 1, Day 2, etc.
          'temperature': dayTemperature,
          'condition': dayCondition,
        });
      }
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
        child: Center( // Center everything
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center elements horizontally
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

              // Button to fetch current weather
              ElevatedButton(
                onPressed: fetchWeather,
                child: Text('Fetch Weather'),
              ),
              SizedBox(height: 10),

              // Button to fetch 7-day forecast
              ElevatedButton(
                onPressed: fetch7DayForecast,
                child: Text('Fetch 7-Day Forecast'),
              ),
              SizedBox(height: 30),

              // Display current weather information (city name, temperature, and condition)
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
              SizedBox(height: 20),

              // 7-day forecast section
              if (forecast.isNotEmpty) ...[
                Text(
                  '7-Day Forecast',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // List of forecast days
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: forecast.length,
                    itemBuilder: (context, index) {
                      final dayForecast = forecast[index];
                      return ListTile(
                        title: Text(dayForecast['day']!),
                        subtitle: Text(
                          'Temp: ${dayForecast['temperature']!}, Condition: ${dayForecast['condition']!}',
                        ),
                      );
                    },
                  ),
                ),
              ],
              Spacer(), // Add spacer to push the content above upwards
            ],
          ),
        ),
      ),
    );
  }
}
