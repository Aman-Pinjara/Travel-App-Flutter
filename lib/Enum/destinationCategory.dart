import 'package:travelapp/dummyData.dart';

import '../Models/dataModel.dart';

enum DestinationCategory {
  beach,
  mountain,
}

//get image url from enum
String getImage(DestinationCategory category) {
  switch (category) {
    case DestinationCategory.beach:
      return 'assets/images/beach.png';
    case DestinationCategory.mountain:
      return 'assets/images/mountain.png';
  }
}

String getName(DestinationCategory category) {
  switch (category) {
    case DestinationCategory.beach:
      return 'Beach';
    case DestinationCategory.mountain:
      return 'Mountain';
  }
}

List<DataModel> getDataList(DestinationCategory category) {
  switch (category) {
    case DestinationCategory.beach:
      return beachDataList;
    case DestinationCategory.mountain:
      return mountainDataList;
  }
}
