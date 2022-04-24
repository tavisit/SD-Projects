import * as React from 'react'

import NavBar from '../TopBottomComponents/NavBar'
import config from '../config.json'
import { useNavigate } from 'react-router-dom'
import LocalStorageHelper from '../common/localStorageMethods'
import { Divider, Button, Card, CardActions } from '@mui/material'
import RestaurantFoodItem from './RestaurantFood/RestaurantFoodItem'
import NewFoodItem from './RestaurantFood/NewFoodItem'
import Footer from '../TopBottomComponents/Footer'
const API_GET_USER = config.apiRoot

function AdminHome () {
  const [open, setOpen] = React.useState(false)
  const [food, setFood] = React.useState([])
  const [foodCategories, setCategories] = React.useState([])

  let navigate = useNavigate()
  React.useEffect(() => {
    if (LocalStorageHelper.getUser() != null) {
      var user = LocalStorageHelper.getUser()
      if (user.role.name !== 'Restaurant') {
        LocalStorageHelper.logout()
        navigate('/login')
        return
      }
    } else {
      navigate('/login')
      return
    }
    fetchFood()
    fetchCategories()
  }, [])

  const fetchCategories = () => {
    const requestOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }
    }
    fetch(API_GET_USER + 'restaurant/getCategories', requestOptions)
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        setCategories(response.data)
      })
      .catch(err => {})
  }

  const fetchFood = () => {
    const requestOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }
    }

    fetch(
      API_GET_USER + 'restaurant/viewMenu/' + LocalStorageHelper.getUser().id,
      requestOptions
    )
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        setFood(response.data)
      })
      .catch(err => {
        setOpen(true)
      })
  }

  const handleClick = () => {
    setOpen(true)
  }

  return (
    <div>
      <NewFoodItem
        id='get-new-food'
        open={open}
        title={'Create new food'}
        categories={foodCategories}
        handleClose={() => {
          setOpen(false)
        }}
      />
      <NavBar typeUser='restaurant' />
      <div className='container'>
        <Card sx={{ marginRight: 10, marginTop: 5 }}>
          <CardActions onClick={handleClick}>
            <Button size='Big' variant='text' onClick={handleClick} fullWidth>
              Add new food
            </Button>
          </CardActions>
        </Card>
        <Divider />
        <h2>Available Food</h2>
        {foodCategories.length ? (
          <div>
            {foodCategories.map(category => (
              <>
                <Divider />
                <h1>{category.name}</h1>
                <div className='flex-row'>
                  {food
                    .filter(
                      current_food =>
                        current_food.foodCategory.name == category.name
                    )
                    .map(foodInfo => (
                      <RestaurantFoodItem
                        key={foodInfo.id}
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
      <Footer />
    </div>
  )
}

export default AdminHome
