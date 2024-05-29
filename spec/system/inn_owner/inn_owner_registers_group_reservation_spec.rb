require 'rails_helper'

describe 'Inn owner registers group reservation' do
  it 'through inn management' do
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
        postal_code: '69067-700', 
        neighborhood: 'Centro'
      }
    )

    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'
    within('section#group-reservations') do
      click_on 'Nova reserva para grupo'
    end
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Data de entrada'
    expect(page).to have_field 'Data de saída'

    click_on 'Fazer reserva'
  end
end
