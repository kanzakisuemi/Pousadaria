require 'rails_helper'

describe 'get /api/v1/inn_rooms/id' do
  it 'successfully' do
    inn_owner = InnOwner.create!(
      first_name: 'Julia',
      last_name: 'Kanzaki',
      document: '53783222002',
      email: 'kanzaki@myself.com',
      password: 'password123'
    )
    inn = inn_owner.create_inn!(
      name: 'Pousada Kanzaki', 
      registration_number: '30638898000200', 
      description: 'Um bom lugar', 
      address_attributes: { 
        address: 'Rua Higienopolis', 
        number: '140', 
        city: 'Londrina', 
        state: 'PR', 
        postal_code: '69067-200', 
        neighborhood: 'Centro'
      }
    )
    inn.inn_rooms.create!(name: 'Quarto Tradicional', size: 35, guest_limit: 3, daily_rate_cents: 14000)
    inn.inn_rooms.create!(name: 'Quarto Moderno', size: 30, guest_limit: 3, daily_rate_cents: 12000)

    get '/api/v1/inn_rooms/1'

    expect(response.status).to eq 200
    expect(response.content_type).to include 'application/json'

    json_response = JSON.parse(response.body)

    expect(json_response["name"]).to eq 'Quarto Tradicional'
    expect(json_response["size"]).to eq 35
    expect(json_response["guest_limit"]).to eq 3
    expect(json_response["daily_rate_cents"]).to eq 14000
  end
  it 'fail if room is not found' do
    get '/api/v1/inn_rooms/1'

    json_response = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(json_response['error']).to eq 'not found'
  end
end
