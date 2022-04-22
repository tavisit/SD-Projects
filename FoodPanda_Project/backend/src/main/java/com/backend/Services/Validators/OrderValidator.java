package com.backend.Services.Validators;

import com.backend.Common.exceptions.InvalidDataException;
import com.backend.Data.Entities.Order;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.UserRepository;

public class OrderValidator {
    public static void OrderValidator(Order orderDto, UserRepository userRepository) throws Exception {
        isValidClient(orderDto.getUserClass().getId(),userRepository);
        isValidRestaurantId(orderDto.getRestaurant().getId(),userRepository);
    }

    public static void isValidRestaurantId(Integer id,UserRepository userRepository) throws InvalidDataException {
       try{
           UserClass userClass = userRepository.getById(id);
       }catch (Exception ex)
       {
           throw new InvalidDataException("Invalid Restaurant");

       }
    }

    public static void isValidClient(Integer id,UserRepository userRepository) throws InvalidDataException {
        try{
            UserClass userClass = userRepository.getById(id);
        }catch (Exception ex)
        {
            throw new InvalidDataException("Invalid User");

        }
    }
}
