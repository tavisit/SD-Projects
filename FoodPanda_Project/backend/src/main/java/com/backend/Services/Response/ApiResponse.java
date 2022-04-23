package com.backend.Services.Response;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Getter;
import org.springframework.http.HttpHeaders;

@JsonPropertyOrder({ "httpHeaders", "httpStatusCode", "message", "data" })
@Getter
public class ApiResponse<T> {
    private final HttpHeaders httpHeaders;
    private final int httpStatusCode;
    private final String message;
    private final T data;

    public ApiResponse(ApiResponseBuilder<T> builder) {
        this.httpHeaders = builder.getHttpHeaders();
        this.httpStatusCode = builder.getHttpStatusCode();
        this.message = builder.getMessage();
        this.data = builder.getData();
    }

}

