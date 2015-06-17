module MessagesHelper
  
  def self.add_param(_parameters)
    strBuilder = "?"
    _parameters.each_with_index do |_param,index|
      strBuilder+= "param"+ (index+1).to_s + "=" + _param.to_s + "&"
    end
    strBuilder
  end
  
end
