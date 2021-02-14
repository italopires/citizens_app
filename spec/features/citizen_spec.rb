require 'rails_helper'

RSpec.feature 'Citizens' do
  given(:user) { create(:user) }

  before { login_as user }

  scenario 'create, update and destroy a citizen', xhr: true do
    visit citizens_path

    click_link 'Munícipes'

    click_on 'Adicionar'
    fill_in Citizen.human_attribute_name('full_name'), with: 'Munícipe 1'
    fill_in Citizen.human_attribute_name('cpf'), with: '890.764.140-41'
    fill_in Citizen.human_attribute_name('email'), with: 'email@email.com'
    fill_in Citizen.human_attribute_name('birthdate'), with: I18n.l(Date.current.advance(months: -12))
    fill_in Citizen.human_attribute_name('phone'), with: '8632222222'
    page.execute_script('$(".datepicker-dropdown").css({left: 0});')
    click_button 'Salvar'

    expect(page).to have_content 'Munícipe adicionado(a) com sucesso.'
    expect(page).to have_content '890.764.140-41'
    expect(page).to have_content 'email@email.com'
    expect(page).to have_content I18n.l(Date.current.advance(months: -12))
    expect(page).to have_content '(86)32222222'
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

    accept_confirm do
      find('#destroy').click
    end

    expect(page).to have_content 'Munícipe removido(a) com sucesso.'
    expect(page).not_to have_content 'Munícipe 2'
    expect(page).not_to have_content 'email2@email.com'
  end
end