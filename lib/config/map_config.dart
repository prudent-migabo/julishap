import 'package:latlong2/latlong.dart';

class MapConfig {
  static const String mapBoxAccessToken = 'pk.eyJ1IjoicHJ1ZGVudC1taWdhYm8iLCJhIjoiY2xraGJ5N28wMDg0NzNqa2dtM3ViazgzaSJ9.TI84W42a2v3Kdo64-tpWLg';

  static const String mapBoxStyleId = 'clkrgd6nf00ox01pb9we5f804';

  static const String mapUrl = "https://api.mapbox.com/styles/v1/prudent-migabo/clkrgd6nf00ox01pb9we5f804/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHJ1ZGVudC1taWdhYm8iLCJhIjoiY2xraGJ5N28wMDg0NzNqa2dtM3ViazgzaSJ9.TI84W42a2v3Kdo64-tpWLg";

  static LatLng myLocation = LatLng(51.5090214, -0.1982948);
}
