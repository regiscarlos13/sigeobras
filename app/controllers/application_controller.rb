# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :set_current_user, if: :user_signed_in?

  def format_pdf(template1, pdf1)
    respond_to do |format|
      format.html
      format.pdf do
        render template: template1,
               pdf: pdf1,
               header: { html: { template: 'report/shared/header' } },
               footer: { html: { template: 'report/shared/footer' } },
               margin: { top: 40, bottom: 25, left: 15, right: 15 }
      end
    end
  end

  private

  def set_current_user
    Current.user = current_user
  end
end
