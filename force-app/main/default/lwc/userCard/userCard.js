import { LightningElement, api } from 'lwc'
import { NavigationMixin } from 'lightning/navigation'

import TextoAlternativoPlanoFundo from '@salesforce/label/c.TextoAlternativoPlanoFundo'
import TextoAlternativoImagemUsuario from '@salesforce/label/c.TextoAlternativoImagemUsuario'

export default class UserCard extends NavigationMixin(LightningElement) {
  labels = {
    TextoAlternativoPlanoFundo,
    TextoAlternativoImagemUsuario
  }

  @api user = {}

  /**
   * Method for navigating to user profile when user card is selected.
   * It calls the navigate method inherited from NavigationMixin, passing
   * the type of navigation (to record page) and the navigation attributes,
   * containing the record id and the action executed when navigating.
   */
  navigateToUserProfile() {
    this[NavigationMixin.Navigate]({
      type: 'standard__recordPage',
      attributes: {
        recordId: this.user.Id,
        actionName: 'view'
      }
    })
  }
}