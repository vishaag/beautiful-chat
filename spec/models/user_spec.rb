require 'rails_helper'

describe User do
  let(:user) { User.create(name: 'XYZ', email: 'xyz@abc.com') }
  let(:group) { Group.create(name: 'Alphabets')}

  describe '#is_admin?' do
    it 'should raise error if no parameter is sent' do
      expect { user.is_admin? }.to raise_error
    end

    context 'when user is part of the group' do
      let(:group_user) { GroupUser.create(group_id: group.id, user_id: user.id) }

      it 'should return true if user is admin on the group' do
        group_user.update_attributes(admin: true)

        expect(user.is_admin?(group)).to be_truthy
      end

      it 'should return false if user is not admin of the group' do
        group_user.update_attributes(admin: false)

        expect(user.is_admin?(group)).to be_falsey
      end

      it 'should return false if user is not admin of this group but is admin of another group' do
        group_user.update_attributes(admin: false)
        another_group = Group.create(name: 'Numbers')
        another_group_user = GroupUser.create(group_id: another_group.id, user_id: user.id, admin: true)

        expect(user.is_admin?(group)).to be_falsey
      end
    end

    context 'when user is not part of the group' do
      before do
        GroupUser.where(group_id: group.id, user_id: user.id).first.try(:destroy)
      end

      it 'should return false' do
        expect(user.is_admin?(group)).to be_falsey
      end
    end
  end
end
