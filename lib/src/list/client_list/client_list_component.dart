import 'dart:math';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'client-list',
  styleUrls: ['../list_component.css'],
  templateUrl: 'client_list_component.html',
  directives: [
    MaterialIconComponent,
    NgFor,
    NgIf,
  ],
  providers: [],
)
class ClientListComponent implements AfterContentInit {
  static Random rnd = new Random();
  static JsonDecoder json = new JsonDecoder();
  
  List<ClientItem> items = [];

  @override
  ngAfterContentInit() {
    for (int i = 0; i < 12; i++) {
      items.add(new ClientItem("client_$i", rnd.nextDouble() > 0.7 ? ClientType.RECEIVER : ClientType.PROVIDER));
    }
  }
}

class ClientItem {
  String name;
  ClientType type;
  bool get provider => type == ClientType.PROVIDER;
  bool get receiver => type == ClientType.RECEIVER;

  ClientItem(String name, ClientType type) {
    this.name = name;
    this.type = type;
  }
}

enum ClientType {
  PROVIDER, RECEIVER
}