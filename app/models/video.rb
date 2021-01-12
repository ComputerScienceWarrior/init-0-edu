class Video < ApplicationRecord
    belongs_to :topic
    validates_presence_of :title, :url, :topic_id, message: "is required to create a Topic's video."

    def self.by_topic(topic_id)
        where(topic: topic_id)
    end
end
