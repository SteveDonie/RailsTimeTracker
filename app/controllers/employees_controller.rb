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

	def update
		@employee = Employee.find(params[:id])

		if @employee.update(params[:employee].permit(:title, :text))
			redirect_to @employee
		else
			render 'edit'
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		
		redirect_to employees_path
	end
	
	def edit
		@employee = Employee.find(params[:id])
	end
	
	def show
		@employee = Employee.find(params[:id])
		respond_to do |format|
			format.html { render html: @employee }
			format.json { render json: @employee }
		end
	end
	
	def index
		@employees = Employee.all
		respond_to do |format|
			format.html { render html: @employees }
			format.json { render json: @employees }
		end
	end
	
	private
		def employee_params
			params.require(:employee).permit(:fullName, :mobileNumber)
		end
end
