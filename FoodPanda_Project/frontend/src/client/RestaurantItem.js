import React from "react";
import { useNavigate } from "react-router-dom";

import Card from '@mui/material/Card';
import LocalStorageHelper from '../common/localStorageMethods';
import config from '../config.json'
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import { CardActionArea } from '@mui/material';

function RestaurantItem(item) {
  let navigate = useNavigate();
  React.useEffect(() => {
    if(LocalStorageHelper.getUser()==null){
      navigate('/login');
      return;
    }
  })

  const handleClick = (event) => {
    event.preventDefault();
    localStorage.setItem("currentShop",item.id);
    navigate("/restaurantInfo/getById/"+item.id);
  }
  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
      <CardActionArea onClick={handleClick}>
        <CardMedia
          component="img"
          height="140"
          image="https://res.cloudinary.com/glovoapp/image/fetch//f_auto,q_auto/https://glovoapp.com/images/landing/address-container-image-burger.png"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="div">
            {item.name}
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}

export default RestaurantItem;