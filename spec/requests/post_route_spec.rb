require 'rails_helper'

describe "post a group route", :type => :request do

  before do
    post '/groups', params: { :name => 'cake' }
  end

  it 'returns the group name' do
    expect(JSON.parse(response.body)['name']).to eq('cake')
  end

  # it 'returns the quote content' do
  #   expect(JSON.parse(response.body)['content']).to eq('test_content')
  # end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
