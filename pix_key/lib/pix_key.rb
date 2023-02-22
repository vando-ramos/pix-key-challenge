# frozen_string_literal: true

class PixKey
  def initialize(key)
    @key = key    
  end  

  def valid?
    if @key == []
      false
    elsif @key == {}
      false
    elsif @key == nil
      false
    elsif @key.kind_of? Numeric
      false    
    else 
      true
    end
  end

  def invalid?
    !valid?
  end

  def value
    if invalid?
      ''
    else
      @key.to_s
    end
  end  

  def key
    if @key.eql? @key
      @key
    end  
  end

  def to_s
    if @key.eql? value
      @key
    end
  end  

  def cpf?
    /^[0-9]{11}$/.match? @key
  end

  def cnpj?
    /^[0-9]{14}$/.match? @key    
  end

  def phone?
    /^\+[1-9][0-9]\d{1,14}$/.match? @key
  end

  def email?    
    /^[a-z0-9.!#$&'*+\/=?^_`{}~-]+@[a-z0-9]+(?:\.[a-z0-9]+?)+$/.match? @key
  end

  def evp?
    /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/.match? @key
  end  

  def type
    if cpf? 
      'cpf'
    elsif cnpj?
      'cnpj'
    elsif phone?
      'phone'
    elsif email?
      'email'
    elsif evp?
      'evp'
    end
  end
end
