@block @block_muprogmyoverview @tool_muprog @tool_muhome @javascript @MuTMS
Feature: The My programs overview block can be added to custom home pages

  Background:
    Given I skip tests if "tool_muhome" is not installed
    And the following config values are set as admin:
      | enablemyhome | 1 |             |
      | forcelogin   | 0 |             |
      | replacehome  | 1 | tool_muhome |
    And the following "users" exist:
      | username | firstname | lastname | email                |
      | manager1 | Manager   | 1        | manager1@example.com |
      | student1 | Student   | 1        | student1@example.com |
      | student2 | Student   | 2        | student2@example.com |
    And the following "role assigns" exist:
      | user     | role    | contextlevel | reference |
      | manager1 | manager | System       |           |
    And the following "tool_muprog > programs" exist:
      | fullname  | idnumber  | category |
      | Program 1 | C1        | 0        |
      | Program 2 | C2        | 0        |
      | Program 3 | C3        | 0        |
    And the following "tool_muprog > program_allocations" exist:
      | user     | program   |
      | student1 | Program 1 |
      | student1 | Program 2 |
    And the following "tool_muhome > pages" exist:
      | name        | status | guestvisible | uservisible | title |
      | Home page 1 | active | 1            | 1           | HP1   |

  Scenario: Manager can add My programs overview block to custom home page
    Given I log in as "manager1"
    And I am on the "Home page 1" "tool_muhome > Home page" page
    And I turn editing mode on
    And I add the "My programs overview" block
    And I turn editing mode off
    And I log out

    When I log in as "student1"
    And I am on the "Home page 1" "tool_muhome > Home page" page
    Then I should see "My programs overview" in the "My programs overview" "block"
    And I should see "Program 1" in the "My programs overview" "block"
    And I should see "Program 2" in the "My programs overview" "block"
    And I should not see "Program 3" in the "My programs overview" "block"
    And I log out

    When I log in as "student2"
    And I am on the "Home page 1" "tool_muhome > Home page" page
    Then I should see "HP1" in the "h1" "css_element"
    And I should not see "My programs overview"
    And I log out

    When I am on the "Home page 1" "tool_muhome > Home page" page
    Then I should see "HP1" in the "h1" "css_element"
    And I should not see "My programs overview"

  Scenario: Manager can hide and show My programs overview block on custom home page
    Given I log in as "manager1"
    And I am on the "Home page 1" "tool_muhome > Home page" page
    And I turn editing mode on
    And I add the "My programs overview" block

    When I open the "My programs overview" blocks action menu
    And I click on "Hide My programs overview block" "link" in the "My programs overview" "block"
    And I open the "My programs overview" blocks action menu
    Then "Show My programs overview block" "link" should exist in the "My programs overview" "block"

    When I click on "Show My programs overview block" "link" in the "My programs overview" "block"
    And I open the "My programs overview" blocks action menu
    Then "Hide My programs overview block" "link" should exist in the "My programs overview" "block"
