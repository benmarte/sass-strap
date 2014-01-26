# ==============================================================================
# REQUIRED 3RD PARTY COMPASS EXTENSIONS
# ==============================================================================
 
 
# ==============================================================================
# COMPASS PROJECT CONFIGURATION
# ==============================================================================
 
# Can be `:stand_alone` or `:rails`. Defaults to `:stand_alone`.
project_type = :stand_alone
 
# To enable relative paths to assets via compass helper functions.  Please note
# that this will *only* allow you to use relative URLs for the image_url SASS
# function, and not compute relative URLs for you.
#
# Uncomment:
relative_assets       = true
 
# Indicates whether line comments should be added to compiled css that says
# where the selectors were defined.
line_comments         = false
 
# The output style for the compiled css.  One of: `:nested`, `:expanded`,
# `:compact`, or`:compressed`.
output_style          = :compressed

#Enable dehasher to remove generated sprite unique hash. Generates an image without the hash and uses it as the source sprite in the css
dehash_sprite 				  = true
 
# ==============================================================================
# COMPASS SOURCE DIRECTORY CONFIGURATION
# ==============================================================================
 
# Directory containing the SASS source files
sass_dir              = "dev-assets/scss"
 
# Directory where Compass dumps the generated CSS files
css_dir               = "assets/css"
 
# Directory where font files use in font-face declarations are stored
fonts_dir             = "assets/fonts"
 
# Directory where Compass stores the Grid image, and the sites images are stored
images_dir            = "assets/images"

# Directory where Compass loads images from to generate sprites
sprite_load_path          = "dev-assets/sprites"

#Directory where Compass stores generated images
generated_images_dir        = images_dir

# Production Assets URL
http_images_path = "assets/images"

# ==============================================================================
# COMPASS TARGET DIRECTORY CONFIGURATION
# ==============================================================================
 
# The root of all operations, must be set for Compass to work.
http_path             = "/"
 
# Directory where Compass dumps the generated CSS files
http_css_path         = http_path + css_dir
 
# Directory where font files use in font-face declarations are stored
http_fonts_path       = http_path + fonts_dir
 
# Directory where Compass stores the Grid image, and the sites images are stored
http_images_path      = http_path + images_dir
 
# ==============================================================================
# REMOVE CACHE HASH BUSTER FROM FILENAME
# ==============================================================================

if dehash_sprite == true
# Make a copy of sprites with a name that has no uniqueness of the hash.
	on_sprite_saved do |filename|
	  if File.exists?(filename)
	    FileUtils.cp filename, filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
	  end
	end

	# Replace in stylesheets generated references to sprites
	# by their counterparts without the hash uniqueness.
	on_stylesheet_saved do |filename|
	  if File.exists?(filename)
	    css = File.read filename
	    File.open(filename, 'w+') do |f|
	      f << css.gsub(%r{-s[a-z0-9]{10}\.png}, '.png')
	    end
	  end
	end
end
# ==============================================================================
# THE END
# ==============================================================================
