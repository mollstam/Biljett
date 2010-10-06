Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit the tickets
  
  Background:
    Given there is a user with the email address "user@biljett.com" and password "password"
    Given "user@biljett.com" has confirmed their account
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And "user@biljett.com" has created a ticket for this project:
      | title               | description                   |
      | Make it shiny!      | Gradients! Starbursts! Oh my! |
    Given I am on the homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    And I follow "Edit"
    
  Scenario: Updating a ticket
    When I fill in "Title" with "Make it really shiny!"
    And I press "Update"
    Then I should see "Ticket has been updated."
    And I should be on the "Make it really shiny!" ticket in the "TextMate 2" project
    And I should see "Make it really shiny!"
    But I should not see "Make it shiny!"
  
  Scenario: Updating a ticket with invalid information
    When I fill in "Title" with ""
    And I press "Update"
    Then I should see "Ticket has not been updated"