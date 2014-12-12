#Background step:
When(/^I visit the Dominos home page$/) do
	visit("https://order.dominos.com")
end

#test1_OrderOnlineAddress
Given(/^I am on the Dominos home page$/) do
	#expect(page).to have_text("MENU") 
	#expect(page).to have_css("#pageContent")
	expect(page).to have_selector(:id, 'homePage')
end
When(/^I click on 'Order Online' link$/) do
    find(".qa-Cl_order").click
    sleep 20
end
Then(/^I should be on 'Order Online' home page$/) do
    #expect(page).to have_text "ADDRESS INFORMATION"
    #expect(page).to have_css("#pageContent")
    expect(page).to have_selector(:id, 'locationsSearchPage')
end

#test2_Filling out Address Information and be on Entrees page
Given(/^I visit Address Information page$/) do
    find(".qa-Cl_order").click
    sleep 20
end
When(/^I fill out "Address Information" form$/) do
	#find and click on Delivery car icon	
	find(".Delivery").click
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
When(/^I click on "Continue" button$/) do
	click_link_or_button("Continue")
end
Then(/^I should be on "Entrees" page$/) do
	expect(page).to have_selector(:id, 'js-mainSiteNavigation')
end