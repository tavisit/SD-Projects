import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useNavigate } from 'react-router-dom';

import Card from '@mui/material/Card';
import NavBar from '../../navbar/NavBar';
import Typography from '@mui/material/Typography';
import CardContent from '@mui/material/CardContent';
import '../info_restaurant/RestaurantInfo';
import config from '../../config.json'
import SimpleError from '../../pop_messages/SimpleError';
import LocalStorageHelper from '../../common/localStorageMethods';
import CartFoodItem from './CartFoodItem';
import { Button,CardActions } from '@mui/material';
import GoogleMaps from '../../common/GoogleMaps';
import Input from '@mui/material/Input';
import SendEmail from '../../common/SendMail';

const API_GET_USER = config.apiRoot;

function Cart() {
    let navigate = useNavigate();

  
    const [open, setOpen] = React.useState(false);
    const [openClear, setOpenClear] = React.useState(false);
    const [openOrder, setOpenOrder] = React.useState(false);
    const [initialized, setInitialized] = React.useState(false);
    const [food, setFood] = React.useState([]);
    const [totalValue, setTotal] = React.useState(0);
    const [foodCategories, setCategories] = React.useState([]);
    const [additionalInfomation, setAdditionalInfomation] = React.useState("");
    const [coordinates, setCoordinates] = React.useState({
        latitude:LocalStorageHelper.getUser().location.latitude,
        longitude:LocalStorageHelper.getUser().location.longitude
    });

    React.useEffect(() => {
        window.addEventListener('click', () => {
            setTotal(LocalStorageHelper.getValueOfCart());
            var coordinatesTemp = JSON.parse(localStorage.getItem('coordinatesEating'));
            if(coordinatesTemp != null){
                setCoordinates(coordinatesTemp);
            }
        }
        );
        
        setTotal(LocalStorageHelper.getValueOfCart());
        initializeStat();
    // cleanup this component
        return () => {
        window.removeEventListener('click', () => {
            setTotal(LocalStorageHelper.getValueOfCart());
            var coordinatesTemp = JSON.parse(localStorage.getItem('coordinatesEating'));
            if(coordinatesTemp != null){
                setCoordinates(coordinatesTemp);
            }
        }
        );
        };
    },[])
  
    const initializeStat = () => {
        if(initialized) return;

        if(LocalStorageHelper.getUser()!=null){
                    var user = LocalStorageHelper.getUser();
                    if(user.role.name !== "Buyer"){
                        LocalStorageHelper.logout();
                        navigate('/login');
                        return;
                    }
                }
                else{
                    navigate('/login');
                    return;
                }
                
              const requestOptions = {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json'
                  },
                  body: JSON.stringify(user)
              };
              fetch(API_GET_USER +  "cart/getCart", requestOptions)
                  .then(response => response.json())
                  .then(response => {
                      if (response.httpStatusCode !== 200)
                          throw new Error(response.message);
                        setFood(response.data);
                  })
                  .catch(err => {
                    setOpen(true);
                    throw new Error(err);
                  });
                setInitialized(true);
                
        setCategories(getCategories());

    }

    const clearList = () => {
        localStorage.setItem("currentShop",null);
        setOpenClear(true);
    }

    const checkout = () => {
        var user = LocalStorageHelper.getUser();
        const requestOptions = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(user)
        };
        var submitOrderInformation = {
            longitude: JSON.parse(localStorage.getItem('coordinatesEating')).longitude,
            latitude: JSON.parse(localStorage.getItem('coordinatesEating')).latitude,
            additionalInformation: additionalInfomation
        }
        fetch(API_GET_USER +  "cart/submitOrder/"+JSON.stringify(submitOrderInformation), requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);
                localStorage.setItem("currentShop",null);
                var user = LocalStorageHelper.getUser();
                SendEmail.sendEmails({user,submitOrderInformation,totalValue});
                LocalStorageHelper.setUser(response.data);
                setOpenOrder(true);
            })
            .catch(err => {
              throw new Error(err);
            });
    }
    const handleAdditionalInformation = (event) =>{
        setAdditionalInfomation(event.target.value)
    }
    const getCategories = () =>{
        var user = LocalStorageHelper.getUser();
        var foodList = user.myCart;
        if(foodList == null || foodList.length == 0) return [];
        var dict = [];

        for(var index = 0;index < foodList.length;index++)
        {
            if(dict.includes(foodList[index].foodCategory.name) === false)
            {
                dict.push(foodList[index].foodCategory.name);
            }
        }
        return dict;
    }

    return (
        <div>    
        <SimpleError 
          id = "get-cart-error"
          open = {open}
          title = {"Something went wrong with the cart!"}
          handleClose = {() => {
            setOpen(false);
          }}
        />    
        <SimpleError 
          id = "get-cart-order-success"
          open = {openOrder}
          title = {"The order has been placed!"}
          handleClose = {() => {
            setOpenOrder(false);
            window.location.reload();
          }}
        /> 
        <SimpleError 
          id = "get-clear-order-success"
          open = {openClear}
          title = {"The order has been cleared!"}
          handleClose = {() => { 
            LocalStorageHelper.clearCart();
            setOpenClear(false);
            window.location.reload();
          }}
        />       
          <NavBar typeUser='buyer'/>
          <div className="container">
            <h2>Current Cart</h2>
            {
                foodCategories.length ? (
                    <div>
                        {foodCategories.map((category) => (
                            <>
                                <Divider />
                                <h1>{category}</h1>
                            <div className="flex-row">
                                {food.filter((current_food) => current_food.foodCategory.name == category).map((foodInfo) => (
                                <CartFoodItem
                                    key={foodInfo}
                                    id={foodInfo.id}
                                    restaurant={foodInfo.restaurant}
                                    name={foodInfo.foodName}    
                                    description={foodInfo.foodDescription}
                                    category={foodInfo.foodCategory}
                                    price={foodInfo.price}
                                    quantity={foodInfo.quantity}
                                />
                            ))}
                            </div>
                            
                            </>
                            ))}
                        </div>
                        
                    
                ) : (
                    <h3>There are no foods.</h3>
                )}
            <Divider />
            <GoogleMaps sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}></GoogleMaps>
            <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
                <CardContent>
                <Typography gutterBottom variant="h5" component="div">
                    Latitude: {coordinates.latitude}
                </Typography>
                <Typography gutterBottom variant="h5" component="div">
                    Longitude: {coordinates.longitude}
                </Typography>
                </CardContent>
            </Card>
            <Divider />
            <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
                <CardActions>
                    <Input 
                        placeholder="Additional Information"
                        label="Additional Information"
                        sx={{ minWidth: 345, marginLeft: 10, marginRight: 10, marginTop: 5 }}
                        onChange={event => handleAdditionalInformation(event)}
                    />
                </CardActions>
            </Card>
            <Divider />
            <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
                <CardActions>
                    <Button size="Big" onClick={clearList}>Clear List</Button>
                </CardActions>
            </Card>
            <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
            <CardContent>
                <Typography gutterBottom variant="h5" component="div">
                        Total: {totalValue} lei
                    </Typography>
                </CardContent>
                <CardActions>
                    <Button size="Big" onClick={checkout}>Check Out</Button>
                </CardActions>
            </Card>
        </div>
        </div>
      );
  }
  export default Cart;