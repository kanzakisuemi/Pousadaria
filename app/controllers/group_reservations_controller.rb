class GroupReservationsController < ApplicationController
  before_action :set_inn, only: %i[ create ]

  def new
    @group_reservation = GroupReservation.new
  end

  def create

  end

  private

  def set_inn
    @inn = current_inn_owner.inn if inn_owner_signed_in?
  end

  def group_reservation_params
  end
end
