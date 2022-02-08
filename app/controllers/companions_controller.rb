class CompanionsController < ApplicationController
  def create
    @companion = Companion.new(find_params)
    @companion.booking = Booking.find(params[:booking_id])

    if @companion.save
      #ya no permitir modificar y mantenerse en la misma pagina
    else
      #mostrar los errores
      redirect_to booking_path(params[:booking_id])
    end
  end

  private

  def find_params
    params.require(:companion).permit(
      :first_name,
      :last_name,
      :age,
      :document_number
    )
  end
end
