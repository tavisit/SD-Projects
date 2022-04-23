package com.backend.Services.Response;

import lombok.Getter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

@Getter
public class ApiResponseBuilder<T> {
    private HttpHeaders httpHeaders = new HttpHeaders();
    private final int httpStatusCode;
    private final String message;
    private T data;

    public ApiResponseBuilder(int httpStatusCode, String message) {
        this.httpStatusCode = httpStatusCode;
        this.message = message;
    }

    public ApiResponseBuilder<T> withHttpHeader(HttpHeaders httpHeader) {
        this.httpHeaders = httpHeader;
        return this;
    }

    public ApiResponseBuilder<T> withData(T data) {
        this.data = data;
        return this;
    }

    public ResponseEntity<ApiResponse> build() {
        ApiResponse<T> apiResponse = new ApiResponse<>(this);
        return ResponseEntity.status(apiResponse.getHttpStatusCode()).headers(apiResponse.getHttpHeaders())
                .body(apiResponse);
    }
}
