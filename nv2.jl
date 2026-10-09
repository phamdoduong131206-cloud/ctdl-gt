struct Order
    id::Int
    destination::Int
    service::Int
    benefit::Int
end

# Tim don hang theo ID trong danh sach da sap xep tang dan theo ID
function binary_search(a::Vector{Order}, id::Int)
    left = 1
    right = length(a)

    while left <= right
        mid = div(left + right, 2)

        if a[mid].id == id
            return a[mid]
        elseif a[mid].id < id
            left = mid + 1
        else
            right = mid - 1
        end
    end

    return nothing
end

# Du lieu kiem thu
orders = [
    Order(1, 2, 1, 6),
    Order(2, 4, 1, 8),
    Order(3, 6, 1, 10)
]

id_can_tim = 2
result = binary_search(orders, id_can_tim)

if result === nothing
    println("Khong tim thay don hang ID = ", id_can_tim)
else
    println("Tim thay don hang:")
    println("ID: ", result.id)
    println("Diem den: ", result.destination)
    println("Thoi gian phuc vu: ", result.service)
    println("Loi ich: ", result.benefit)
end

# Kiem tra ID khong ton tai
id_can_tim = 5
result = binary_search(orders, id_can_tim)

if result === nothing
    println("Khong tim thay don hang ID = ", id_can_tim)
end
