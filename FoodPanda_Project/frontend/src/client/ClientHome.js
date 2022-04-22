import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useNavigate } from 'react-router-dom';

import NavBar from '../navbar/NavBar';
import './CustomerHome.css';
import config from '../config.json'
import LocalStorageHelper from '../common/localStorageMethods';
import RestaurantItem from './info_restaurant/RestaurantItem';
import Input from '@mui/material/Input';

const API_GET_USER = config.apiRoot;

function CustomerHome() {
    let navigate = useNavigate();
  
    const [restaurants, setRestaurants] = React.useState([]);
    const [restaurantName, setRestaurantName] = React.useState("");
  
    React.useEffect(() => {
        if(LocalStorageHelper.getUser()!=null){
            var user = LocalStorageHelper.getUser();
            if(user.role.name !== "Buyer"){
                LocalStorageHelper.logout();
                navigate('/login');
                return;
            }
            if(user.myCart == null){
                localStorage.setItem("currentShop",null);
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
      fetch(restaurantName==""?(API_GET_USER +  "restaurantInfo/getAll/" + LocalStorageHelper.getUser().location.city)
                              :(API_GET_USER +  "restaurantInfo/getByName/" + LocalStorageHelper.getUser().location.city + "/" + restaurantName), requestOptions)
          .then(response => response.json())
          .then(response => {
              if (response.httpStatusCode !== 200)
                  throw new Error(response.message);
              setRestaurants(response.data);
          })
          .catch(err => {
          });
    },[])
  
    const updateView = (event) => {
        setRestaurantName(event.target.value);

        const requestOptions = {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        };
        fetch(event.target.value==""?(API_GET_USER +  "restaurantInfo/getAll/" + LocalStorageHelper.getUser().location.city)
                :(API_GET_USER +  "restaurantInfo/getByName/" + LocalStorageHelper.getUser().location.city + "/" + event.target.value), requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);
                setRestaurants(response.data);
            })
            .catch(err => {
            });
    }
    return (
        <div>            
            <NavBar typeUser='buyer'/>
            <div className="container">
                <h2>Available Restaurants</h2>
                <Divider />
                <div className="flex-row">
                    <Input 
                        placeholder="Search Restaurant"
                        label="Search Restaurant"
                        sx={{ minWidth: 345, marginLeft: 10, marginRight: 10, marginTop: 5 }}
                        onChange={event => updateView(event)} 
                    />
                </div>
                <Divider />
                {restaurants.length ? (
                    <div className="flex-row">
                        {restaurants.map((restaurant) => (
                            <RestaurantItem
                                key={restaurant.id}
                                url={LocalStorageHelper.getUser().id}
                                id={restaurant.id}
                                name={restaurant.name}
                            />
                        ))}
                    </div>
                ) : (
                    <h3>There are no restaurants.</h3>
                )}
            </div>
        </div>
      );
  }
  
  export default CustomerHome;