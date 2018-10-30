class GroupMessage < ApplicationRecord
    belongs_to :group
    belongs_to :sender, class_name: "User"
end
