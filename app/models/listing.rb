class Listing
  include Mongoid::Document
  include Mongoid::Paperclip
  field :Listing, type: String
  field :name, type: String
  field :price, type: Money
  field :description, type: String

  if Rails.env.development?
		has_mongoid_attached_file :image, :styles => {
	  :small    => ['50x50#',    :jpg, :quality => 70],
	  :medium    => ['200x',     :jpg, :quality => 70],
	  :thumb    => ['100x100#',  :jpg, :quality => 70],
	  :preview  => ['480x480#',  :jpg, :quality => 70],
	  :large    => ['600>',      :jpg, :quality => 70],
	  :retina   => ['1200>',     :jpg, :quality => 30]
	},
	:convert_options => {
	  :small    => '-set colorspace sRGB -strip',
	  :thumb    => '-set colorspace sRGB -strip',
	  :preview  => '-set colorspace sRGB -strip',
	  :large    => '-set colorspace sRGB -strip',
	  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	}, :default_url => 'default.png',
		
		:storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	else
	 has_mongoid_attached_file :image, :styles => {
	  :small    => ['50x50#',    :jpg, :quality => 70],
	  :medium    => ['200x',     :jpg, :quality => 70],
	  :thumb    => ['100x100#',  :jpg, :quality => 70],
	  :preview  => ['480x480#',  :jpg, :quality => 70],
	  :large    => ['600>',      :jpg, :quality => 70],
	  :retina   => ['1200>',     :jpg, :quality => 30]
	},
	:convert_options => {
	  :small    => '-set colorspace sRGB -strip',
	  :thumb    => '-set colorspace sRGB -strip',
	  :preview  => '-set colorspace sRGB -strip',
	  :large    => '-set colorspace sRGB -strip',
	  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	}, :default_url => 'default.png',
		
		:storage => :dropbox,
	    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    :path => ":style/:id_:filename"
	end
	  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    
end
