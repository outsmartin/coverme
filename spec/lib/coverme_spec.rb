require 'spec_helper'

describe Coverme do
  it 'has a version number' do
    expect(Coverme::VERSION).not_to be nil
  end

  it '.config' do
    Coverme.config.token = 'project_token'
    expect(Coverme.config.token).to eq 'project_token'
  end

  it '.ship_it' do
    json = '{}'
    Coverme.config.token = 'project_token'
    expect(Net::HTTP).to receive(:post_form)
    Coverme.ship_it(json)
  end
end
