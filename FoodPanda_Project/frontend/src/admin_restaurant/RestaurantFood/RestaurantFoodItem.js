import React from 'react'
import { useNavigate } from 'react-router-dom'

import Card from '@mui/material/Card'
import CardContent from '@mui/material/CardContent'
import CardMedia from '@mui/material/CardMedia'
import Typography from '@mui/material/Typography'
import { CardActionArea } from '@mui/material'

function RestaurantFoodItem (item) {
  return (
    <>
      <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
        <CardActionArea>
          <CardMedia
            component='img'
            height='140'
            image='https://images.immediate.co.uk/production/volatile/sites/30/2014/05/Epic-summer-salad-hub-2646e6e.jpg'
          />
          <CardContent>
            <Typography gutterBottom variant='h3' component='div'>
              {item.name}
            </Typography>
            <Typography gutterBottom variant='h6' component='div'>
              {item.description}
            </Typography>
            <Typography gutterBottom variant='p' component='div'>
              Price: {item.price} lei
            </Typography>
          </CardContent>
        </CardActionArea>
      </Card>
    </>
  )
}

export default RestaurantFoodItem
