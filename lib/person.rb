class Person
  # Learn Approach
  # attr_accessor :name, :birthday, :hair_color, :eye_color, :height, 
  #               :weight, :handed, :complexion, :t_shirt_size, 
  #               :wrist_size, :glove_size, :pant_length, :pant_width
  # def initialize (attributes)
  #   attributes.each{|key, value| self.send("#{key}=", value)}
  # end
  def initialize(attributes)
    self.dynamic_attr(attributes)
  end

  def dynamic_attr(attributes)
    attributes.each do |attribute_key, attribute_value|
      # here we create in a dynamic way a the setter
      self.class.send(:define_method, "#{attribute_key}=") do |value|
        instance_variable_set("@#{attribute_key}", value)
      end
      # here we create in a dinamic way the getter
      self.class.send(:define_method, attribute_key) do
        instance_variable_get("@#{attribute_key}")
      end

      self.send("#{attribute_key}=", attribute_value)
    end
  end
end