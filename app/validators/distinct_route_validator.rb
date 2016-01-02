class DistinctRouteValidator < ActiveModel::Validator
  
  def validate(record)
    if record.origin.eql?(record.destination)
      record.errors.add :origin_id, 'must be different from the target'
    end
  end

end