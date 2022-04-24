import config from '../../config.json'
const API_GET_USER = config.apiRoot

function getKeyByValue (object, value) {
  for (var i = 0; i < object.length; i++) {
    if (value == object[i].name) return object[i].id
  }
}
function getValueByKey (object, key) {
  for (var i = 0; i < object.length; i++) {
    if (key == object[i].id) return object[i].name
  }
  return null
}

class OrderStatus {
  constructor () {
    this.statusRepository = this.getStatusRepository()
  }

  advanceStatus (currentStatus, newRepository = null) {
    var statusDictionary = this.statusRepository
    if (newRepository != null) statusDictionary = newRepository
    var key = getKeyByValue(statusDictionary, currentStatus)
    if (key == 1 || key == statusDictionary.length) {
      return currentStatus
    } else {
      var key = getKeyByValue(statusDictionary, currentStatus)
      var currentKey = parseInt(key)
      if (currentKey > 0) {
        currentKey += 1
        return getValueByKey(statusDictionary, currentKey)
      } else {
        return null
      }
    }
  }

  rejectStatus (currentStatus, newRepository = null) {
    var statusDictionary = this.statusRepository
    if (newRepository != null) statusDictionary = newRepository
    var key = getKeyByValue(statusDictionary, currentStatus)
    if (key == 2 || key == 1) {
      return statusDictionary[0].name
    } else {
      return null
    }
  }

  getStatusRepository () {
    const requestOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }
    }
    fetch(API_GET_USER + 'orders/viewStatuses', requestOptions)
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        this.statusRepository = response.data
      })
      .catch(() => {
        this.statusRepository = null
      })
  }

  getRepo () {
    return this.statusRepository
  }

  updateStatus (order, newStatus) {
    const requestOptions = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify(order)
    }
    fetch(API_GET_USER + 'restaurant/changeStatus/' + newStatus, requestOptions)
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
      })
      .catch(() => {})
  }
}

export default OrderStatus
