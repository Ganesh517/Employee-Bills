class EmployeesController < ApplicationController
    def index
      @employees = Employee.includes(:department).all
    end
  
    def show
      @employee = Employee.find(params[:id])
      @bills = @employee.bills
    end
  
    def new
      @employee = Employee.new
      @departments = Department.all
    end
  
    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to @employee, notice: 'Employee was successfully created.'
      else
        @departments = Department.all
        render :new
      end
    end
  
    def edit
      @employee = Employee.find(params[:id])
      @departments = Department.all
    end
  
    def update
      @employee = Employee.find(params[:id])
      if @employee.update(employee_params)
        redirect_to @employee, notice: 'Employee was successfully updated.'
      else
        @departments = Department.all
        render :edit
      end
    end
  
    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to employees_url, notice: 'Employee was successfully destroyed.'
    end
  
    private
  
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :designation, :department_id)
    end
  end
  