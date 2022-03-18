public class UserCardSelector {
  public static List<User> getUsers() {
    return [
      SELECT Id, Name, Title, AboutMe, FullPhotoUrl, BannerPhotoUrl
      FROM User
    ];
  }
}
