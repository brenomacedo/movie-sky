class AppUser {

  String id;
  String name = '';
  String profilePic = '';

  AppUser({ required this.id, String? name, String? profilePic }) {

    if(name != null) {
      this.name = name;
    }

    if(profilePic != null) {
      this.profilePic = profilePic;
    }
    
  }

}