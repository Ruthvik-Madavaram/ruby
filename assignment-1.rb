def deleteOccurencesOfK(arr,k)
  arr.delete_if {|ele| ele == k}
end

x = ["tan", "caterpillar", "apple", "beaver"]
p deleteOccurencesOfK(x,"apple")
p x
y = ["tan", "caterpillar", "apple", "beaver"]
p deleteOccurencesOfK(x,"cat")
p y