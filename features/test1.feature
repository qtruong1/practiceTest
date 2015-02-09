Feature: Order Dominos Pizza Online
   We want to step through a simple scenario for training

Background:
   When I visit the Dominos home page


@testOrderOnline
Scenario: Check the Order Online page
Given I am on the Dominos home page
   When I click on 'Order Online' link
   Then I should be on 'Order Online' home page

@testFillingAddress
Scenario: Filling out the Address Information and search for a delivery store
Given I visit Address Information page
	When I fill out "Address Information" form
      And I select Search Location button
	   And I click on "Continue" button
	Then I should be on Location Results Page

@testSelectDeliveryStore
Scenario: Selecting specific delivery story
Given I am on Address Information page
   When I click on Order Delivery button
   Then I should be on "Entrees" page
   

@testOrderMultiplePizzas
Scenario: Selecting multiple pizzas
Given I am on Specialty Pizza page
   When I select and add Chiken & Bacon Carbonara pizza in my order
   Then I should be able to add Specialty Pizza pizza into My order
   When I select and add Spinach and Feta pizza in my order 
   Then I should be able to add Spinach & Feta pizza into My order

@testCheckOutCart
Scenario: Check out my Order
Given I already selected store and added 2 pizzas into My order list
   When I select "Checkout" button
   Then I should be on "Continue Checkout" page
   When I select Continue Checkout button
   Then I should be on Order Summary page with correct order


