require 'sinatra'
require 'haml'
require 'sass'
require 'bluecloth'
require 'app/models/page'
require 'app/models/post'
require 'app/routes'

set :haml, { :format => :html5 }
set :sass, { :style  => :expanded }

set :public, Proc.new { File.join("content", "static") }

before do
  headers 'Cache-Control' => 'public, max-age=31557600'
end

def page ( page_name )
  page = Page.new(:name => page_name)
  @title = page.title
  @content = page.html
  haml :default
end

def post ( options={} )
  post = Post.new(options)
  @title = post.title
  @content = post.html
  haml :default
end
