import orderPhoto from './orderPhotoBasedOnStatus.json'

export default function GetPhotoByStatus (status) {
  var returnValue = ''
  if (status.id > orderPhoto.status.length) returnValue = orderPhoto.status[0]
  else returnValue = orderPhoto.status[status.id]
  return returnValue.toString()
}
