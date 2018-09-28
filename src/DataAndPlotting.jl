module DataAndPlotting

using HDF5



# Wave parameters
const ki = 3
const kj = 3

# Grid size
const ni = 30
const nj = 20

# i ranges from 1...ni
# i-1 ranges from 0...ni-1
# x ranges from 0...1
function index2coord(i, ni)
    @assert ni > 1
    @assert 1 <= i <= ni
    (i - 1) / (ni - 1)
end



# Set up standing wave
export initialize
function initialize()
    arr = zeros(Float64, ni, nj)
    for j in 1:nj, i in 1:ni
        x = index2coord(i, ni)
        y = index2coord(j, nj)
        arr[i,j] = sin(2π*ki*x) * sin(2π*kj*y)
    end
    arr
end



# Write data to file
export output
function output(arr::Array{Float64, 2}, filename::String)
    h5write(filename, "data", arr)
end



# Read data from file
export input
function input(filename::String)
    arr = h5read(filename, "data") # , (1:ni, 1:nj))
end

end
