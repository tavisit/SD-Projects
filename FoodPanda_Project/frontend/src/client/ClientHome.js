import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useNavigate } from 'react-router-dom';

import NavBar from '../navbar/NavBar';
import './CustomerHome.css';
import config from '../config.json'
import SimpleError from '../errors/SimpleError';
import LocalStorageHelper from '../common/localStorageMethods';
import { KeyboardReturnTwoTone } from '@mui/icons-material';
import RestaurantItem from './RestaurantItem';
import { TextField } from '@mui/material';

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
  
      fetch(restaurantName==""?(API_GET_USER +  "restaurantInfo/getAll" + restaurantName):(API_GET_USER +  "restaurantInfo/getByName/" + restaurantName), requestOptions)
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
    
        fetch(event.target.value==""?(API_GET_USER +  "restaurantInfo/getAll" + event.target.value):(API_GET_USER +  "restaurantInfo/getByName/" + event.target.value), requestOptions)
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
          <NavBar />
          <div className="container">
            <h2>Available Restaurants</h2>
            <Divider />
            <div className="flex-row">
                <input onChange={event => updateView(event)} />
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