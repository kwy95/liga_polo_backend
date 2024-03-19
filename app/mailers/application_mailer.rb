# frozen_string_literal: true

# Mailer padrão da aplicação, gerado junto pelo comando de criação da aplicação
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
