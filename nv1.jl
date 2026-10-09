# NV1: Merge Sort
# MSSV: N24DCDT019
# Ho va ten: Pham Do Duong

function merge_sort(a::Vector{Int}, before = (x, y) -> x <= y)
    n = length(a)
    n <= 1 && return copy(a)

    mid = div(n, 2)
    left = merge_sort(a[1:mid], before)
    right = merge_sort(a[mid+1:end], before)

    result = Int[]
    i = 1
    j = 1

    while i <= length(left) && j <= length(right)
        if before(left[i], right[j])
            push!(result, left[i])
            i += 1
        else
            push!(result, right[j])
            j += 1
        end
    end

    append!(result, left[i:end])
    append!(result, right[j:end])

    return result
end

# Kiem tra
a = [5, 2, 8, 1, 3, 7, 4, 6]
println("Mang ban dau: ", a)
println("Tang dan:     ", merge_sort(a))
println("Giam dan:     ", merge_sort(a, (x, y) -> x >= y))
