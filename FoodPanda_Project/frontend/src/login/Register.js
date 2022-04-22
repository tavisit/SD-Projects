import * as React from 'react';
import { useNavigate} from 'react-router-dom';

import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import MenuItem from '@mui/material/MenuItem';
import Select from '@mui/material/Select';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import Link from '@mui/material/Link';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';

import config from '../config.json'
import SimpleError from '../pop_messages/SimpleError';
import { Checkbox } from '@mui/material';
import LocalStorageHelper from '../common/localStorageMethods'

const theme = createTheme();
const API_REGISTER = config.apiRoot + 'auth/register';
const ERROR_TITLE = "Register Error";

export default function SignUp() {
  let navigate = useNavigate();
  const [locationList, setLocationList] = React.useState([]);

  const [open, setOpen] = React.useState(false);
  const [error, setError] = React.useState("");

  const fetchLocations = () => {
    if(locationList.length > 0) return;

    const requestOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };

    fetch(API_REGISTER+"/location", requestOptions)
        .then(response => response.json())
        .then(response => {
            if (response.httpStatusCode !== 200)
                throw new Error(response.message);
                setLocationList(response.data);
        })
        .catch(err => {
        });
      }

  fetchLocations();
  
  const handleSubmit = (event) => {
    event.preventDefault();

    const convertCheckInRole = (role) =>{
      if(role==='on')
        return {
          name:"Restaurant"
        };
      else
        return  {
          name:"Buyer"
        };
    }

    const convertInLocation = (location) =>{
      return{
        city: location
      };
    }

    const formData = new FormData(event.currentTarget);
    const data = {
      email: formData.get('email'),
      password: formData.get('password'),
      name: formData.get('name'),
      role: convertCheckInRole(formData.get('role')),
      location: convertInLocation(formData.get('location'))
    };
    console.log(data);
    const requestOptions = {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      },
      body: JSON.stringify(data)
    };

    fetch(API_REGISTER, requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);

                    LocalStorageHelper.setUser(response.data);

                    if (response.data.role.name === 'Restaurant') 
                        navigate("/restaurant/" + response.data.id);
                    else navigate("/buyer/" + response.data.id);
            })
            .catch(err => {
                setOpen(true);
                setError(err.message);
            });
  };

  React.useEffect(() =>{
    if(localStorage.getItem('user') == null) return;
    
    var user = LocalStorageHelper.getUser();

    if (user.role.name === 'Buyer')
      navigate("/buyer/" + localStorage.getItem('user').id);
    else if (user.role.name === 'Restaurant')
      navigate("/restaurant/" + localStorage.getItem('user').id);
  })

  return (
    <div>
      <SimpleError 
        id = "register-error"
        open = {open}
        title = {ERROR_TITLE}
        message = {error}
        handleClose = {() => {
            setOpen(false);
            setError("");
        }}
      />

      <ThemeProvider theme={theme}>
        <Container component="main" maxWidth="xs">
          <CssBaseline />
          <Box
            sx={{
              marginTop: 8,
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
            }}
          >
            <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
              <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
              Sign up
            </Typography>
            <Box component="form" noValidate onSubmit={handleSubmit} sx={{ mt: 3 }}>
              <Grid container spacing={2}>
                <Grid item xs={12}>
                  <TextField
                    autoComplete="given-name"
                    name="name"
                    required
                    fullWidth
                    id="name"
                    label="Name"
                    autoFocus
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    required
                    fullWidth
                    id="email"
                    label="Email Address"
                    name="email"
                    autoComplete="email"
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    required
                    fullWidth
                    name="password"
                    label="Password"
                    type="password"
                    id="password"
                    autoComplete="new-password"
                  />
                </Grid>
                <Grid item xs={12}>
                  <Select
                      labelId="demo-simple-select-label"
                      id="demo-simple-select"
                      name="location"
                      id="location"
                      label="location"
                    >
                      {locationList.map((current_location) => <MenuItem  value={current_location.city}>{current_location.city}</MenuItem>)}
                    </Select>
                </Grid>
                <Grid item xs={12}>
                <Typography component="h1" variant="h5">
                    Restaurant?
                </Typography>
                  <Checkbox
                    required
                    fullWidth
                    name="role"
                    id="role"
                    label="Restaurant?"
                    name="role"
                  />
                  
                </Grid>
              </Grid>
              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                Sign Up
              </Button>
              <Grid container justifyContent="flex-end">
                <Grid item>
                  <Link href="/login" variant="body2">
                    Already have an account? Sign in
                  </Link>
                </Grid>
              </Grid>
            </Box>
          </Box>
        </Container>
      </ThemeProvider>
    </div>
  );
}