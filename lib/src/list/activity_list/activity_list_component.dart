import 'dart:math';

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
class ActivityListComponent implements OnInit {
  static Random rnd = new Random();
  
  List<ActivityItem> items = [];

  @override
  ngOnInit() {
    for (int i = 0; i < 12; i++) {
      items.add(new ActivityItem("client_$i"));
    }
  }
}

class ActivityItem {
  String name;

  ActivityItem(String name) {
    this.name = name;
  }
}