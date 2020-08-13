package com.nitv.model;

import com.nitv.FieldMatch;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@FieldMatch.List(
        @FieldMatch(first = "password", second = "confirmPassword", message = "Password Mismatch.")
)
public class CrmUser {
    @NotNull
    private String firstName;
    @NotNull
    private String lastName;
    @NotNull
    @Pattern(regexp = "[a-z0-9._-]+@[a-z0-9.-]+\\.[a-z]{2,}$", message = "Please follow email format")
    private String email;
    @NotNull
    @Size(max = 30)
    private String username;
    @NotNull
    private String password;
    @NotNull
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
