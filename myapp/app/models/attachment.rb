class Attachment < ActiveRecord::Base
  mount_uploader :data, FileUploader
end
