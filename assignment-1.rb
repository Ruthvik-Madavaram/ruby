def deleteOccurencesOfK(arr,k)
  arr.delete_if {|ele| ele == k}
end

x = ["tan", "caterpillar", "apple", "beaver"]
p deleteOccurencesOfK(x,"apple")

y = ["tan", "caterpillar", "apple", "beaver"]
p deleteOccurencesOfK(y,"cat")
