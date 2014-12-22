#Local methods:
#Home page
def order_online_page
	find(".qa-Cl_order").click
	sleep 3
end


#find and click on Delivery car icon
def delivery_icon_selection
	find(".Delivery").click
end

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
	find('option', :text=> 'VA').click
	#find and select Zipcode=VA
	find(:id, 'Postal_Code').click
	fill_in('Zip Code', :with => '22107-0002')
end

#Clicking on Continue button
def continue_button
	click_link_or_button("Continue")
end

#method to visit "Specialty Pizza" page
def navigate_to_specialtypizza
	order_online_page
	delivery_icon_selection
	filling_address_info
	continue_button
	find(".navigation-Pizza").click
end




####-----BODY go Below this line----######

#Background step:
When(/^I visit the Dominos home page$/) do
	visit("https://order.dominos.com")
end

#test1_OrderOnlineAddress
Given(/^I am on the Dominos home page$/) do
	expect(page).to have_selector(:id, 'homePage')
end
When(/^I click on 'Order Online' link$/) do
    
end
Then(/^I should be on 'Order Online' home page$/) do
    expect(page).to have_selector(:id, 'locationsSearchPage')
end

#test2_Filling out Address Information and be on Entrees page
Given(/^I visit Address Information page$/) do
    order_online_page
end
When(/^I fill out "Address Information" form$/) do
	delivery_icon_selection
	filling_address_info
end
When(/^I click on "Continue" button$/) do
	continue_button
end
Then(/^I should be on "Entrees" page$/) do
	expect(page).to have_selector(:id, 'entree-BuildYourOwn')
end

#test3_Ordering Chicken & Bacon Carbonara Pizza
Given(/^I am on "Specialty Pizza" page$/) do
	navigate_to_specialtypizza
	expect(page).to have_selector(:id, "categoryPage2")
end
When(/^I click on Chiken & Bacon Carbonara text link$/) do
	first(".media__title").find("a").click
end
When(/^I click on "Add to Order" button from Chicken & Bacon Carbonara$/) do
	click_button('Add to Order')
end	
Then(/^I should be able to be back on the Specialty Pizza page$/) do
	expect(page).to have_selector(:id, "categoryPage2")
end
Then(/^I should see the selected pizza added in "My Order"$/) do
	expect(page).to have_selector('h3', text: 'Chicken & Bacon Carbonara')
end
When(/^I click on "Checkout" button$/) do
	find(".js-buttonCheckout.qa-AllChek").click
end
Then(/^I should be on "Continue Checkout" page$/) do
	expect(page).to have_selector(:id, 'myProfileInCheckout')
end
When(/^I click on "Continue Checkout" button$/) do
	find(:xpath, '/html/body/div[3]/div[2]/div/div/div/aside/a').click
end	
Then(/^I should be Place the Order page$/) do
	find(:xpath, '/html/body/div[21]/div/div/div[2]/div[2]/div/a[2]').click
	expect(page).to have_selector(:id, 'createPizzaProfile')
end
