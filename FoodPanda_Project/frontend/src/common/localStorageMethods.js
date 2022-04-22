
import config from '../config.json'

const API_GET_USER = config.apiRoot;
export default class LocalStorageHelper {
    static logout = () => {
        localStorage.removeItem('currentShop');
        localStorage.removeItem('user');
        localStorage.removeItem('coordinatesEating');
    }

    static getUser = () => {
        return JSON.parse(localStorage.getItem('user'));
    };

    static setUser = (user) => {
        localStorage.removeItem('user');
        localStorage.setItem('user', JSON.stringify(user));
    };

    static updateProduce = (item) => {
        var user = this.getUser();
        for (let index = 0; index < user.myCart.length; index++) {
            if(user.myCart[index].id == item.id){
                user.myCart[index].quantity = item.quantity;
                break;
            }            
        }
        this.setUser(user);
    }

    static getValueOfCart = () => {
        if(this.getUser().myCart == null) return 0;

        var user = this.getUser();
        var total = 0;
        for (let index = 0; index < user.myCart.length; index++) {
            total += user.myCart[index].price*user.myCart[index].quantity;
        }
        return total;
    }

    static clearCart = () => {
        var user = this.getUser();
        user.myCart = null;
        this.setUser(user);
    };

    static checkoutUser = () => {
        var user = this.getUser();
      const requestOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify(user)
        };
        fetch(API_GET_USER + "cart/delete" , requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);
                this.setUser(response.data);
            })
            .catch(err => {
            });
    };
}