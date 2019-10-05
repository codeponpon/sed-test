class User < ActiveRecord::Base
  include ApiGuardian::Concerns::Models::User
  validates :name, :presence => true
  validates :phone_number, :presence => true
  validates :email, :presence => true
  before_create :set_default_role
  before_create :set_default_setting

  has_one :setting, dependent: :destroy
  accepts_nested_attributes_for :setting, allow_destroy: true
  before_save :generate_code

  def phone_number
    @phone_number ||= "+#{read_attribute(:phone_number)}".gsub('+66', '0').gsub('+','')
  end

  def set_default_setting
    build_setting(notification: true)
  end

  def set_default_role
    self.role = Role.get_default_role if self.role.eql?(nil)
  end

  def build_setting(param)
    self.setting = Setting.new(param)
  end

  def send_welcome_email_to_user
    UserMailer.welcome_email(self).deliver_later
  end

  def first_name
    self.name.split(' ').first
  end

  def last_name
    self.name.split(' ').last
  end

  def generate_code
    self.code = "C#{Date.today.year}#{Date.today.month}#{Date.today.day}#{Time.now.min}#{Time.now.sec}"
  end

  protected

  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(self)
  end
end
