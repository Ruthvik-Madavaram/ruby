def deleteOccurencesStartWithK(arr,k)
  arr.delete_if {|ele| ele.start_with?(k)}
end

x = ["tan", "caterpillar", "apple", "beaver"]
p deleteOccurencesStartWithK(x,"a")
p x

y = ["ten", "caterpillar", "apple", "beaver","tentacle"]
p deleteOccurencesStartWithK(y,"te")
p y