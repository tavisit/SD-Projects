import React from 'react'
import { useNavigate } from 'react-router-dom'

import Card from '@mui/material/Card'
import CardContent from '@mui/material/CardContent'
import Typography from '@mui/material/Typography'
import CardMedia from '@mui/material/CardMedia'
import { CardActions, Button } from '@mui/material'
import LocalStorageHelper from '../../common/localStorageMethods'
import config from '../../config.json'

const API_GET_USER = config.apiRoot
function CartFoodItem (item) {
  const [quantity, setQuantity] = React.useState(item.quantity)
  let navigate = useNavigate()
  React.useEffect(() => {
    if (LocalStorageHelper.getUser() == null) {
      navigate('/login')
      return
    }
  })

  const increaseQuantity = () => {
    setQuantity(quantity + 1)
    var data = {
      id: item.id,
      quantity: quantity + 1
    }
    LocalStorageHelper.updateProduce(data)
  }

  const decreaseQuantity = () => {
    if (quantity > 0) {
      setQuantity(quantity - 1)
      var data = {
        id: item.id,
        quantity: quantity - 1
      }
      LocalStorageHelper.updateProduce(data)
    }
  }

  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
      <CardMedia
        component='img'
        height='140'
        image='https://images.immediate.co.uk/production/volatile/sites/30/2014/05/Epic-summer-salad-hub-2646e6e.jpg'
      />
      <CardContent>
        <Typography gutterBottom variant='h5' component='div'>
          {item.name}
        </Typography>
        <Typography variant='body2' color='text.secondary'>
          {item.description}
        </Typography>
      </CardContent>
      <CardActions>
        <Button size='small' onClick={increaseQuantity}>
          +
        </Button>
        {quantity}
        <Button size='small' onClick={decreaseQuantity}>
          -
        </Button>
      </CardActions>
      <CardContent>
        <Typography gutterBottom variant='h5' component='div'>
          Total Price: {item.price * quantity}
        </Typography>
      </CardContent>
    </Card>
  )
}

export default CartFoodItem
