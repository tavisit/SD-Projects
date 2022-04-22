
    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `additional_information` varchar(255),
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `additional_information` varchar(255),
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `additional_information` varchar(255),
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);

    create table `foodcategories` (
       `id` integer not null auto_increment,
        `description` varchar(1024),
        `name` varchar(63) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `foodstatus` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `location` (
       `id` integer not null auto_increment,
        `city` varchar(256) not null,
        `latitude` float,
        `longitude` float,
        primary key (`id`)
    ) engine=InnoDB;

    create table `order_x_foods` (
       `id` integer not null auto_increment,
        `quantity` integer not null,
        `food_id` integer not null,
        `order_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `orders` (
       `id` integer not null auto_increment,
        `additional_information` varchar(255),
        `latitude` float,
        `longitude` float,
        `price` integer not null,
        `restaurant_id` integer not null,
        `status` integer not null,
        `user_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `restaurantfoods` (
       `id` integer not null auto_increment,
        `food_description` varchar(1024),
        `food_name` varchar(128),
        `price` integer not null,
        `food_category` integer,
        `restaurant_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `role` (
       `id` integer not null auto_increment,
        `name` varchar(45) not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `users` (
       `id` integer not null auto_increment,
        `email` varchar(255) not null,
        `name` varchar(255) not null,
        `password` varchar(255) not null,
        `location_id` integer not null,
        `role` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    alter table `order_x_foods` 
       add constraint `FK8l89hrbo6exr5mgk9cm28xucw` 
       foreign key (`food_id`) 
       references `restaurantfoods` (`id`);

    alter table `order_x_foods` 
       add constraint `FK3agl1y2mbr2yg9a1cjiaxudy7` 
       foreign key (`order_id`) 
       references `orders` (`id`);

    alter table `orders` 
       add constraint `FKd1h4v8qarby9dp15lmb499y5k` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `orders` 
       add constraint `FKm3400a5xntewt65qt6t0t9dvg` 
       foreign key (`status`) 
       references `foodstatus` (`id`);

    alter table `orders` 
       add constraint `FKitd0598xtxfyrro0df4ey8kdd` 
       foreign key (`user_id`) 
       references `users` (`id`);

    alter table `restaurantfoods` 
       add constraint `FKsqbmqnuop82t203hibuyty3hi` 
       foreign key (`food_category`) 
       references `foodcategories` (`id`);

    alter table `restaurantfoods` 
       add constraint `FK8cxnvxbt7sakb24ua3c3o6cy4` 
       foreign key (`restaurant_id`) 
       references `users` (`id`);

    alter table `users` 
       add constraint `FKsqc5hj1urtefnp1wl5rqdaw55` 
       foreign key (`location_id`) 
       references `location` (`id`);

    alter table `users` 
       add constraint `FKqm9f0vyf22rpabgv086855ter` 
       foreign key (`role`) 
       references `role` (`id`);
