class EmployeesController < ApplicationController

	def new
		@employee = Employee.new
	end
	
	def create
		@employee = Employee.new(employee_params)

		if @employee.save
			redirect_to @employee
		else
			render 'new'
		end
	end

	def show
		@employee = Employee.find(params[:id])
	end
	
	def index
		@employees = Employee.all
	end
	
	private
		def employee_params
			params.require(:employee).permit(:fullName, :mobileNumber)
		end
end
