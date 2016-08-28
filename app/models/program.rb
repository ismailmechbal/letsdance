class Program
  include HTTParty

  debug_output $stdout

  base_uri "api.tv4play.se"

  def get_program
    Rails.cache.fetch("program_cache", expires_in: 1.hour) do
      response = self.class.get('/site/programs/lets-dance')
      if response.success?
        program_parsed_hash = {
          :nid => response.parsed_response["nid"],
          :name => response.parsed_response["name"],
          :description => response.parsed_response["description"],
          :top_image => response.parsed_response["top_image"],
          :social_block_teasers => response.parsed_response["social_block_teasers"],
          :participants => response.parsed_response["participant_groups"][0]["participants"]
        }
      else
        raise response.message
      end
    end
  end

end