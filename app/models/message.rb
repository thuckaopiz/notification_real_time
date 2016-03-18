class Message < ActiveRecord::Base
  belongs_to :user
  after_commit { MessageRelayJob.perform_later(self) }
end
