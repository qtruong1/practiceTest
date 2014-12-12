Feature: Order Dominos Pizza Online
   We want to step through a simple scenario for training

Background:
   When I visit the Dominos home page


@test1
Scenario: Check the Order Online page
Given I am on the Dominos home page
   When I click on 'Order Online' link
   Then I should be on 'Order Online' home page

@test2
Scenario: Filling out the Address Information
Given I visit Address Information page
	When I fill out "Address Information" form
	   And I click on "Continue" button
	Then I should be on "Entrees" page