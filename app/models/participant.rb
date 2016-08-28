class Participant
  include HTTParty

  debug_output $stdout

  base_uri "api.tv4play.se"

  def get_participant(id)
    Rails.cache.fetch("participant/#{id}_cache", expires_in: 1.hour) do
      encoded_person_tag = URI.encode(id.strip)
      response = self.class.get('/play/video_assets.json?tags=' + encoded_person_tag)
      if response.success?
        participant_parsed_hash = response.parsed_response["results"].map do |participant|
          {
            :id => participant["id"],
            :title => participant["title"],
            :description => participant["description"],
            :image => participant["image"],
            :published_date => participant["published_date_time"].to_date,
            :tags => participant["tags"]
          }
        end
      else
        raise response.message
      end
    end
  end

end