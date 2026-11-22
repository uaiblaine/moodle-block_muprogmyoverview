@block @block_muprogmyoverview @tool_muprog @javascript @MuTMS
Feature: The My programs overview block can be added to Dashboard

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | student1 | Student   | 1        | student1@example.com |
      | student2 | Student   | 2        | student2@example.com |
    And the following "tool_muprog > programs" exist:
      | fullname  | idnumber  | category |
      | Program 1 | C1        | 0        |
      | Program 2 | C2        | 0        |
      | Program 3 | C3        | 0        |
    And the following "tool_muprog > program_allocations" exist:
      | user     | program   |
      | student1 | Program 1 |
      | student1 | Program 2 |

  Scenario: My programs primary menu is not added by default
    When I log in as "student1"
    Then "My programs" "link" should not exist in the ".primary-navigation" "css_element"

  Scenario: My programs primary menu can be enabled in block settings
    Given I log in as "admin"
    And I navigate to "Plugins > Blocks > My programs overview" in site administration
    And I set the field "Add \"My programs\" menu" to "1"
    And I press "Save changes"
    And I log out

    When I log in as "student1"
    And I click on "My programs" "link" in the ".primary-navigation" "css_element"
    Then I should see "Program 1" in the "My programs overview" "block"
    And I should see "Program 2" in the "My programs overview" "block"

  Scenario: User can add My programs overview block to Dashboard
    Given I log in as "student1"
    And I follow "Dashboard"
    And I should not see "My programs overview"

    When I turn editing mode on
    And I add the "My programs overview" block
    And I turn editing mode off
    Then I should see "My programs overview" in the "My programs overview" "block"
    And I should see "Program 1" in the "My programs overview" "block"
    And I should see "Program 2" in the "My programs overview" "block"
    And I should not see "Program 3" in the "My programs overview" "block"

    When I click on "All" "button" in the "My programs overview" "block"
    And I click on "Starred" "link" in the "My programs overview" "block"
    Then I should not see "Program 1" in the "My programs overview" "block"
    And I should not see "Program 2" in the "My programs overview" "block"

  Scenario: My programs overview block on Dashboard is not displayed to users without programs
    Given I log in as "student2"
    And I follow "Dashboard"
    And I turn editing mode on
    And I add the "My programs overview" block
    And I should see "My programs overview"

    When I turn editing mode off
    Then I should not see "My programs overview"
    And I should not see "No programs"

  Scenario: User can hide and show My programs overview block on Dashboard
    Given I log in as "student1"
    And I follow "Dashboard"
    And I turn editing mode on
    And I add the "My programs overview" block
    And I should see "Program 1" in the "My programs overview" "block"

    When I open the "My programs overview" blocks action menu
    And I click on "Hide My programs overview block" "link" in the "My programs overview" "block"
    Then I should not see "Program 1"

    When I open the "My programs overview" blocks action menu
    And I click on "Show My programs overview block" "link" in the "My programs overview" "block"
    Then I should see "Program 1" in the "My programs overview" "block"

    When I open the "My programs overview" blocks action menu
    And I click on "Hide My programs overview block" "link" in the "My programs overview" "block"
    And I turn editing mode off
    Then I should not see "My programs overview"

  Scenario: User can delete My programs overview block from Dashboard
    Given I log in as "student1"
    And I follow "Dashboard"
    And I turn editing mode on
    And I add the "My programs overview" block
    And I should see "Program 1" in the "My programs overview" "block"

    When I open the "My programs overview" blocks action menu
    And I click on "Delete My programs overview block" "link" in the "My programs overview" "block"
    And I click on "Delete" "button" in the "Delete block?" "dialogue"
    Then I should not see "My programs overview"
