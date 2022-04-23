import * as React from 'react'

import { useNavigate } from 'react-router-dom'

import Card from '@mui/material/Card'
import Typography from '@mui/material/Typography'
import CardContent from '@mui/material/CardContent'
import OrderMessage from '../../pop_messages/OrderMessage'
import LocalStorageHelper from '../../common/localStorageMethods'
import { CardActionArea, CardMedia } from '@mui/material'

function OrderItem (item) {
  let navigate = useNavigate()
  const [open, setOpen] = React.useState(false)
  React.useEffect(() => {
    if (LocalStorageHelper.getUser() == null) {
      navigate('/login')
      return
    }
  })

  const handleClick = event => {
    event.preventDefault()
    setOpen(true)
  }

  const handleText = () => {
    var returnText = []
    var currentText =
      ' Additional Information: ' + item.printingInfo.additionalInformation
    returnText.push({ message: currentText })

    for (var i = 0; i < item.foodList.length; i++) {
      var currentFood = item.foodList[i]
      var currentText = ''
      currentText += ' Name: ' + currentFood.foodName
      currentText += ' Quantity: ' + currentFood.quantity
      currentText += ' Price: ' + currentFood.quantity * currentFood.price
      currentText += ' Description: ' + currentFood.foodDescription
      currentText += '\n'
      returnText.push({ message: currentText })
    }
    return returnText
  }
  return (
    <>
      <OrderMessage
        id='get-order-info'
        open={open}
        title={item.status}
        order={item.printingInfo}
        messageList={handleText()}
        handleClose={() => {
          setOpen(false)
        }}
      />
      <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
        <CardActionArea onClick={handleClick}>
          <CardMedia
            component='img'
            height='140'
            image='https://res.cloudinary.com/glovoapp/image/fetch//f_auto,q_auto/https://glovoapp.com/images/landing/address-container-image-burger.png'
          />
          <CardContent>
            <Typography gutterBottom variant='h5' component='div'>
              Restaurant: {item.restaurant}
            </Typography>
            <Typography gutterBottom variant='h5' component='div'>
              Status: {item.status}
            </Typography>
            <Typography gutterBottom variant='h5' component='div'>
              Price: {item.price}
            </Typography>
          </CardContent>
        </CardActionArea>
      </Card>
    </>
  )
}

export default OrderItem
