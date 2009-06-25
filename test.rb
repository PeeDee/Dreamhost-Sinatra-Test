#!/usr/bin/ruby
## test.rb
# 
# this is an example built up from the Sinatra Book
# specifically for the Dreamhost PS environment

require 'rubygems'
require 'sinatra'   # the gem that routes to controllers and merges views

use_in_file_templates!  # seems to be required to see the templates appended to this file

get '/favicon.ico' do ; end # flushes spurious browser requests

get '/' do
  "<h1>Worked on Dreamhost!</h1>"
end

get '/foo' do
  "<h2>What about bar?</h2>"
end

get '/foo/:bar' do
  "<h1>Worked on dreamhost!</h1>\n<p>You asked for foo/#{params[:bar]}<p>"
end

get '/test' do
 haml :test # haml processes the view below, merging ruby code results
end

error do
  "Sinatra error. 
  <pre>#{formatted_hash(request.env)}</pre>"
end

not_found do
  "Not Found error. 
  <pre>#{formatted_hash(request.env)}</pre>"
end

helpers do

  def formatted_hash(h)
    h.collect{|k,v| "#{k} (#{v.class.to_s})=> #{v}" }.join("\n")
  end
  
end

## In-file Templates

__END__


@@ layout
!!! XML
!!!
%html
  %head
    %title Sinatra Test Application
  %body
    #content= yield
    #debug_headers
      %h2 Debug Headers
      %h3 File
      %pre.code= "#{__FILE__}"
      %h3 Request
      %pre.code= formatted_hash(request.env)

@@ test
%h1 Testing on Dreamhost

      
