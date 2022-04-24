import * as React from 'react'

import Button from '@mui/material/Button'
import Dialog from '@mui/material/Dialog'
import DialogActions from '@mui/material/DialogActions'
import DialogContent from '@mui/material/DialogContent'
import DialogContentText from '@mui/material/DialogContentText'
import DialogTitle from '@mui/material/DialogTitle'
import OrderStatus from '../admin_restaurant/RestaurantOrder/OrderStatus'

function OrderMessageRestaurant (props) {
  const [isPossibleAdvance, setAdvance] = React.useState(false)
  const [isPending, setPendingState] = React.useState(false)

  React.useEffect(() => {
    console.log(props.statusList)
    console.log(props.status)
    if (props.statusList[0] == null) return
    if (props.status == props.statusList[1].name) {
      // Pending
      setAdvance(true)
      setPendingState(true)
    } else if (props.status == props.statusList[0].name) {
      // Rejected
      setAdvance(false)
      setPendingState(false)
    } else if (
      props.status == props.statusList[props.statusList.length - 1].name
    ) {
      setAdvance(false)
      setPendingState(false)
    } else {
      setAdvance(true)
      setPendingState(false)
    }
  }, [props.statusList, props.status])

  const printOrder = () => {
    console.log(props)
  }

  const declineOrder = () => {
    var orderObject = new OrderStatus()
    orderObject.getStatusRepository()
    orderObject.updateStatus(
      props.order,
      orderObject.rejectStatus(props.status, props.statusList)
    )
    window.location.reload()
  }

  const advanceOrder = () => {
    var orderObject = new OrderStatus()
    orderObject.updateStatus(
      props.order,
      orderObject.advanceStatus(props.status, props.statusList)
    )
    window.location.reload()
  }

  let dialog = (
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
        {props.messageList ? (
          <>
            {props.messageList.map(messages => (
              <DialogContentText
                key={messages.message}
                id='alert-dialog-description'
              >
                {messages.message}
              </DialogContentText>
            ))}
          </>
        ) : (
          <>
            <DialogContentText id='alert-dialog-description'>
              Nothing found!
            </DialogContentText>
          </>
        )}
      </DialogContent>
      <DialogActions>
        <Button onClick={declineOrder} disabled={!isPending}>
          Reject Order
        </Button>
        <Button onClick={advanceOrder} disabled={!isPossibleAdvance}>
          Advance Order
        </Button>
        <Button onClick={printOrder}> Print Order </Button>
        <Button onClick={props.handleClose} autoFocus>
          {' '}
          Close{' '}
        </Button>
      </DialogActions>
    </Dialog>
  )

  if (!props.open) dialog = null

  return dialog
}

export default OrderMessageRestaurant
