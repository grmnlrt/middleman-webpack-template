# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :external_pipeline,
    name: :webpack,
    command: build? ?
    "./node_modules/webpack/bin/webpack.js --bail -p" :
    "./node_modules/webpack/bin/webpack.js --watch -d --progress --color",
    source: "build",
    latency: 1

# Layouts
# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  # "Ignore" JS and CSS so webpack has full control.
  # ignore { |path| path =~ /\/(.*)\.js|css$/ && $1 != "all" && $1 != "vendor" }

  # Minify Javascript on build
  activate :minify_javascript

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  config[:relative_links] = true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end
