class Twittermessage

        def query_twitter

          @client = Twitter::REST::Client.new do |config|
                config.consumer_key        = ENV["API_KEY"]
                config.consumer_secret     = ENV["API_SECRET"]
                config.access_token        = ENV["ACCESS_TOKEN"]
                config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
          end
        end
=begin
        $clientstream = Twitter::Streaming::Client.new do |config|
          config.consumer_key        = ENV["API_KEY"]
          config.consumer_secret     = ENV["API_SECRET"]
          config.access_token        = ENV["ACCESS_TOKEN"]
          config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
        end
=end
        def initialize(content)
          @twitt = content
        end


        def perform
            query_twitter
            message(@twitt)
        end

        #Pour publier un tweet "Hello"
        def message(twitt)
          @client.update(twitt)
        end
        #message("Hello!")

=begin
        def search_emails
          client = query_twitter
          tweets = client.search("\@ -RT email", lang: "fr", result_type:"recent").take(10)

          results=[]
          tweets.each { |tweet|
            email = ">>>> #{tweet.user.screen_name}: #{tweet.text} \n"
            results << email.to_s
            }
          results
        end
        #puts search_emails


        #Pour envoyer un message à plusieurs personnes avec personnalisation
        def message_commun(people)
          people.each do |user|
            message = 'Hello ! ' + user
            $client.update(message)
            end
        end
        # message_commun(["@ThpTest","@Fabien_971"])



        # streamer tous les tweets qui mentionnent tea, ou coffee.
        def topic_stream(*topics)
          $client.filter(track: topics.join(",")) { |object|
            puts object.text if object.is_a?(Twitter::Tweet)  #On filtre tous les éléments trouvés de type tweet
          }
        end
        #topic_stream(["coffee","tea"])


        #Pour follow une liste de twittos
        def to_follow(*liste_personnes)
          liste_personnes.each{ |twittos|
            $client.follow(twittos)
            print "Follow #{twittos} : C'est fait !"
          }
        end
        #to_follow("Fabien_971","Mamarieponpont")

=end

end
