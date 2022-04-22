import * as React from 'react';

import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

function OrderMessage(props) {

  const printOrder = () =>{
    console.log(props);
  }

  let dialog = (
    <Dialog
      open={props.open}
      onClose={props.handleClose}
      aria-labelledby="alert-dialog-title"
      aria-describedby="alert-dialog-description"
      PaperProps={{
        sx: {
          minWidth: '30%',
          minheight: 300,
          width: 'auto',
          maxHeight: 'auto',
        }
      }}
    >
      <DialogTitle id="alert-dialog-title">
        {props.title}
      </DialogTitle>
      <DialogContent>
        
        {props.messageList?(
          <>
            {props.messageList.map((messages) => (
                          <DialogContentText key={messages.message} id="alert-dialog-description">
                                {messages.message}
                          </DialogContentText>
                      ))}
          </>
        ):(
          <>
            <DialogContentText id="alert-dialog-description">
                  Nothing found!
            </DialogContentText>
          </>
        )}
      </DialogContent>
      <DialogActions>
        <Button onClick={printOrder}> Print Order </Button>
        <Button onClick={props.handleClose} autoFocus> Close </Button>
      </DialogActions>
    </Dialog>
  );

    if (!props.open)
        dialog = null;
    


    return (dialog);
}

export default OrderMessage;