import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useNavigate } from 'react-router-dom';

import Card from '@mui/material/Card';
import NavBar from '../../navbar/NavBar';
import Typography from '@mui/material/Typography';
import CardContent from '@mui/material/CardContent';
import './RestaurantInfo.css';
import config from '../../config.json'
import SimpleError from '../../errors/SimpleError';
import LocalStorageHelper from '../../common/localStorageMethods';
import CartFoodItem from './CartFoodItem';
import { Button,CardActions } from '@mui/material';

const API_GET_USER = config.apiRoot;

function Cart() {
    let navigate = useNavigate();

  
    const [open, setOpen] = React.useState(false);
    const [openOrder, setOpenOrder] = React.useState(false);
    const [initialized, setInitialized] = React.useState(false);
    const [food, setFood] = React.useState([]);
    const [totalValue, setTotal] = React.useState(0);
    const [foodCategories, setCategories] = React.useState([]);

    React.useEffect(() => {
        window.addEventListener('click', () => 
            setTotal(LocalStorageHelper.getValueOfCart())
        );

        setTotal(LocalStorageHelper.getValueOfCart());
        initializeStat();
    // cleanup this component
        return () => {
        window.removeEventListener('click', () => 
        setTotal(LocalStorageHelper.getValueOfCart())
    );
        };
    })
  
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
        LocalStorageHelper.clearUser();
        window.location.reload();
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
        fetch(API_GET_USER +  "cart/submitOrder", requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);
                    LocalStorageHelper.setUser(response.data);
                    setOpenOrder(true);
            })
            .catch(err => {
              throw new Error(err);
            });
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
          <NavBar />
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
                                    key={foodInfo.id}
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