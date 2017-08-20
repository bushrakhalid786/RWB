class Image < ApplicationRecord 
  # include Paperclip::Glue	

  belongs_to :attachable, :polymorphic => true
  do_not_validate_attachment_file_type :avatar

  has_attached_file :avatar,
                    :path_prefix => "/public/images/",
  					:path => ":rails_root/public/:attachment/:id/:style/:filename",
  					:url => "/:attachment/:id/:style/:filename"

end
