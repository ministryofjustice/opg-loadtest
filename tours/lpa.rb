module Webrat
  class Session
    def basic_auth(user, pass)
      encoded_login = ["#{user}:#{pass}"].pack("m*").gsub(/\n/, '')
      header('HTTP_AUTHORIZATION', "Basic #{encoded_login}")
      if Webrat.adapter_class == MechanizeAdapter
        self.adapter.mechanize.auth(user, pass)
      end
    end
    def internal_redirect?
      redirect?
    end

  end
end
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class Lpa < Tourist
  def tour_homepage
  	basic_auth("beta", "beta")
    visit "https://lastingpowerofattorney.service.gov.uk/user/login"
    fill_in "Email address", :with => "james@abscond.org"
    fill_in "Password", :with => "loadtesting1"
    click_button "Sign in"
    click_link "Create a new LPA"

    choose "Health and welfare"
    click_button "Save and continue"

	click_link "Add donor details"
    fill_in "First name", :with => "James"
    fill_in "Last name", :with => "Darling"
    select "01", :from => "dob[day]"
    select "January", :from =>  "dob[month]"
    select "1988", :from =>  "dob[year]"
    fill_in "Phone", :with => "020863548578"
    fill_in "email", :with => "test@abscond.org"
    fill_in "address[addr1]", :with => "8 Somehwere"
    fill_in "address[addr2]", :with => "8 Somehwere"
    fill_in "address[addr3]", :with => "8 Somehwere"
    fill_in "Town", :with => "Town"
    fill_in "County", :with => "County"
    fill_in "Postcode", :with => "E2 6BH"
    click_button "Save details"
    click_link "Save and continue"

    choose "lifesustaining-no"
    click_button "Save and continue"

	click_link "Add an attorney"
    fill_in "First name", :with => "James2"
    fill_in "Last name", :with => "Darling"
    select "01", :from => "dob[day]"
    select "January", :from =>  "dob[month]"
    select "1988", :from =>  "dob[year]"
    fill_in "address[addr1]", :with => "8 Somehwere"
    fill_in "address[addr2]", :with => "8 Somehwere"
    fill_in "address[addr3]", :with => "8 Somehwere"
    fill_in "email", :with => "test2@abscond.org"
    fill_in "Town", :with => "Town"
    fill_in "County", :with => "County"
    fill_in "Postcode", :with => "E2 6BH"
    select "Other (please specify)...", :from =>  "relationshipToDonor"
    click_button "Save details"
    click_link "Save and continue"

    click_link "Save and continue"


    click_link "Preview LPA"
end
end
