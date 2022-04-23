import './App.css'
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate
} from 'react-router-dom'
import Login from './login/Login'
import Register from './login/Register'
import ClientHome from './client/ClientHome'
import RestaurantInfo from './client/info_restaurant/RestaurantInfo'
import Cart from './client/cart/Cart'
import OrderMenu from './client/info_orders/OrderMenu'
import AdminHome from './admin_restaurant/AdminHome'
import RestaurantOrders from './admin_restaurant/RestaurantOrder/RestaurantOrders'

function App () {
  return (
    <Router>
      <Routes>
        <Route path='/login' element={<Login />} />
        <Route path='/register' element={<Register />} />
        <Route path='/buyer' element={<ClientHome />} />
        <Route path='/buyer/cart' element={<Cart />} />
        <Route path='/buyer/orders' element={<OrderMenu />} />
        <Route path='/buyer/*' element={<RestaurantInfo />} />
        <Route path='/restaurant' element={<AdminHome />} />
        <Route path='/restaurant/orders' element={<RestaurantOrders />} />
        <Route path='*' exact element={<Navigate replace to='/login' />} />
      </Routes>
    </Router>
  )
}

export default App
