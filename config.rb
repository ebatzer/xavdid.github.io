###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page '/path/to/file.html', :layout => false
#
# With alternative layout
# page '/path/to/file.html', :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page '/admin/*'
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', :locals => {
#  :which_fake_page => 'Rendering a fake page with a local variable' }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # Don't need to, using minified stuff already.
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  activate :gzip

  # Or use a different image path
  # set :http_prefix, '/Content/images/'
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch   = 'master'
end

activate :syntax
set :markdown,  fenced_code_blocks:           true,
                footnotes:                    true,
                disable_indented_code_blocks: false,
                autolink:                     true,
                strikethrough:                true,
                tables:                       true,
                with_toc_data:                true
# kramdown didn't work
set :markdown_engine, :redcarpet

set :haml, ugly:                 true,
           format:               :html5,
           remove_whitespace:    false,
           hyphenate_data_attrs: false

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :blog do |blog|
  blog.permalink = '/blog/{year}/{month}/{day}/{title}.html'
  blog.sources = '/posts/{year}-{month}-{day}-{title}.html'

  blog.layout = 'blogpost'
  blog.default_extension = '.md'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  # blog.page_link = 'page/{num}'
end
