class Calc
  def initialize
    @nums = {:zero => '0', :one => '1', :two => '2', :three => '3', :four => '4', :five => '5', :six => '6', :seven => '7', :eight => '8', :nine => '9'}
    @oprs = {:plus => '+', :minus => '-', :times => '*', :divided_by => '/'}
    @op1, @opr = nil, nil
  end
  
  def method_missing(m)
    if @nums.include? m
      if @op1.nil?
        @op1 = @nums[m]
        return self
      else
        c = @op1 + @opr + @nums[m]
        @op1, @opr = nil, nil
        return eval c
      end
    elsif @oprs.include? m
      @opr = @oprs[m]
      return self
    end
  end
end
