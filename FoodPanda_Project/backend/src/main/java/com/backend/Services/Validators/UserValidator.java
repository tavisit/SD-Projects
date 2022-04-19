package com.backend.Services.Validators;

import com.backend.Common.exceptions.InvalidDataException;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.UserRepository;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserValidator {
    private static final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";

    public static void isUserValid(UserDto user, UserRepository userRepository) throws Exception {
        isValidPassword(user.getPassword());
        isValidEmail(user.getEmail(), userRepository);
    }

    public static void isValidPassword(String password) throws InvalidDataException {
        if (password == null || password.isEmpty())
            throw new InvalidDataException("Please insert a password.");

        if (password.length() < 6)
            throw new InvalidDataException("Password should have at least 6 characters.");
    }

    public static void isValidEmail(String email, UserRepository userRepository) throws InvalidDataException {
        if(email.isEmpty())
            throw new InvalidDataException("Please insert an email.");

        Pattern pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(email);
        if (!matcher.matches())
            throw new InvalidDataException("Invalid email.");

        UserClass userClass = userRepository.findByEmail(email);
        if (userClass != null)
            throw new InvalidDataException("Email already used.");
    }
}
