# NV4: Quy hoach dong - Bai toan cai tui 0/1
# MSSV: N24DCDT019
# Ho va ten: Pham Do Duong

function knapsack(orders, B)
    n = length(orders)

    # dp[i+1, b+1]: loi ich lon nhat khi xet i don hang,
    # voi suc chua toi da b
    dp = zeros(Int, n + 1, B + 1)

    for i in 1:n
        cost = orders[i].cost
        benefit = orders[i].benefit

        for b in 0:B
            dp[i + 1, b + 1] = dp[i, b + 1]

            if cost <= b
                dp[i + 1, b + 1] = max(
                    dp[i + 1, b + 1],
                    dp[i, b - cost + 1] + benefit
                )
            end
        end
    end

    # Truy vet cac don hang duoc chon
    selected = Int[]
    b = B

    for i in n:-1:1
        if dp[i + 1, b + 1] != dp[i, b + 1]
            push!(selected, orders[i].id)
            b -= orders[i].cost
        end
    end

    reverse!(selected)

    total_cost = sum(o.cost for o in orders if o.id in selected)
    total_benefit = dp[n + 1, B + 1]

    return selected, total_cost, total_benefit, dp
end

# Du lieu don hang theo de bai
struct Order
    id::Int
    cost::Int
    benefit::Int
end

orders = [
    Order(1, 3, 6),
    Order(2, 5, 8),
    Order(3, 7, 10)
]

B = 8
selected, total_cost, total_benefit, dp = knapsack(orders, B)

println("Suc chua toi da B = ", B)
println("ID don hang duoc chon: ", selected)
println("Tong chi phi: ", total_cost)
println("Tong loi ich: ", total_benefit)
println("Gia tri toi uu DP: ", dp[end, end])
