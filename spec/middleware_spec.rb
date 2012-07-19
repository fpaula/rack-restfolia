require 'spec_helper'

describe Rack::Restfolia::Middleware do
  def app
    Rack::Builder.new do
      use Rack::Restfolia::Middleware
      run AppTest.new
    end
  end

  it "should cache requests" do
    stub = stub_request(:get, "www.example.com").to_return(:headers => {:content_type => 'application/json'}, :body => '[]')
    get "/"
    stub.should have_been_requested.once
  end
end

class AppTest
  def call(env)
    Restfolia.at('http://www.example.com/').get
    Restfolia.at('http://www.example.com/').get
    [200, {'content-type' => 'text'}, []]
  end
end
