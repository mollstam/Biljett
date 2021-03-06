Feature: Creating Tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and do that
  
  Background:
    Given there is a project called "Internet Explorer"
    And there is a user with the email address "user@biljett.com" and password "password"
    And "user@biljett.com" has confirmed their account
    And I am on the homepage
    When I follow "Internet Explorer"
    And I follow "New Ticket"
    Then I should see "You need to sign in or sign up before continuing"
    When I fill in "Email" with "user@biljett.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "New Ticket"
    
  Scenario: Creating a ticket
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "My pages are ugly!"
    And I press "Create Ticket"
    Then I should see "Ticket has been created"
    Then I should see "Created by user@biljett.com"
    And I follow "Add Ticket"
    Then I should see "New Ticket"
    When I fill in "Title" with "Short tags are bad"
    And I fill in "Description" with "They will kill you in the long run"
    And I press "Create Ticket"
    Then I should see "Ticket has been created"
    
  Scenario: Creating a ticket without valid attributes failes
    When I press "Create Ticket"
    Then I should see "Ticket has not been created"
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"
    
  Scenario: Description must be longer than 10 characters
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "It sucks"
    And I press "Create Ticket"
    Then I should see "Ticket has not been created"
    And I should see "Description is too short (minimum is 10 characters)"