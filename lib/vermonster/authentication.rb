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

      options = { :grant_type => "autorization_code", :code => code }
      response = Vermonster::Client.connection.post "/oauth/token", options

      if response.body["access_token"]
        @client = @client.merge(:token => response.body["access_token"])

        self.connect!(@client[:token])


        if @client[:token]
          @client[:token]
        else
          false
        end
      else
        false
      end
    end

    # Skip the code and just use the developer's user access token.
    def use_token!(token)
      @client = @client.merge(:token => token)

      self.connect!(@client[:token])

      authorized?
    end

    # Check if authorized or not.
    def authorized?
      if Vermonster::Client.connection.get("me").status == 200
        true
      else
        false
      end
    end
  end
end