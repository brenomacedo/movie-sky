import 'package:movie_sky/config/config.dart';

class Person {

  int? id;
  String? name;
  String? biography;
  String? birthplace;
  String? lifeDays;
  String profilePic = 'https://i.imgur.com/E0UnFcD.png';
  String? gender;


  Person();

  factory Person.fromMap(Map<String, dynamic> person) {

    Person newPerson = Person();

    newPerson.id = person['id'];
    newPerson.name = person['name'];
    newPerson.biography = person['biography'];
    newPerson.lifeDays = person['birthday'] == null
      ? 'Unknown birthday'
      : '${person['birthday']} - ${person['deathday'] == null ? 'alive' : person['deathday']}';
    newPerson.birthplace = person['place_of_birth'];
    if(person['profile_path'] != null)
      newPerson.profilePic = '$IMAGE_BASE_URL${person['profile_path']}';
    if(person['gender'] == 2)
      newPerson.gender = 'Male';
    else if(person['gender'] == 1)
      newPerson.gender = 'Female';
    else
      newPerson.gender = 'Non-binary';

    return newPerson;

  }

}