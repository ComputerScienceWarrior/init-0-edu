class Topic < ApplicationRecord
    belongs_to :course
    validates_prescence_of :title, :description
end
