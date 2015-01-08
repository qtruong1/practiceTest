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

@test3
Scenario: Selecting multiple pizzas and Ordering them
Given I am on "Specialty Pizza" page
   When I click on Chiken & Bacon Carbonara text link
      And I click on "Add to Order" button from Chicken & Bacon Carbonara
   Then I should be able to be back on the Specialty Pizza page
      And I should see 'Chicken & Bacon Carbonara' pizza added in "My Order"
   When I click on Spinach and Feta text link
      And I click on "Add to Order" button from Spinack and Feta 
   Then I should see 'Spinach & Feta' pizza added in "My Order"
   When I click on "Checkout" button
   Then I should be on "Continue Checkout" page
   When I click on "Continue Checkout" button
   Then I should be on Place the Order page