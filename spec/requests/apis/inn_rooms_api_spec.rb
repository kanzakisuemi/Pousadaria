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
    inn.inn_rooms.create!(name: 'Quarto Tradicional', size: 35, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto Moderno', size: 30, guest_limit: 3)

    
  end
end
