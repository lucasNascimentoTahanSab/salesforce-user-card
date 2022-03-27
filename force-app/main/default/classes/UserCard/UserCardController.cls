public class UserCardController {
  @AuraEnabled(cacheable=true)
  public static String getUsersData() {
    return UserCardService.getUsersData();
  }
}
