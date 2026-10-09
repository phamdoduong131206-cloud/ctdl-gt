# NV3: BFS - Tim duong di ngan nhat tren do thi khong trong so
# MSSV: N24DCDT019
# Ho va ten: Pham Do Duong

function bfs(graph::Dict{Int, Vector{Int}}, source::Int)
    dist = Dict(v => -1 for v in keys(graph))
    parent = Dict(v => 0 for v in keys(graph))

    queue = Int[]
    push!(queue, source)
    dist[source] = 0

    head = 1
    while head <= length(queue)
        u = queue[head]
        head += 1

        for v in graph[u]
            if dist[v] == -1
                dist[v] = dist[u] + 1
                parent[v] = u
                push!(queue, v)
            end
        end
    end

    return dist, parent
end

function get_path(parent, source, target)
    path = Int[]
    current = target

    while current != 0
        pushfirst!(path, current)
        current == source && return path
        current = parent[current]
    end

    return Int[]
end

# Do thi theo de bai
graph = Dict(
    1 => [2, 3],
    2 => [1, 4],
    3 => [1, 4, 5],
    4 => [2, 3, 6],
    5 => [3, 6],
    6 => [4, 5]
)

source = 1
dist, parent = bfs(graph, source)

println("Khoang cach tu dinh ", source, ":")
for v in sort(collect(keys(graph)))
    println("Dinh ", v, ": ", dist[v])
end

println("\nDuong di ngan nhat tu ", source, " den cac dinh:")
for v in sort(collect(keys(graph)))
    path = get_path(parent, source, v)
    println("Den ", v, ": ", join(path, " -> "))
end
