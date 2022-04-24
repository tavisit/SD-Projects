import * as React from 'react'

import NavBar from '../../TopBottomComponents/NavBar'
import config from '../../config.json'
import { useNavigate } from 'react-router-dom'
import LocalStorageHelper from '../../common/localStorageMethods'
import Footer from '../../TopBottomComponents/Footer'
import OrderStatus from './OrderStatus'
import {
  Button,
  Select,
  Divider,
  FormControl,
  InputLabel,
  MenuItem
} from '@mui/material'
import OrderItem from './OrderItem'

const API_GET_USER = config.apiRoot

function RestaurantOrders () {
  let navigate = useNavigate()

  const [orders, setOrders] = React.useState([])
  const [currentStatus, setCurrentStatus] = React.useState('')
  const [orderStatusList, setOrderStatusList] = React.useState([])

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
    const initializationData = {
      target: {
        value: 'All'
      }
    }
    updateView(initializationData)
    fetchStatus()
  }, [])
  const fetchStatus = () => {
    const requestOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }
    }

    fetch(API_GET_USER + 'orders/viewStatuses', requestOptions)
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        setOrderStatusList(response.data)
      })
      .catch(err => {})
  }
  const updateView = event => {
    setCurrentStatus(event.target.value)
    const requestOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      }
    }
    fetch(
      event.target.value == 'All'
        ? API_GET_USER +
            'restaurant/viewOrders/Simple/' +
            LocalStorageHelper.getUser().id
        : API_GET_USER +
            'restaurant/viewOrders/ByState/' +
            LocalStorageHelper.getUser().id +
            '/' +
            event.target.value,
      requestOptions
    )
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        setOrders(response.data)
      })
      .catch(() => {})
  }

  function compare (a, b) {
    if (a.order.status.id < b.order.status.id) {
      return -1
    }
    if (a.order.status.id > b.order.status.id) {
      return 1
    }
    return 0
  }

  return (
    <div>
      <NavBar typeUser='restaurant' />
      <div className='container'>
        <h2>Available Orders</h2>
        <Divider />
        <FormControl fullWidth>
          <InputLabel id='demo-simple-select-label'>Status</InputLabel>
          <Select
            labelId='demo-simple-select-label'
            id='demo-simple-select'
            label='Status'
            name='Status'
            id='Status'
            value={currentStatus}
            onChange={updateView}
          >
            <MenuItem value='All'>All</MenuItem>
            {orderStatusList.length ? (
              orderStatusList.map(order_status => (
                <MenuItem value={order_status.name}>
                  {order_status.name}
                </MenuItem>
              ))
            ) : (
              <MenuItem value='None'>None</MenuItem>
            )}
          </Select>
        </FormControl>
        <Divider />
        {orders.length ? (
          <div className='flex-row'>
            {orders.sort(compare).map(order => (
              <OrderItem
                maxWidth='xl'
                key={order.order.id}
                id={order.order.id}
                user_email={order.order.user.email}
                user_location_longitude={order.order.longitude}
                user_location_latitude={order.order.latitude}
                status={order.order.status.name}
                statusList={orderStatusList}
                foodList={order.foodDtoList}
                price={order.price}
                printingInfo={order.order}
              />
            ))}
          </div>
        ) : (
          <h3>There are no orders.</h3>
        )}
      </div>
      <Footer />
    </div>
  )
}

export default RestaurantOrders
