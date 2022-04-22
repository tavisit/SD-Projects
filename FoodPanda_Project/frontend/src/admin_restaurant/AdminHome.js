import * as React from 'react';

import NavBar from "../navbar/NavBar";
import config from "../config.json";
import { useNavigate } from 'react-router-dom';
import LocalStorageHelper from "../common/localStorageMethods";

const API_GET_USER = config.apiRoot;

function AdminHome(){
    let navigate = useNavigate();
    React.useEffect(() => {
        if(LocalStorageHelper.getUser()!=null){
            var user = LocalStorageHelper.getUser();
            if(user.role.name !== "Restaurant"){
                LocalStorageHelper.logout();
                navigate('/login');
                return;
            }
        }
        else{
            navigate('/login');
            return;
        }
    });

    return(
        <div>
            <NavBar typeUser="restaurant"/>
        </div>
    )
};

export default AdminHome;