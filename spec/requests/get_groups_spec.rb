require 'rails_helper'

describe "get all groups route", :type => :request do
  let!(:groups) {
    group = Group.new(:name => "fudge")
    group2 = Group.new(:name => "pie")
    group.save
    group2.save
  }

  before { get '/groups'}

  it 'returns all groups' do
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
