class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  after_commit { CommentRelayJob.perform_later(self) }
  after_commit { NotificationRelayJob.perform_later(self) }
end
