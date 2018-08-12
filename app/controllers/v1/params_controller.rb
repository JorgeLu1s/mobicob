class V1::ParamsController < ApplicationController

  def index
    @contractors = Contractor.all
    @delegations = Delegation.all
    @management_types = ManagementType.all
    @result_types = ResultType.all
    @anomaly_types = AnomalyType.all
    @roles = Role.all
  end
end
