import * as React from 'react'

import AppBar from '@mui/material/AppBar'
import Toolbar from '@mui/material/Toolbar'
import Container from '@mui/material/Container'
import { Link } from 'react-router-dom'

const Footer = () => {
  return (
    <AppBar position='static' sx={{ mt: 30 }}>
      <Container maxWidth='xl'>
        <Toolbar></Toolbar>
      </Container>
    </AppBar>
  )
}
export default Footer
