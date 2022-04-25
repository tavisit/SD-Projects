import React from 'react'
import { useNavigate } from 'react-router-dom'

import Card from '@mui/material/Card'
import CardContent from '@mui/material/CardContent'
import CardMedia from '@mui/material/CardMedia'
import Typography from '@mui/material/Typography'
import { CardActionArea } from '@mui/material'
import GetPhotoByCategory from '../../resources/GetPhotoByCategory'

function RestaurantFoodItem (item) {
  return (
    <>
      <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
        <CardActionArea>
          <CardMedia
            component='img'
            height='140'
            image={GetPhotoByCategory(item.category)}
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
