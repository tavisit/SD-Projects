import foodPhoto from './foodPhotoBasedOnCategory.json'

export default function GetPhotoByCategory (category) {
  var returnString = ''
  switch (category.id) {
    case 1:
      returnString = foodPhoto.breakfast
      break
    case 2:
      returnString = foodPhoto.lunch
      break
    case 3:
      returnString = foodPhoto.dessert
      break
    case 4:
      returnString = foodPhoto.beverages
      break
    case 5:
      returnString = foodPhoto.dinner
      break
  }
  if (returnString == '') return foodPhoto.alt
  else return returnString
}
