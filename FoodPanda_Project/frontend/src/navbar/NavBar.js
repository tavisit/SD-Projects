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

const ResponsiveAppBar = () => {
    let navigate = useNavigate();

    const handleChange = (event) => {
        LocalStorageHelper.logout();
        navigate('/login');
      };

    return (
        <AppBar position="static">
        <Container maxWidth="xl">
            <Toolbar>

                <Box className={'navlinks'}>
                    <Link to='/buyer' className={'link'}>
                        Restaurants
                    </Link>
                    <Link to='/cart' className={'link'}>
                        My Cart
                    </Link>
                    <Link to='/my-orders' className={'link'}>
                        My Order History
                    </Link>
                </Box>

                <FormGroup>
                    <FormControlLabel
                        control={
                            <Button
                                onClick={handleChange}
                                aria-label="login switch"
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
export default ResponsiveAppBar;
