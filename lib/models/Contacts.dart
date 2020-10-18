
import 'dart:convert';

class Contacts {

	int _id;
	String _bluetooth;
	String _date;

	Contacts(this._bluetooth, this._date);
	Contacts.withId(this._id, this._bluetooth, this._date);

	int get id => _id;
	String get bluetooth => _bluetooth;
	String get date => _date;


	set bluetooth(String newbluetooth) {
		this._bluetooth = newbluetooth;
	}

	set date(String newDate) {
		this._date = newDate;
	}
	// Convert a Contacts object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['bluetooth'] = _bluetooth;
		map['date'] = _date;

		return map;
	}

	Contacts.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._bluetooth = map['bluetooth'];
		this._date = map['date'];
	}

 Map<String, dynamic> toJson() {
    return {
      "bluetoothAddress": this._bluetooth,
      "contactDate": this._date,
    };
  }

 static List encondeToJson(List<Contacts> list) {
    List jsonList = List();
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }
}


