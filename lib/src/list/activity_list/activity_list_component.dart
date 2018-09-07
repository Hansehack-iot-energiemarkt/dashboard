import 'dart:async';
import 'dart:math';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'activity-list',
  styleUrls: ['../list_component.css'],
  templateUrl: 'activity_list_component.html',
  directives: [
    MaterialIconComponent,
    NgFor,
    NgIf,
  ],
  providers: [],
)
class ActivityListComponent implements AfterContentInit {
  static Random rnd = new Random();
  static JsonDecoder json = new JsonDecoder();
  
  List<ActivityItem> items = [];

  @override
  ngAfterContentInit() {
    new Timer.periodic(new Duration(seconds: 1), (t) {
      while (items.length < 8) {
        items.add(ActivityItem("client_${rnd.nextInt(12)}", rnd.nextDouble() > 0.6));
      }
      for (int i = 0; i < rnd.nextInt(3) + 2; i++) {
        items.removeAt(rnd.nextInt(items.length));
      }
    });
  }
}

class ActivityItem {
  String name;
  bool sell;
  bool buy;

  ActivityItem(String name, bool sell) {
    this.name = name;
    this.sell = sell;
    this.buy = !sell;
  }
}