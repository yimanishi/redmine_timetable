require File.expand_path('../../test_helper', __FILE__)

# require "json"
require 'capybara/rails'
class  LoginTest < Redmine::IntegrationTest
  include Capybara::DSL
  plugin_fixtures :users
  fixtures :projects, :versions, :users, :email_addresses, :roles, :members,
           :member_roles, :issues, :journals, :journal_details,
           :trackers, :projects_trackers, :issue_statuses,
           :enabled_modules, :enumerations, :boards, :messages,
           :attachments, :custom_fields, :custom_values, :time_entries,
           :wikis, :wiki_pages, :wiki_contents, :wiki_content_versions
          
  def setup
    # Capybara.current_driver = Capybara.javascript_driver 
    # Capybara.run_server = true
    # Capybara.server_port = 3001
    # Capybara.current_driver = :selenium
    # Capybara.app_host = 'http://127.0.0.1:3001/'
    # @driver = Selenium::WebDriver.for :firefox
    # @base_url = "http://127.0.0.1:3001"
    # @accept_next_alert = true
    # @driver.manage.timeouts.implicit_wait = 10
    # @verification_errors = []
  end
  
  def teardown
    Capybara.use_default_driver 
    # @driver.quit
    # assert_equal [], @verification_errors
  end
  
  def test_login
    log_user('admin', 'admin')
    get '/ttevents'
    assert_response :success
    assert_template 'ttevents/index'
    # binding.pry
    # @driver.get(@base_url + "/")
    # @driver.find_element(:link, "ログイン").click
    # @driver.find_element(:id, "username").clear
    # @driver.find_element(:id, "username").send_keys "admin"
    # @driver.find_element(:id, "password").clear
    # @driver.find_element(:id, "password").send_keys "admin"
    # @driver.find_element(:name, "login").click
    # @driver.find_element(:link, "時間表").click
    # verify { assert_equal "時間表", @driver.find_element(:css, "h2").text }
    # @driver.find_element(:link, "ログアウト").click
  end

  def element_present?(how, what)
    @receiver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @receiver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @receiver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end