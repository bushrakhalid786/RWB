class Image < ApplicationRecord 
  # include Paperclip::Glue	

  belongs_to :attachable, :polymorphic => true
  do_not_validate_attachment_file_type :avatar
  has_attached_file :avatar,
                    :path_prefix => "/public/images/",
                    :path => ":rails_root/public/images/:id",
                    :url  => "/images/:id",
                    :styles => {
                                :thumb => "172x83#",
                                :small  => "42x42>",
                                :medium => "60x60"#,
                                }


end
