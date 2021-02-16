class CitizenMailer < ApplicationMailer
  def new_citizen(citizen)
    @citizen = citizen
    mail(to: [@citizen.email], subject: "Cidadão Cadastrado - OM30")
  end

  def update_citizen_status(citizen)
    @citizen = citizen
    mail(to: [@citizen.email], subject: "Alteração de Status do Munícipe - OM30")
  end

  def update_citizen(citizen)
    @citizen = citizen
    mail(to: [@citizen.email], subject: "Alteração de Status do Munícipe - OM30")
  end
end
