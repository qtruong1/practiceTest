#Local methods:
#Home page
def order_online_page
	find(".qa-Cl_order").click
	sleep 3
end


#find and click on Delivery car icon
#def delivery_icon_selection
#	find(".Delivery").click
#end

	#Filling out Address Information	
def filling_address_info
	#find and select address type=House
    find(:id, 'Address_Type_Select').click
    find("option[value='House']").click
	#find and fill out Street Address
    find(:id, 'Street').click
    fill_in('Street Address', :with => '9750 Jones Branch Dr')
	#find and fill out City
	find(:id, 'City').click
	fill_in('City', :with => 'McLean')
	#find and select State=VA
	select('VA', from: 'Region')
	#find('option', :text=> 'VA').click
	#find and and fillout Zipcode
	find(:id, 'Postal_Code').click
	fill_in('Zip Code', :with => '22107-0002')
end

#Clicking on Continue button
def continue_button
	click_link_or_button("Continue")
end

def selecting_delivery_store
	filling_address_info
	find('.Locations').click
	continue_button
#	first(".js-futureDeliveryOrder", :minimum => 1).click
	first(".js-orderDeliveryNow", :minimum => 1).click
#	all(".js-orderDeliveryNow")[3].click (example when it is not at first position)
#	first("[data-type='Delivery']", :minimum => 1).click
#	
end

#method to visit "Specialty Pizza" page
def navigate_to_specialtypizza
	order_online_page
	selecting_delivery_store
	find(".navigation-Pizza").click
end

def selecting_ChinkenBaconCarbonaraPizza
	first(".media__title").find('a').click
	click_button('Add to Order')
end

def selecting_SpinachandFetaPizza
    all(".media__title")[1].find('a').click
    click_button('Add to Order')
end

def validating_ChickenandBaconCarbonaraOrder
	#be back on the Specialty Pizza page
	expect(page).to have_selector(:id, "categoryPage2")
	#see 'Chicken & Bacon Carbonara' pizza added in "My Order
	expect(page).to have_selector('h3', text: 'Chicken & Bacon Carbonara')
end

def validating_SpinachandFetaOrder
	#be back on the Specialty Pizza page
	expect(page).to have_selector(:id, "categoryPage2")
	#see 'Chicken & Bacon Carbonara' pizza added in "My Order
	expect(page).to have_selector('h3', text: 'Spinach & Feta')
end

def navigate_to_checkout_page
	navigate_to_specialtypizza
	selecting_ChinkenBaconCarbonaraPizza
	selecting_SpinachandFetaPizza
end

#close the ad
def close_ad
	if page.has_css?('.card--overlay__close', :wait => 5)
		find('.card--overlay__close').click
	end
end



####-----BODY go Below this line----######



#Background step:
When(/^I visit the Dominos home page$/) do
	visit("https://order.dominos.com")
end

#1 @testOrderOnline
Given(/^I am on the Dominos home page$/) do
	expect(page).to have_selector(:id, 'homePage')
end
When(/^I click on 'Order Online' link$/) do
    order_online_page
end
Then(/^I should be on 'Order Online' home page$/) do
    expect(page).to have_selector(:id, 'locationsSearchPage')
end

#2 @testFillingAddress
Given(/^I visit Address Information page$/) do
    order_online_page
end
When(/^I fill out "Address Information" form$/) do
	#delivery_icon_selection
	filling_address_info
end
When (/^I select Search Location button$/) do
	find('.Locations').click
end
When(/^I click on "Continue" button$/) do
	continue_button
end
Then(/^I should be on Location Results Page$/) do
	expect(page).to have_selector(:id, 'locationsResultsPage')
end

#3 @testSelectDeliveryStore
Given(/^I am on Address Information page$/) do
    order_online_page
end
When (/^I click on Order Delivery button$/) do
	selecting_delivery_store
end
Then(/^I should be on "Entrees" page$/) do
	#expect(page.getCurrentUrl).to contain("")
	expect(page).to have_selector(:id, 'entree-BuildYourOwn')
end

#4 @testOrderMultiplePizzas
Given(/^I am on Specialty Pizza page$/) do
	navigate_to_specialtypizza
	expect(page).to have_selector(:id, "categoryPage2")
end
#adding Chicken & Bacon Carbonara pizza in to the order
When(/^I select and add Chiken & Bacon Carbonara pizza in my order$/) do
	selecting_ChinkenBaconCarbonaraPizza
end
Then(/^I should be able to add Specialty Pizza pizza into My order$/) do
	validating_ChickenandBaconCarbonaraOrder
end
#adding Spinach and Feta pizza
When(/^I select and add Spinach and Feta pizza in my order$/) do
	selecting_SpinachandFetaPizza
end
Then(/^I should be able to add Spinach & Feta pizza into My order$/) do
	validating_SpinachandFetaOrder
end

#5 @testCheckOutCart
Given(/^I already selected store and added 2 pizzas into My order list$/) do
	navigate_to_checkout_page
end
When(/^I select "Checkout" button$/) do
	find(".js-buttonCheckout.qa-AllChek").click
	close_ad
end
Then(/^I should be on "Continue Checkout" page$/) do
	expect(page).to have_selector(:id, 'myProfileInCheckout')
end
When(/^I select Continue Checkout button$/) do
	click_link("Continue Checkout")
end
Then(/^I should be on Order Summary page with correct order$/) do
	expect(page).to have_selector('h2', text: 'ORDER SUMMARY')
	expect(page).to have_css(".qty", :text => "1", :minimum => 2)
	expect(page).to have_css(".price", :text => "$9.99", :minimum => 2)
	expect(page).to have_selector('h3', text: 'Chicken & Bacon Carbonara')
end