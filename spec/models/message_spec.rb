require 'rails_helper'

describe Message do
  describe :messages_between do

    let(:user_ids) { [1,2] }
    let(:message_1) { Message.create(sender_id: 1, receiver_id: 1, content: 'Hi') }
    let(:message_2) { Message.create(sender_id: 1, receiver_id: 2, content: 'Hi') }
    let(:message_3) { Message.create(sender_id: 2, receiver_id: 1, content: 'Hi') }
    let(:message_4) { Message.create(sender_id: 1, receiver_id: 3, content: 'Hi') }

    
    it 'should return messages between all users' do
      expect(Message.messages_between(user_ids)).to include(message_2)
      expect(Message.messages_between(user_ids)).to include(message_3)
    end

    it 'should not return messages between users not in the array' do
      expect(Message.messages_between(user_ids)).not_to include(message_4)
    end

    it 'should not return messages between the same user' do
      expect(Message.messages_between(user_ids)).not_to include(message_1)
    end
  end
end
