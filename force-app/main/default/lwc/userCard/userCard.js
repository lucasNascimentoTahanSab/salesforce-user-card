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
}