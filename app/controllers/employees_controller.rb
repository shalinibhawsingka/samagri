class EmployeesController < ApplicationController
  def index
    @employees = Employee.paginate(page: params[:page], per_page: 5)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
        redirect_to employees_path, alert: "Employee created successfully."
    else
        redirect_to new_employee_path, alert: "Error creating employee."
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to(employees_path(@employee), flash: { success: 'Successfully Updated' })
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to employees_path
    else
      flash[:notice] = "Error deleting employee!"
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :status)
  end
end
