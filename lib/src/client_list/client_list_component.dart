import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'client-list',
  styleUrls: ['client_list_component.css'],
  templateUrl: 'client_list_component.html',
  directives: [
    MaterialIconComponent,
    NgFor,
    NgIf,
  ],
  providers: [],
)
class ClientListComponent implements OnInit {
  static Random rnd = new Random();
  
  List<ClientItem> items = [];

  @override
  ngOnInit() {
    for (int i = 0; i < 20; i++) {
      items.add(new ClientItem("client_$i", rnd.nextBool() ? ClientType.PROVIDER : ClientType.RECEIVER));
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