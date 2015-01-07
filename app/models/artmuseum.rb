module ArtMuseum

  class Client
    include HTTParty

    base_uri "http://www.brooklynmuseum.org/opencollection/api"

    def art
      response = self.class.get('/?method=collection.search&version=1&api_key=[ API KEY]&keyword=params')

      return response.body
    end

  end

end