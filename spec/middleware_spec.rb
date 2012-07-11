require 'spec_helper'

describe Rack::Restfolia::Middleware do
  def app
    AppTest.new
  end

  it "should cache requests" do
    stub = stub_request(:get, "www.example.com")
    get "/"
    stub.should have_been_requested.once
  end
end

class AppTest
  def call(env)
    Net::HTTP.get('www.example.com', '/')
    Net::HTTP.get('www.example.com', '/')
    [200, {}, []]
  end
end
