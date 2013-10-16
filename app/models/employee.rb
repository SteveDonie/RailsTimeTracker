class Employee < ActiveRecord::Base
	validates :fullName, presence: true, uniqueness: { case_sensitive: false }
	validates :mobileNumber, presence: true, uniqueness: true
	validates_plausible_phone :mobileNumber

	phony_normalize :mobileNumber, :default_country_code => 'US'

	def as_json(options={})
	{
		:fullName => self.fullName,
		:mobileNumber => self.mobileNumber
	}
	end
end
