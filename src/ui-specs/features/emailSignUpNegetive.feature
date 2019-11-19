Feature: Verify user signup for Bethewave user signup with invalid email signup data
    1. SignUp with email
    2. Signup with facebook
    3. Signup with twitter
    4. Signup with google

    @regression
    Scenario: Verify different signup types for Bethewave
        Given I am on application home page
        When I click on signup button on application home page
        Then I should see application signup page
        Then I should see signup with email
        Then I should see signup with facebook
        Then I should see signup with twitter
        Then I should see signup with google

    @regression
    Scenario: Verify User Email signup validation with all field blank
        Given I am on application home page
        When I click on signup button on application home page
        Then I should see application signup page
        Then I should see signup with email
        When I click on email signup button
        Then I should see validation error for firstname as "First Name is required" on signup page
        Then I should see validation error for lastname as "Last Name is required" on signup page
        Then I should see validation error for email as "Email is required" on signup page
        Then I should see validation error for password as "Password is required" on signup page

    @regression
    Scenario Outline: Verify User Email signup validation in when <testcaseTitle>
        Given I am on application home page
        When I click on signup button on application home page
        Then I should see application signup page
        Then I should see signup with email
        When I enter firstname as "<firstname>" on email signup page
        When I enter lastname as "<lastname>" on email signup page
        When I enter email as "<email>" on email signup page
        When I enter password as "<password>" on email signup page
        When I click on email signup button
        Then I should see validation error for firstname as "<firstnameErrorMsg>" on signup page
        Then I should see validation error for lastname as "<lastnameErrorMsg>" on signup page
        Then I should see validation error for email as "<emailErrorMsg>" on signup page
        Then I should see validation error for password as "<PasswordErrorMsg>" on signup page
        Then I should stay on email signup page

        Examples:
            | testcaseTitle                             | firstname                       | lastname                        | email                               | password  | firstnameErrorMsg                                                       | lastnameErrorMsg                                                        | emailErrorMsg      | PasswordErrorMsg                                                                                             |
            | All field blank                           |                                 |                                 |                                     |           | First Name is required                                                  | Last Name is required                                                   | Email is required  | Password is required                                                                                         |
            | first name not blank                      | User First Name                 |                                 |                                     |           |                                                                         | Last Name is required                                                   | Email is required  | Password is required                                                                                         |
            | last name not blank                       |                                 | User Last Name                  |                                     |           | First Name is required                                                  |                                                                         | Email is required  | Password is required                                                                                         |
            | Email not blank                           |                                 |                                 | test@Bethewave.com                  |           | First Name is required                                                  | Last Name is required                                                   |                    | Password is required                                                                                         |
            | Password not blank                        |                                 |                                 |                                     | Test1234# | First Name is required                                                  | Last Name is required                                                   | Email is required  |                                                                                                              |
            | First name 1 char                         | a                               |                                 |                                     | Test1234# | Name must be at least 2 characters without number and special character | Last Name is required                                                   | Email is required  |                                                                                                              |
            | Last name 1 char                          |                                 | b                               |                                     | Test1234# | First Name is required                                                  | Name must be at least 2 characters without number and special character | Email is required  |                                                                                                              |
            | First name with number                    | 123                             |                                 |                                     | Test1234# | Name must be at least 2 characters without number and special character | Last Name is required                                                   | Email is required  |                                                                                                              |
            | Last name with number                     |                                 | 123                             |                                     | Test1234# | First Name is required                                                  | Name must be at least 2 characters without number and special character | Email is required  |                                                                                                              |
            | First name with special character         | @#$-                            |                                 |                                     | Test1234# | Name must be at least 2 characters without number and special character | Last Name is required                                                   | Email is required  |                                                                                                              |
            | Last name with special character          |                                 | 123                             |                                     | Test1234# | First Name is required                                                  | Name must be at least 2 characters without number and special character | Email is required  |                                                                                                              |
            | Last name with special character & number |                                 | 123&&&                          |                                     | Test1234# | First Name is required                                                  | Name must be at least 2 characters without number and special character | Email is required  |                                                                                                              |
            | First name 31 char                        | SYEURILJDRBGTHLRQQBEqwervfdsera |                                 |                                     | Test1234# |                                                                         | Last Name is required                                                   | Email is required  |                                                                                                              |
            | Last name 31 char                         |                                 | SYEURILJDRBGTHLRQQBEqwervfdsera |                                     | Test1234# | First Name is required                                                  |                                                                         | Email is required  |                                                                                                              |
            | First name 30 char                        | SYEURILJDRBGTHLRQQBEqwervfdser  |                                 |                                     | Test1234# |                                                                         | Last Name is required                                                   | Email is required  |                                                                                                              |
            | Last name 30 char                         |                                 | SYEURILJDRBGTHLRQQBEqwervfdser  |                                     | Test1234# | First Name is required                                                  |                                                                         | Email is required  |                                                                                                              |
            | Email without @                           |                                 |                                 | test                                |           | First Name is required                                                  | Last Name is required                                                   | Email is incorrect | Password is required                                                                                         |
            | Email without . after @                   |                                 |                                 | test@                               |           | First Name is required                                                  | Last Name is required                                                   | Email is incorrect | Password is required                                                                                         |
            | Email with invaid suffix                  |                                 |                                 | test@.                              |           | First Name is required                                                  | Last Name is required                                                   | Email is incorrect | Password is required                                                                                         |
            | Email with length 31 char                 |                                 |                                 | SYEURILJDRBGTH111LRQQ@Bethewave.com |           | First Name is required                                                  | Last Name is required                                                   |                    | Password is required                                                                                         |
            | Password without uppercase character      |                                 |                                 |                                     | est1234#  | First Name is required                                                  | Last Name is required                                                   | Email is required  | Your password must be at least 7 characters withOne special character,One upper case letter and one numeric. |
            | Password without number                   | Fisrt                           |                                 |                                     | singh12#  |                                                                         | Last Name is required                                                   | Email is required  | Your password must be at least 7 characters withOne special character,One upper case letter and one numeric. |
            | Password length less than 6 character     |                                 | Last                            |                                     | S12#      | First Name is required                                                  |                                                                         | Email is required  | Your password must be at least 7 characters withOne special character,One upper case letter and one numeric. |
            | Password without special character        | First                           | Last                            |                                     | Sing123   |                                                                         |                                                                         | Email is required  | Your password must be at least 7 characters withOne special character,One upper case letter and one numeric. |
            | Password valid and No messages            |                                 |                                 |                                     | Sin123#   | First Name is required                                                  | Last Name is required                                                   | Email is required  |                                                                                                              |