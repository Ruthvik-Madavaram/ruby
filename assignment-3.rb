subject_data = {"C++"=> 100,"Python"=>100,"JAVA"=> 100}

def extractKeys(data)
  data.keys
end

def extractValues(data)
  data.values
end

def deleteFromHash(data,key)
  data.delete(key)
  return data
end

puts extractKeys(subject_data)
puts extractValues(subject_data)
puts deleteFromHash(subject_data,"C++")