public class UserCardController {
  @AuraEnabled
  public static String getUsersData() {
    return UserCardService.getUsersData();
  }
}
