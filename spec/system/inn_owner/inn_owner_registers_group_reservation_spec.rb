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
    fill_in 'Nome', with: 'Contra da Rebase'
    fill_in 'Data de entrada', with: 5.days.from_now
    fill_in 'Data de saída', with: 8.days.from_now

    click_on 'Fazer reserva'

    expect(page).to have_content 'Reserva efetuada com sucesso'
    expect(page).to have_content 'Contra da Rebase'
    expect(page).to have_content 5.days.from_now
    expect(page).to have_content 8.days.from_now
  end
end
