
import React from "react";
import { useNavigate } from "react-router-dom";

import Card from '@mui/material/Card';
import LocalStorageHelper from '../../common/localStorageMethods';
import config from '../../config.json'
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import { CardActionArea } from '@mui/material';
import SimpleError from '../../errors/SimpleError';

const API_GET_USER = config.apiRoot;
function RestaurantFoodItem(item) {
  const [open, setOpen] = React.useState(false);
    let navigate = useNavigate();
    React.useEffect(() => {
      if(LocalStorageHelper.getUser()==null){
        navigate('/login');
        return;
      }
    })
  
    const handleClick = (event) => {
      event.preventDefault();
      const data = {
            id:item.id,
            restaurant:item.restaurant,
            foodName:item.name,
            foodDescription:item.description,
            foodCategory:item.category,
            price:item.price,
            quantity:1
      };
      const complexData = {
        userDto: LocalStorageHelper.getUser(),
        restaurantfoodDto: data
      };
      console.log(complexData);
      const requestOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify(complexData)
    };
        fetch(API_GET_USER + "cart/addToCart" , requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);
                LocalStorageHelper.setUser(response.data);
                setOpen(true);
            })
            .catch(err => {
            });
    }
    return (
      <>
      <SimpleError 
          id = "get-restaurant-info-success"
          open = {open}
          title = {"Item added!"}
          handleClose = {() => {
            setOpen(false);
          }}
        />   
        <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
        <CardActionArea onClick={handleClick}>
          <CardMedia
            component="img"
            height="140"
            image="https://images.immediate.co.uk/production/volatile/sites/30/2014/05/Epic-summer-salad-hub-2646e6e.jpg"
          />
          <CardContent>
            <Typography gutterBottom variant="h3" component="div">
              {item.name}
            </Typography>
            <Typography gutterBottom variant="h6" component="div">
              {item.description}
            </Typography>
            <Typography gutterBottom variant="p" component="div">
              Price: {item.price} lei
            </Typography>
          </CardContent>
        </CardActionArea>
      </Card>
      </>
      
    );
  }
  
  export default RestaurantFoodItem;