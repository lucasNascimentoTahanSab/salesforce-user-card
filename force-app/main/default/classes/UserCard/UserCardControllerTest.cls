@isTest
public class UserCardControllerTest {
  @TestSetup
  static void makeData() {
    User user = TestDataFactory.getUser();
    insert user;
  }

  /**
   * Method responsible for comparing the user retrieved from UserCardController
   * after serialization and the user previously inserted at the setting up.
   */
  @isTest
  static void getUsersData() {
    String serializedUsersDTO = UserCardController.getUsersData();
    List<UserCardService.UserDTO> usersDTO = (List<UserCardService.UserDTO>) JSON.deserialize(
      serializedUsersDTO,
      List<UserCardService.UserDTO>.class
    );
    UserCardService.UserDTO userDTO = usersDTO.isEmpty() ? new UserCardService.UserDTO(new User()) : usersDTO.get(0);
    User user = [SELECT Id, Name, Title, AboutMe, FullPhotoUrl, BannerPhotoUrl FROM User WHERE Name = :userDTO.Name LIMIT 1];

    System.assertEquals(user.Id, userDTO.Id);
    System.assertEquals(user.Name, userDTO.Name);
    System.assertEquals(user.AboutMe, userDTO.AboutMe);
    System.assertEquals(user.FullPhotoUrl, userDTO.FullPhotoUrl);
    System.assertEquals(user.BannerPhotoUrl, userDTO.BannerPhotoUrl);
  }
}
