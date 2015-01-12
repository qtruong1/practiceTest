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

#selecting My Delivery Story
def selecting_delivery_story
	find(".js-orderDeliveryNow btn btn--block").click_button
end

#method to visit "Specialty Pizza" page
def navigate_to_specialtypizza
	order_online_page
	delivery_icon_selection
	filling_address_info
	continue_button
#	selecting_delivery_story
	find(".navigation-Pizza").click
end

#close the ad
def close_ad
	find(".js-nothanks").click
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
    order_online_page
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

#adding Chicken & Bacon Carbonara pizza in to the order
When(/^I click on Chiken & Bacon Carbonara text link$/) do
	first(".media__title").find('a').click
end
When(/^I click on "Add to Order" button from Chicken & Bacon Carbonara$/) do
	click_button('Add to Order')
end	
Then(/^I should be able to be back on the Specialty Pizza page$/) do
	expect(page).to have_selector(:id, "categoryPage2")
end
Then(/^I should see 'Chicken & Bacon Carbonara' pizza added in "My Order"$/) do
	expect(page).to have_selector('h3', text: 'Chicken & Bacon Carbonara')
end

#adding Spinach and Feta pizza
When(/^I click on Spinach and Feta text link$/) do
	find(:xpath, '/html/body/div[2]/div[1]/div/div/section[1]/div/div[2]/h3/a').click
end
When(/^I click on "Add to Order" button from Spinack and Feta$/) do
	click_button('Add to Order')
end
Then(/^I should see 'Spinach & Feta' pizza added in "My Order"$/) do
	expect(page).to have_selector('h3', text: 'Spinach & Feta')
end

#Checking out
When(/^I click on "Checkout" button$/) do
	find(".js-buttonCheckout.qa-AllChek").click
end
Then(/^I should be on "Continue Checkout" page$/) do
	expect(page).to have_selector(:id, 'myProfileInCheckout')
end
When(/^I click on "Continue Checkout" button$/) do
	find(:xpath, '/html/body/div[2]/div[2]/div/div/div/aside/a').click
#	find(:xpath, '/html/body/div[1]/div[2]/div/div/div/aside/a').click
end	
Then(/^I should be on Place the Order page$/) do
#	find(:xpath, '/html/body/div[1]/div/div/form/div[6]').click
        close_ad
	expect(page).to have_selector(:id, 'orderPaymentPage')
end
