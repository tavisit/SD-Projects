package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.FoodstatusDto;
import com.backend.Data.DTOs.OrderAdditionalDto;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Order;
import com.backend.Data.Repositories.FoodstatusRepository;
import com.backend.Data.Repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service that manages data related to the orders data type
 */
@Service
public class OrderService {

    /**
     * order repository used by the service
     */
    @Autowired
    private OrderRepository orderRepository;
    /**
     * food status repository used by the service
     */
    @Autowired
    private FoodstatusRepository foodstatusRepository;


    public OrderService(OrderRepository orderRepository, FoodstatusRepository foodstatusRepository) {
        this.orderRepository = orderRepository;
        this.foodstatusRepository = foodstatusRepository;
    }


    /**
     * Get all the orders from a certain client
     * @param client that needs to be querried
     * @return a list of orders from a certain client
     * @throws Exception thrown if something goes wrong, such as wrong user type
     */
    public List<OrderDto> getAllOrdersOfClient(UserDto client) throws Exception{
        if(client.getRole().isRestaurant()) throw new Exception("The client is incorrect!");
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listOrderDtoToOrder(orderRepository.getAllByUser(mapStructMapper.userDtoToUser(client)));
    }

    /**
     * Get all orders from a certain restaurant
     * @param restaurant that needs to be querried
     * @return a list of orders
     * @throws Exception thrown if something goes wrong, such as wrong user type
     */
    public List<OrderDto> getAllOrdersOfRestaurant(UserDto restaurant) throws Exception{
        if(restaurant.getRole().isClient()) throw new Exception("The client is incorrect!");
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listOrderDtoToOrder(orderRepository.getAllByRestaurant(mapStructMapper.userDtoToUser(restaurant)));
    }

    /**
     * Create a new order from a client to a restaurant
     * @param client the user that added the order
     * @param restaurantDto the user that receives the order
     * @param orderAdditional additional information regarding the order
     * @return a new order object
     */
    public OrderDto createNewOrder(UserDto client, UserDto restaurantDto, OrderAdditionalDto orderAdditional){
        OrderDto orderDto = new OrderDto();
        orderDto.setStatus(createNewOrderCategory());
        orderDto.setUser(client);
        orderDto.setRestaurant(restaurantDto);
        orderDto.setPrice(0);

        if(orderAdditional == null)
        {
            orderAdditional = new OrderAdditionalDto();
            orderAdditional.setAdditionalInformation("Nothing");
            orderAdditional.setLatitude(0.0f);
            orderAdditional.setLongitude(0.0f);
        }
        orderDto.setLatitude(orderAdditional.getLatitude());
        orderDto.setLongitude(orderAdditional.getLongitude());
        orderDto.setAdditionalInformation(orderAdditional.getAdditionalInformation());
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        Order order = orderRepository.save(mapStructMapper.orderDtoToOrder(orderDto));
        return mapStructMapper.orderToOrderDto(order);
    }

    /**
     * Update the order repository with a custom order
     * @param orderDto the modified order
     * @throws Exception if the data cannot be save into the database
     * @return the new updated order
     */
    public OrderDto updateOrder(OrderDto orderDto) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.orderToOrderDto(orderRepository.save(mapStructMapper.orderDtoToOrder(orderDto)));
    }

    /**
     * Get all the order statuses from database
     * @return a list of food statuses
     */
    public List<FoodstatusDto> getOrderStatuses(){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listFoodStatusToFoodStatusDto(foodstatusRepository.findAll());
    }

    /**
     * Get the pending status of orders from the database
     * @return the pending status is returned
     */
    private FoodstatusDto createNewOrderCategory(){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.foodStatusToFoodStatusDto(foodstatusRepository.getById(2));
    }
}
