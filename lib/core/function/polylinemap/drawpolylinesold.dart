// import 'dart:convert';
// import 'package:latlong2/latlong.dart';
// import 'package:http/http.dart' as http;
// import 'package:delivery/core/function/polylinemap/polyline_algorithm.dart';

// Future<void> fetchRouteCoordinates(List<LatLng> routeCoordinates,
//     List<List<double>> coordinates, LatLng? position, LatLng? latLng) async {
//   routeCoordinates.clear();
//   print("coordinates:-       $coordinates");
//   const String pathParam = 'driving-car';

//   final Uri apiUrl =
//       Uri.parse('https://api.openrouteservice.org/v2/directions/$pathParam');

//   const String apiKey =
//       '5b3ce3597851110001cf6248352210426ada4ef68e022a95dc339cc0';
//   final Map<String, String> headers = {
//     "Accept":
//         "application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8",
//     "Authorization": apiKey,
//     "Content-Type": "application/json; charset=utf-8",
//   };

//   final Map<String, dynamic> requestBody = {
//     "coordinates": coordinates,
//   };

//   final http.Response response = await http.post(
//     apiUrl,
//     headers: headers,
//     body: json.encode(requestBody),
//   );
//   routeCoordinates.add(latLng!);
//   if (response.statusCode == 200) {
//     final responseJson = json.decode(response.body);
//     final routes = responseJson['routes'];
//     final route = routes[0];
//     final geometry = route['geometry'];
//     routeCoordinates.addAll(decodePolyline(geometry).unpackPolyline());
//     print("=========================================");
//     print("geometry:-    $geometry");
//     print("=========================================");
//     print("geometry:-    $routeCoordinates");
//     print("=========================================");
//   } else {
//     print("coordinates:-  fail     $coordinates");
//     print('Request failed with status: ${response.statusCode}');
//   }
//   routeCoordinates.add(position!);
// }
