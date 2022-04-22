import * as React from 'react';

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Container from '@mui/material/Container';
import Avatar from '@mui/material/Avatar';
import { Link, useNavigate } from 'react-router-dom';
import Button from '@mui/material/Button';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormGroup from '@mui/material/FormGroup';

import './NavBar.css'
import LocalStorageHelper from '../common/localStorageMethods'

const NavBar = (typeUser) => {
    let navigate = useNavigate();

    const handleChange = () => {
        LocalStorageHelper.logout();
        navigate('/login');
      };

    return (
        <AppBar position="static">
        <Container maxWidth="xl">
            <Toolbar>
                {typeUser.typeUser=='buyer'? (
                    <Box className={'navlinks'}>
                        <Link to='/buyer' className={'link'}>
                            Restaurants
                        </Link>
                        <Link to='/cart' className={'link'}>
                            My Cart
                        </Link>
                        <Link to='/order_client' className={'link'}>
                            My Order History
                        </Link>
                    </Box>
                ):(
                    <Box className={'navlinks'}>
                        <Link to='/buyer' className={'link'}>
                            My Food
                        </Link>
                        <Link to='/cart' className={'link'}>
                            My Orders
                        </Link>
                    </Box>
                )}
                <FormGroup>
                    <FormControlLabel
                        control={
                            <Button
                                onClick={handleChange}
                                aria-label="Logout"
                                color='secondary'
                            />
                        }
                        label='Logout'
                    />
                </FormGroup>

                <Box sx={{ flexGrow: 0 }}>
                    <Avatar
                        src="" 
                        sx={{minHeight: 50, minWidth: 50}} 
                    />
                </Box>
            </Toolbar>
        </Container>
    </AppBar>
  );
};
export default NavBar;
