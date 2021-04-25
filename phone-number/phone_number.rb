# frozen_string_literal: true

class PhoneNumber
  def self.clean(string_in)
    cleaned = string_in.gsub(/[^0-9]/, '')
    country = add_country(cleaned)
    phone   = cleaned.split(//).last(10).join
    return phone if valid_phone?(phone, country)
  end

  def self.valid_phone?(phone, country)
    bad_codes = %w[1 0]
    if phone.length == 10
      result = phone[0] != '1' && phone[0] != '0' && phone[3] != '0' && phone[3] != '1'
    else
      result = false
    end
    result = false if country != '1'
    result
  end

  def self.add_country(numstring)
    code = '1'
    code = numstring[0] if numstring.length == 11
    code
  end
end
