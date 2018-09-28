using Test

using DataAndPlotting

arr = initialize()
rm("/tmp/array.h5")
output(arr, "/tmp/array.h5")
# for Windows: output(arr, "/temp/array.h5")

arr2 = input("/tmp/array.h5")

@test isequal(arr2, arr)
