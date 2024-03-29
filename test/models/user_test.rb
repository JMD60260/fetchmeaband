# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  it { expect(user).to allow_value('dhh@nonopinionated.com').for(:email) }
  it { expect(user).to_not allow_value('base@example').for(:email) }
  it { expect(user).to_not allow_value('blah').for(:email) }
  it { expect(user).to ensure_length_of(:description).is_at_least(1).is_at_most(1000) }
  it { expect(user).to validate_confirmation_of(:password) }
end
