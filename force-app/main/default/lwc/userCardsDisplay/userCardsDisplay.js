import { LightningElement, wire } from 'lwc'

import ConhecaColegasEquipe from '@salesforce/label/c.ConhecaColegasEquipe'

import getUsersData from '@salesforce/apex/UserCardController.getUsersData'

export default class UserCardsDisplay extends LightningElement {
  labels = { ConhecaColegasEquipe }
  users = []

  @wire(getUsersData)
  getUserData(result) {
    if (result.error) throw new Error(result.error)

    this.users = JSON.parse(result.data)
  }
}