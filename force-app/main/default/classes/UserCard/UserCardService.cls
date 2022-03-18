public class UserCardService {
  /**
   * Method responsible for getting all the platform users data in JSON
   * format. The Salesforce User Object is converted to a DTO to assure
   * consistency between backend and frontend systems.
   */
  public static String getUsersData() {
    List<User> users = UserCardSelector.getUsers();
    List<UserDTO> usersDTO = getUsersConvertedToUserDTO(users);

    return JSON.serialize(usersDTO);
  }

  static List<UserDTO> getUsersConvertedToUserDTO(List<User> users) {
    List<UserDTO> usersDTO = new List<UserDTO>();
    for (User user : users) { usersDTO.add(new UserDTO(user)); }

    return usersDTO;
  }

  @TestVisible
  class UserDTO {
    public Id Id;
    public String Name;
    public String Title;
    public String AboutMe;
    public String FullPhotoUrl;
    public String BannerPhotoUrl;

    public UserDTO(User user) {
      this.Id = user.Id;
      this.Name = user.Name;
      this.AboutMe = user.AboutMe;
      this.FullPhotoUrl = user.FullPhotoUrl;
      this.BannerPhotoUrl = user.BannerPhotoUrl;
    }
  }
}
