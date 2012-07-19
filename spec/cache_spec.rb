require 'spec_helper'

describe Rack::Restfolia::Cache do
  context 'get stored objects' do
    subject { Rack::Restfolia::Cache.get('http://www.example.com') }
    before { Rack::Restfolia::Cache.store('http://www.example.com', 'restfolia response data') }
    it { should eq 'restfolia response data' }
  end

  context 'clear storage when start' do
    subject { Rack::Restfolia::Cache.get('http://www.example.com') }
    before do
      Rack::Restfolia::Cache.store('http://www.example.com', 'restfolia response data')
      Rack::Restfolia::Cache.start
    end
    it { should be_nil }
  end
  
  context 'clear storage' do
    subject { Rack::Restfolia::Cache.get('http://www.example.com') }
    before do
      Rack::Restfolia::Cache.store('http://www.example.com', 'restfolia response data')
      Rack::Restfolia::Cache.clear
    end
    it { should be_nil }
  end
end