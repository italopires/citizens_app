require 'rails_helper'

RSpec.feature 'Citizens' do
  given(:user) { create(:user) }
  given!(:state1) { create(:state, name: 'State1') }
  given!(:state2) { create(:state, name: 'State2') }
  given!(:city1) { create(:city, name: 'City1', state: state1) }
  given!(:city2) { create(:city, name: 'City2', state: state1) }
  given!(:city3) { create(:city, name: 'City3', state: state2) }

  before { login_as user }

  scenario 'create, update, destroy and search a citizen' do
    visit citizens_path

    click_link 'Munícipes'

    click_on 'Adicionar'
    fill_in Citizen.human_attribute_name('full_name'), with: 'Munícipe 1'
    fill_in Citizen.human_attribute_name('cpf'), with: '890.764.140-41'
    fill_in Citizen.human_attribute_name('email'), with: 'email@email.com'
    fill_in Citizen.human_attribute_name('birthdate'), with: I18n.l(Date.current.advance(months: -12))
    page.execute_script('$(".datepicker-dropdown").css({left: 0});')
    fill_in Citizen.human_attribute_name('phone'), with: '8633333333'
    attach_file Citizen.human_attribute_name('picture_file'), "#{Rails.root}/spec/fixtures/om30.png"
    select state1.name, from: Address.human_attribute_name('state_id')
    select city2.name, from: Address.human_attribute_name('city_id')
    fill_in Address.human_attribute_name('zipcode'), with: '64000000'
    fill_in Address.human_attribute_name('district'), with: 'district_1'
    fill_in Address.human_attribute_name('public_place'), with: 'public_place1'
    fill_in Address.human_attribute_name('complement'), with: 'complement1'
    fill_in Address.human_attribute_name('ibge_code'), with: '123456'

    click_button 'Salvar'

    expect(page).to have_content 'Munícipe adicionado(a) com sucesso.'
    expect(page).to have_content '890.764.140-41'
    expect(page).to have_content 'email@email.com'
    expect(page).to have_content I18n.l(Date.current.advance(months: -12))
    expect(page).to have_content '(86)33333333'
    find('#edit').click

    fill_in Citizen.human_attribute_name('full_name'), with: 'Munícipe 2'
    fill_in Citizen.human_attribute_name('email'), with: 'email2@email.com'
    fill_in Citizen.human_attribute_name('birthdate'), with: ''
    fill_in Citizen.human_attribute_name('birthdate'), with: I18n.l(Date.current.advance(months: -24))
    page.execute_script('$(".datepicker-dropdown").css({left: 0});')
    click_button 'Salvar'

    expect(page).to have_content 'Munícipe atualizado(a) com sucesso.'
    expect(page).to have_content 'Munícipe 2'
    expect(page).to have_content 'email2@email.com'
    expect(page).to have_content I18n.l(Date.current.advance(months: -24))

    fill_in Citizen.human_attribute_name('birthdate'), with: I18n.l(Date.current.advance(months: -24))
    click_button 'Pesquisar'
    expect(page).to have_content 'Munícipe 2'

    fill_in Citizen.human_attribute_name('birthdate'), with: I18n.l(Date.current.advance(months: -1))
    click_button 'Pesquisar'
    expect(page).not_to have_content 'Munícipe 2'

    fill_in Citizen.human_attribute_name('birthdate'), with: ''
    click_button 'Pesquisar'

    accept_confirm { find('#destroy').click }

    expect(page).to have_content 'Munícipe removido(a) com sucesso.'
    expect(page).not_to have_content 'Munícipe 2'
    expect(page).not_to have_content 'email2@email.com'
  end
end