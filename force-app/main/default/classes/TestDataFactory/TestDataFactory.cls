public class TestDataFactory {
  public static User getUser() {
    Profile administratorProfile = getAdministratorProfile();

    UserRole userRole = getUserRole();
    insert userRole;

    User user = new User();
    user.FirstName = 'Danilo';
    user.LastName = 'Tiago Henry Porto';
    user.Alias = 'dtiago';
    user.Email = 'danilo_tiago_porto@outlock.com.br';
    user.Username =
      'danilo_tiago_porto@outlock.com.br' + System.currentTimeMillis();
    user.ProfileId = administratorProfile.Id;
    user.CompanyName = 'Jardim das Palmeiras';
    user.Title = 'Developer';
    user.TimeZoneSidKey = 'America/Los_Angeles';
    user.AboutMe = 'Belo Horizonte, born and raised.';
    user.EmailEncodingKey = 'UTF-8';
    user.LanguageLocaleKey = 'en_US';
    user.LocaleSidKey = 'en_US';
    user.UserRoleId = userRole.Id;

    return user;
  }

  public static Profile getAdministratorProfile() {
    List<Profile> profiles = [
      SELECT Id
      FROM Profile
      WHERE Name = 'Administrador do sistema'
    ];
    if (profiles.isEmpty()) {
      return new Profile();
    }

    return profiles.get(0);
  }

  public static UserRole getUserRole() {
    UserRole userRole = new UserRole();
    userRole.Name = 'Developer';
    userRole.DeveloperName = 'Developer';

    return userRole;
  }
}
