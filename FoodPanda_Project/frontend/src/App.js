import './App.css';
import {BrowserRouter as Router, Routes, Route, Navigate} from 'react-router-dom';
import Login from './login/Login';
import Register from './login/Register';
import NotFound from './errors/not-found/NotFound';
import ClientHome from './client/ClientHome';
import RestaurantInfo from './client/info_restaurant/RestaurantInfo';
import Cart from './client/info_restaurant/Cart';

function App() {
  return (
    <Router> 
      <Routes>
        <Route path='/' exact element={<Navigate replace to='/login'/>}/>
        <Route path='/login' element={<Login />}/>
        <Route path='/register' element={<Register />}/>
        <Route path='/buyer' element={<ClientHome />}/>
        <Route path='/restaurantInfo/*' element={<RestaurantInfo />}/>
        <Route path='/cart/*' element={<Cart />}/>
        <Route path='*' element={<NotFound />}/>
      </Routes>
    </Router>
  );
}

export default App;
