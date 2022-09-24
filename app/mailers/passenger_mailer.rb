class PassengerMailer < ApplicationMailer
	default from: 'notifications@flightbooker.com'

	def confirmation_email
		@passenger = params[:passenger]
		@booking = params[:booking]
		mail(to: @passenger.email, subject: 'Flight Booking Confirmation')
	end
end
