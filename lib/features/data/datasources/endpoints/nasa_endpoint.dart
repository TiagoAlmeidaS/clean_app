class NasaEndpoint {
  static String apod(String apiKey, String date) => "https://api.nasa.gov/planetary/apod?api key=$apiKey&date=$date ";
}