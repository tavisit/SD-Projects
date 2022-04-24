import emailkey from './emailkey'
import { send } from 'emailjs-com'

const api_key = emailkey
class SendEmail {
  static sendToClient (information) {
    var clientInfo = {
      to_email: api_key.TO_EMAIL,
      to_name: information.client.name,
      from_name: information.restaurant.name,
      message: information.client.foods,
      location: information.client.location,
      special_message: information.client.special_message,
      total: information.client.total,
      from_email: information.restaurant.email
    }
    console.log(clientInfo)
    send(
      api_key.SERVICE_KEY,
      api_key.TEMPLATE_ID_Client,
      clientInfo,
      api_key.PUBLIC_KEY
    ).then(
      () => {},
      error => {
        alert('An error occurred, Please try again', error.text)
      }
    )
  }
  static sendToRestaurant (information) {
    var restaurantInfo = {
      to_email: api_key.TO_EMAIL,
      to_name: information.restaurant.name,
      from_name: information.client.name,
      from_email: information.client.email,
      message: information.client.foods,
      location: information.client.location,
      special_message: information.client.special_message,
      total: information.client.total
    }
    console.log(restaurantInfo)
    send(
      api_key.SERVICE_KEY,
      api_key.TEMPLATE_ID_Restaurant,
      restaurantInfo,
      api_key.PUBLIC_KEY
    ).then(
      () => {},
      error => {
        alert('An error occurred, Please try again', error.text)
      }
    )
  }

  static convertCartToString (myCart) {
    if (myCart.length == 0) return ''

    var returnString = ''
    for (var i = 0; i < myCart.length; i++) {
      var currentString = ''
      currentString += ' Food Name: ' + myCart[i].foodName
      currentString += ' Food Description: ' + myCart[i].foodDescription
      currentString += ' Food Quantity: ' + myCart[i].quantity
      currentString += ' Food Price/unit: ' + myCart[i].price
      returnString += currentString
    }

    return returnString
  }
  static createInformation (storedInformation) {
    var information = {
      client: {
        name: storedInformation.user.name,
        email: storedInformation.user.email,
        foods: this.convertCartToString(storedInformation.user.myCart),
        location:
          'Longitude: ' +
          storedInformation.submitOrderInformation.longitude +
          ' Latitude:' +
          storedInformation.submitOrderInformation.latitude,
        special_message:
          storedInformation.submitOrderInformation.additionalInformation,
        total: storedInformation.totalValue
      },
      restaurant: {
        name: storedInformation.user.myCart[0].restaurant.name,
        email: storedInformation.user.myCart[0].restaurant.email
      }
    }
    return information
  }
  static sendEmails (information) {
    var emailInformation = this.createInformation(information)
    this.sendToRestaurant(emailInformation)
    this.sendToClient(emailInformation)
  }
}
export default SendEmail
