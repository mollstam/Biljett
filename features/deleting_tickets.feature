Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button to make them disappear
  
  Background:
    Given there is a user with the email address "user@biljett.com" and password "password"
    Given "user@biljett.com" has confirmed their account
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And "user@biljett.com" has created a ticket for this project:
      | title           | description                   |
      | Make it shiny!  | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    
  Scenario: Deleting a ticket
    When I follow "Delete"
    Then I should see "Ticket has been deleted"
    And I should be on the project page for "TextMate 2"
    