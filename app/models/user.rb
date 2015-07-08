class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :images
  validates_presence_of :username


  def timeRegistered
    time_elapsed = (Time.now - self.created_at).to_i
    if time_elapsed < 60
      time_unit = "seconds"
    elsif time_elapsed < 3600
      time_unit = "minutes"
      time_elapsed = (time_elapsed/60).to_i
    elsif time_elapsed < 86400
      time_unit = "hours"
      time_elapsed = (time_elapsed/3600).to_i
    else
      time_unit = "days"
      time_elapsed = (time_elapsed/86400).to_i
    end
    "#{time_elapsed} #{time_unit}"
  end

end
