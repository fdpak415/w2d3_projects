class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    0.upto(self.length-2).each do |i|
      (i+1).upto(self.length-1).each do |j|
    
        result << [i,j] if self[i] + self[j] == 0
      end
    end
    result
  end

  def my_transpose
    result = []
    l = self.length - 1
    0.upto(l).each do |i|
      sub_arr = []
      self.each do |row|
        sub_arr << row[i]
      end
      result << sub_arr
    end
    result
  end


end

def stock_picker(arr)
  biggest_diff = 0
  best_days = []
  0.upto(arr.length-2).each do |i|
    (i+1).upto(arr.length-1).each do |j|
      if arr[i] - arr[j] < biggest_diff
        biggest_diff = arr[i] - arr[j]
        best_days = [i, j]
      end
    end
  end
  best_days

end
