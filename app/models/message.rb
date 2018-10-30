class Message < ApplicationRecord
  def Message.messages_between(user_ids)
    user_ids_string = user_ids.join("','")
    where("sender_id in ('#{user_ids_string}') and receiver_id in ('#{user_ids_string}') and sender_id != receiver_id", user_ids_string, user_ids_string)
  end

  def Message.sort_by_created_at
    order("created_at asc")
  end
end
