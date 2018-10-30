class Group < ApplicationRecord
    has_and_belongs_to_many :users, join_table: 'group_users'
    has_many :group_messages
end
