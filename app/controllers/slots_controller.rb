class SlotsController < ApplicationController

	def index
		@slots = Slot.all
	end
end
