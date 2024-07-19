class BillsController < ApplicationController
    before_action :set_employee, only: [:index, :new, :create]
  
    def index
      @bills = @employee.bills
    end
  
    def new
      @bill = @employee.bills.build
    end
  
    def create
      @bill = @employee.bills.build(bill_params)
      if @bill.save
        redirect_to employee_bills_path(@employee), notice: 'Bill was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_employee
      @employee = Employee.find(params[:employee_id])
    end
  
    def bill_params
      params.require(:bill).permit(:amount, :bill_type)
    end
  end
  