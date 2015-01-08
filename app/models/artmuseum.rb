# module ArtMuseum

#   class Client
#     include HTTParty

#     base_uri "http://www.brooklynmuseum.org/opencollection/api"

#     def image_search
#       response = self.class.get('/?method=collection.search&version=1&api_key=API_KEY&keyword=Monet')

#       response.body
#     end

#   end

# end