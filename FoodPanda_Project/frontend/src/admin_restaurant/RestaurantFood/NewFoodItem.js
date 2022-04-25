import * as React from 'react'

import Button from '@mui/material/Button'
import Dialog from '@mui/material/Dialog'
import DialogActions from '@mui/material/DialogActions'
import DialogContent from '@mui/material/DialogContent'
import DialogTitle from '@mui/material/DialogTitle'
import config from '../../config.json'
import LocalStorageHelper from '../../common/localStorageMethods'
import SimpleError from '../../pop_messages/SimpleError'
import {
  Grid,
  Box,
  TextField,
  MenuItem,
  InputLabel,
  Select
} from '@mui/material/'
const API_GET_USER = config.apiRoot

export default function NewFoodItem (props) {
  const [currentSelected, setCurrentSelected] = React.useState('None')
  const [open, setOpen] = React.useState([])

  const convertFromFormToCategory = stringData => {
    for (var i = 0; i < props.categories.length; i++) {
      if (props.categories[i].name == stringData) return props.categories[i]
    }
  }

  const updateSelect = event => {
    setCurrentSelected(event.target.value)
  }

  const handleSubmit = event => {
    const formData = new FormData(event.currentTarget)
    const data = {
      foodName: formData.get('name'),
      restaurant: LocalStorageHelper.getUser(),
      foodDescription: formData.get('description'),
      foodCategory: convertFromFormToCategory(formData.get('category')),
      price: formData.get('price')
    }

    const requestOptions = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify(data)
    }

    fetch(API_GET_USER + 'restaurant/createFood', requestOptions)
      .then(response => response.json())
      .then(response => {
        if (response.httpStatusCode !== 200) throw new Error(response.message)
        window.location.reload()
      })
      .catch(err => {
        setOpen(true)
      })
  }

  let dialog = (
    <>
      <SimpleError
        id='post-food-info-error'
        open={open}
        title={'The food was not added!'}
        handleClose={() => {
          setOpen(false)
        }}
      />

      <Dialog
        open={props.open}
        onClose={props.handleClose}
        aria-labelledby='alert-dialog-title'
        aria-describedby='alert-dialog-description'
        PaperProps={{
          sx: {
            minWidth: '30%',
            minheight: 300,
            width: 'auto',
            maxHeight: 'auto'
          }
        }}
      >
        <DialogTitle id='alert-dialog-title'>{props.title}</DialogTitle>
        <DialogContent>
          <Box component='form' onSubmit={handleSubmit} sx={{ mt: 3 }}>
            <Grid container spacing={2}>
              <Grid item xs={12}>
                <TextField
                  required
                  fullWidth
                  name='name'
                  required
                  fullWidth
                  id='name'
                  label='name'
                  autoFocus
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  required
                  fullWidth
                  name='description'
                  required
                  fullWidth
                  id='description'
                  label='description'
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  required
                  fullWidth
                  name='price'
                  required
                  fullWidth
                  id='price'
                  label='price'
                  type='number'
                  onChange={event =>
                    event.target.value < 0
                      ? (event.target.value = 0)
                      : event.target.value
                  }
                />
              </Grid>
              <Grid item xs={12}>
                <InputLabel id='demo-simple-select-label'>Category</InputLabel>
                <Select
                  id='category'
                  name='category'
                  label='category'
                  value={currentSelected}
                  onChange={updateSelect}
                >
                  {props.categories ? (
                    props.categories.map(category => (
                      <MenuItem value={category.name}>{category.name}</MenuItem>
                    ))
                  ) : (
                    <MenuItem value='None'>"None"</MenuItem>
                  )}
                </Select>
              </Grid>
            </Grid>

            <Button
              type='submit'
              fullWidth
              variant='contained'
              sx={{ mt: 3, mb: 2 }}
            >
              Create New Food
            </Button>
          </Box>
        </DialogContent>
        <DialogActions>
          <Button onClick={props.handleClose}> Close </Button>
        </DialogActions>
      </Dialog>
    </>
  )

  if (!props.open) dialog = null

  return dialog
}
