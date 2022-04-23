import React from 'react'
import { useNavigate } from 'react-router-dom'

import Card from '@mui/material/Card'
import LocalStorageHelper from '../../common/localStorageMethods'
import CardContent from '@mui/material/CardContent'
import CardMedia from '@mui/material/CardMedia'
import Typography from '@mui/material/Typography'
import { CardActionArea } from '@mui/material'
import SimpleError from '../../pop_messages/SimpleError'

function RestaurantItem (item) {
  let navigate = useNavigate()

  const [open, setOpen] = React.useState(false)

  React.useEffect(() => {
    if (LocalStorageHelper.getUser() == null) {
      navigate('/login')
      return
    }
  }, [])

  const handleClick = event => {
    event.preventDefault()
    if (
      localStorage.getItem('currentShop') == 'null' ||
      localStorage.getItem('currentShop') == item.id
    ) {
      localStorage.setItem('currentShop', item.id)
      navigate('/buyer/restaurant')
    } else {
      setOpen(true)
    }
  }
  return (
    <>
      <SimpleError
        id='get-restaurant-info-error'
        open={open}
        title={'Clear the cart or buy in order to enter another restaurant!'}
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
              {item.name}
            </Typography>
          </CardContent>
        </CardActionArea>
      </Card>
    </>
  )
}

export default RestaurantItem
