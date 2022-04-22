import React from "react";
import { compose, withProps } from "recompose";
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";
import LocalStorageHelper from "./localStorageMethods";
import { Divider } from "@mui/material";
const MyMapComponent = compose(
  withProps({
    googleMapURL:
      "https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry,drawing,places",
    loadingElement: <div style={{ height: `100%` }} />,
    containerElement: <div style={{ height: `400px` }} />,
    mapElement: <div style={{ height: `100%` }} />
  }),
  withScriptjs,
  withGoogleMap
)(props => (
  
  <>
    <GoogleMap
      onClick={ev => {
        localStorage.setItem("coordinatesEating",JSON.stringify({
          latitude:ev.latLng.lat(),
          longitude:ev.latLng.lng()
        }));
      }}
      defaultZoom={15}
      defaultCenter={{ lat: LocalStorageHelper.getUser().location.latitude, lng: LocalStorageHelper.getUser().location.longitude }}
    >
    </GoogleMap>
  </>
));

class GoogleMaps extends React.PureComponent {
  state = {
    isMarkerShown: false
  };

  

  componentDidMount() {
    this.delayedShowMarker();
  }

  delayedShowMarker = () => {
    setTimeout(() => {
      this.setState({ isMarkerShown: true });
    }, 3000);
  };

  handleMarkerClick = () => {
    this.setState({ isMarkerShown: false });
    this.delayedShowMarker();
  };

  render() {
    return (
      <>
      
      <Divider />
      <MyMapComponent
        isMarkerShown={this.state.isMarkerShown}
        onMarkerClick={this.handleMarkerClick}
      />
      
      <Divider />
      </>
      
    );
  }
}
export default GoogleMaps;