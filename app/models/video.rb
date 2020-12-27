class Video < ApplicationRecord
    belongs_to :topic
    validates_presence_of :title, :url, :topic_id, message: "is required to create a Topic's video."
end
