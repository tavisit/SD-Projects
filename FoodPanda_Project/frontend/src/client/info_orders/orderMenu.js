import * as React from 'react'

import Divider from '@mui/material/Divider'
import { useNavigate } from 'react-router-dom'

import NavBar from '../../navbar/NavBar'
import config from '../../config.json'
import LocalStorageHelper from '../../common/localStorageMethods'
import OrderItem from './OrderItem'
import MenuItem from '@mui/material/MenuItem'
import Select from '@mui/material/Select'
import { FormControl, InputLabel } from '@mui/material'
import Footer from '../../TopBottomComponents/Footer'

const API_GET_USER = config.apiRoot

function OrderMenu () {
  let navigate = useNavigate()

  const [orders, setorders] = React.useState([])
  const [currentStatus, setCurrentStatus] = React.useState('')
  const [orderStatusList, setorderStatusList] = React.useState([])

  React.useEffect(() => {
    if (LocalStorageHelper.getUser() != null) {
      var user = LocalStorageHelper.getUser()
      if (user.role.name !== 'Buyer') {
        LocalStorageHelper.logout()
        navigate('/login')
        return
      }
    } else {
      navigate('/login')
      return
    }

    const requestOptions = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify(LocalStorageHelper.getUser())
    }

    fetch(API_GET_USER + 'buyer/getOrders', requestOptions)
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        setorders(response.data)
      })
      .catch(err => {})
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
        setorderStatusList(response.data)
      })
      .catch(err => {})
  }

  const updateView = event => {
    setCurrentStatus(event.target.value)
    const requestOptions = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify(LocalStorageHelper.getUser())
    }
    fetch(
      event.target.value == 'All'
        ? API_GET_USER + 'buyer/getOrders'
        : API_GET_USER + 'buyer/getOrders/' + event.target.value,
      requestOptions
    )
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        setorders(response.data)
      })
      .catch(err => {})
  }
  return (
    <div>
      <NavBar typeUser='buyer' />
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
            {orderStatusList.map(order_status => (
              <MenuItem value={order_status.name}>{order_status.name}</MenuItem>
            ))}
          </Select>
        </FormControl>
        <Divider />
        {orders.length ? (
          <div className='flex-row'>
            {orders.map(order => (
              <OrderItem
                key={order.order.id}
                id={order.order.id}
                restaurant={order.order.restaurant.name}
                status={order.order.status.name}
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

export default OrderMenu
