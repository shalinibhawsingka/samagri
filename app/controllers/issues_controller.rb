class IssuesController < ApplicationController
  def index
    @issues = Issue.paginate(page: params[:page], per_page: 5)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
        redirect_to issues_path, alert: "User created successfully."
    else
        redirect_to new_issue_path, alert: "Error creating issue."
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      if @issue.status==true
        UsersMailer.with(issue: @issue).Update(@issue).deliver_now
      end
      redirect_to(issues_path(@issue), flash: { success: 'Successfully Updated' })
    else
      render 'edit'
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    if @issue.destroy
      flash[:notice] = "Successfully deleted!"
      redirect_to issues_path
    else
      flash[:notice] = "Error deleting issue!"
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:details, :item_id, :user_id, :status)
  end
end
