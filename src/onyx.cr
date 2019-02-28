require "onyx-rest"
require "json"

struct Hello
  include Onyx::REST::Action

  def call
    puts JSON.parse(%({"name": "John" , "age": 30, "city": "New York"}))
    context.response << JSON.parse(%({"name": "John" , "age": 30, "city": "New York"}))
  end
end

router = Onyx::HTTP::Router.new do
  get "/", Hello
end

server = Onyx::HTTP::Server.new(router)
server.bind_tcp(5000)
server.listen