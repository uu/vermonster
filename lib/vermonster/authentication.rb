module Vermonster
  module Authentication

    # Returns the URL for authorizing the user.
    def authorize_url(options={})
      url = "https://api.cheddarapp.com/oauth/authorize?client_id=#{@client[:id]}"

      options.each do |key, value|
        url = url << "&#{key}=#{value}"
      end

      url
    end

    # Get the token for the user.
    def token!(code)
      Vermonster::Client.connection.basic_auth(@client[:id], @client[:secret])

      response = Vermonster::Client.connection.post "/oauth/token", { :grant_type => "authorization_code", :code => code }

      if response.body["access_token"]
        @client = @client.merge(:token => response.body["access_token"])

        self.connect!(@client[:token])

        true
      else
        false
      end
    end

    # Check if authorized or not.
    def authorized?
      if Vermonster::Client.connection.get("/me").status != 401
        true
      else
        false
      end
    end
  end
end