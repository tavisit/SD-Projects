import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useNavigate } from 'react-router-dom';

import NavBar from '../../navbar/NavBar';
import './RestaurantInfo.css';
import config from '../../config.json'
import SimpleError from '../../pop_messages/SimpleError';
import LocalStorageHelper from '../../common/localStorageMethods';
import RestaurantFoodItem from './RestaurantFoodItem';

const API_GET_USER = config.apiRoot;

function RestaurantInfo() {
    let navigate = useNavigate();

  
    const [open, setOpen] = React.useState(false);
    const [food, setFood] = React.useState([]);
    const [foodCategories, setCategories] = React.useState([]);

    React.useEffect(() => {
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
          method: 'GET',
          headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
          }
      };
  
      fetch(API_GET_USER +  "restaurantInfo/getById/" + localStorage.getItem("currentShop"), requestOptions)
          .then(response => response.json())
          .then(response => {
              if (response.httpStatusCode !== 200)
                  throw new Error(response.message);
              setFood(response.data);
              setCategories(getCategories(response.data));
          })
          .catch(err => {
            setOpen(true);
          });
          
    },[])
    const getCategories = (foodList) =>{
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
          id = "get-restaurant-info-error"
          open = {open}
          title = {"Something went wrong with the restaurant!"}
          handleClose = {() => {
            setOpen(false);
          }}
        />        
          <NavBar typeUser='buyer'/>
          <div className="container">
            <h2>Available Food</h2>
                {foodCategories.length ? (
                    <div>
                        {foodCategories.map((category) => (
                            <>
                                <Divider />
                                <h1>{category}</h1>
                            <div className="flex-row">
                            {food.filter((current_food) => current_food.foodCategory.name == category).map((foodInfo) => (
                                <RestaurantFoodItem
                                    key={foodInfo.id}
                                    id={foodInfo.id}
                                    restaurant={foodInfo.restaurant}
                                    name={foodInfo.foodName}    
                                    description={foodInfo.foodDescription}
                                    category={foodInfo.foodCategory}
                                    price={foodInfo.price}
                                />
                                ))}
                                </div>
                            </>
                            ))}
                        </div>
                ) : (
                    <h3>There are no foods.</h3>
                )}          
            </div>
        </div>
      );
  }
  
  export default RestaurantInfo;