module Front::ServicesHelper

  def get_service_class(random)
    case random
    when 2
      return 'dark'
    when 1
      return 'green'
    when 0
      return 'grey'
    end
  end
end
