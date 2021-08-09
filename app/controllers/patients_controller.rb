class PatientsController < ApplicationController
  def index
    @patients = Patient.desc_order
  end
end
