module Lobuki
    class Attends
      def initialize
        create_session
      end

      def self.check
        new.check
      end

      def check
        login
        set_attend
      ensure
        sesion.quit
      end

      private

      attr_accessor :sesion

      def login
        sesion.visit('https://coyote.resuelve.io/')
        sleep(2)
        sesion.find(:xpath, '/html/body/div/section/div[1]/div/button').click
        sleep(2)
        main = sesion.driver.browser.window_handles.first
        popup = sesion.driver.browser.window_handles.last
        sesion.driver.browser.switch_to.window(popup)
        sesion.fill_in('identifierId', with: ENV['GOOGLE_USER'])
        sleep(2)
        sesion.find_by_id('identifierNext').click
        sleep(2)
        sesion.fill_in('password', with: ENV['GOOGLE_PASSWORD'])
        sleep(2)
        sesion.find_by_id('passwordNext').click
        sleep(3)
        sesion.driver.browser.switch_to.window(main)
      end

      def set_attend
        sesion.visit('https://coyote.resuelve.io/asistencias')
        sleep(2)
        auth_token = build_auth_token
        sesion.execute_script("window.requestAttend = function(){
          var xhr = new XMLHttpRequest();
          xhr.open(
            'POST',
            'https://coyote-api.resuelve.io/api/v1/attendances',
            false
          );
          xhr.setRequestHeader('Content-type', 'application/json');
          xhr.setRequestHeader('Authorization', '#{auth_token}');
          xhr.overrideMimeType('text/plain; charset=x-user-defined');
          var params =JSON.stringify({coordinates:{latitude:19.4397712,longitude:-99.1559681}});
          xhr.send(params);
          return xhr.responseText;
        }")
        sesion.evaluate_script('window.requestAttend();')
      end

      def build_auth_token
        raw_token = sesion.evaluate_script("window.localStorage.getItem('COYOTE_AUTH_TOKEN');")
        coyote_auth_token = JSON.parse(raw_token)
        user_info = sesion.evaluate_script("window.localStorage.getItem('user_info');")
        employee_id = JSON.parse(user_info)['id']
        "#{coyote_auth_token}|#{employee_id}"
      end

      def create_session
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile['geo.enabled'] = false
        profile['geo.provider.use_corelocation'] = false
        profile['geo.prompt.testing'] = false
        profile['geo.prompt.testing.allow'] = false

        Capybara.register_driver :firefox do |app|
          Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
        end

        Capybara.javascript_driver = :firefox
        @sesion = Capybara::Session.new(:firefox)
      end

      def options
        Selenium::WebDriver::Firefox::Options.new.tap do |opts|
          opts.args << '--width=1024'
          opts.args << '--height=768'
        end
      end
    end
end
