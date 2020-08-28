class UserDetails
  def initialize(name:, joined_at:, age:)
    @name = name
    @joined_at = joined_at
    @age = age
  end

  def to_s
    "Name: #{@name}\nJoined at: #{@joined_at.iso8601}\nAge: #{pretty_age}\n"
  end

  private

  def pretty_age
    return "#{@age} year old" if @age == 1
    "#{@age} years old"
  end
end

class ProviderAppClient
  def initialize(base_url = 'http://localhost:3000')
    @base_url = base_url
  end

  def get_user
    data = JSON.parse(Net::HTTP.get(URI("#{@base_url}/user")), symbolize_names: true)

    UserDetails.new(data[:user].merge(joined_at: Time.new(data[:user][:joined_at])))
  end
end