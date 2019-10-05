class LicensePlateNumberValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /(^[ก-ฮ]{1,2}|^[1-9]{1}[ก-ฮ]{1,2})\s([1-9]{1,4})\s(.*)$/i
      object.errors[attribute] << (options[:message] || "must be a valid plate number format (1กก 1234)")
    end
  end
end