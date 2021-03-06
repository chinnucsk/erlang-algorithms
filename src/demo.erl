-module(demo).
-compile(export_all).

-spec min_heaps() -> 'true'.
min_heaps() ->
  %% Creating a new min-heap
  H = heap:new(min),
  %% Checking if heap is empty
  true = heap:is_empty(H),
  %% Adding elements
  {6, _R1} = heap:insert(H, 6),
  {9, R2} = heap:insert(H, 9),
  {3, _R3} = heap:insert(H, 3),
  {12, _R4} = heap:insert(H, 12),
  %% Checking number of elements in the heap
  4 = heap:heap_size(H),
  %% Finding the minimum element (without removing it)
  3 = heap:min(H),
  4 = heap:heap_size(H),
  %% Removing the minimum element
  3 = heap:take_min(H),
  3 = heap:heap_size(H),
  %% Lowering the priority of an element
  true = heap:update(H, R2, 2),
  2 = heap:min(H),
  %% Increasing the priority of an element
  true = heap:update(H, R2, 20),
  6 = heap:min(H),
  %% Removing all the elements
  6 = heap:take_min(H),
  12 = heap:take_min(H),
  20 = heap:take_min(H),
  true = heap:is_empty(H),
  %% Delete the heap
  true = heap:delete(H),
  %% Construct heap from a list
  L = [{1,6},{2,9},{3,3},{4,12}],
  {H2, _R} = heap:from_list(min, L),
  true = heap:delete(H2),
  erlang:display('demo_ok').
  
-spec max_heaps() -> 'true'.
max_heaps() ->
  %% Creating a new max-heap
  H = heap:new(max),
  %% Checking if heap is empty
  true = heap:is_empty(H),
  %% Adding elements
  {6, _R1} = heap:insert(H, 6),
  {9, R2} = heap:insert(H, 9),
  {3, _R3} = heap:insert(H, 3),
  {12, _R4} = heap:insert(H, 12),
  %% Checking number of elements in the heap
  4 = heap:heap_size(H),
  %% Finding the maximum element (without removing it)
  12 = heap:max(H),
  4 = heap:heap_size(H),
  %% Removing the maximum element
  12 = heap:take_max(H),
  3 = heap:heap_size(H),
  %% Lowering the priority of an element
  true = heap:update(H, R2, 5),
  6 = heap:max(H),
  %% Increasing the priority of an element
  true = heap:update(H, R2, 20),
  20 = heap:max(H),
  %% Removing all the elements
  20 = heap:take_max(H),
  6 = heap:take_max(H),
  3 = heap:take_max(H),
  true = heap:is_empty(H),
  %% Delete the heap
  true = heap:delete(H),
  %% Construct heap from a list
  L = [{1,6},{2,9},{3,3},{4,12}],
  {H2, _R} = heap:from_list(max, L),
  true = heap:delete(H2),
  erlang:display('demo_ok').
  
-spec graph() -> 'true'.
graph() ->
  X = 0,
  {'ok', RootDir} = file:get_cwd(),
  File = RootDir ++ "/test_data/graph1.txt",
  G = graph:from_file(File),
  Dijkstra = dijkstra:run(G, X),
  BFS = bfs:run(G,X),
  DFS = dfs:run(G,X),
  Kruskal = kruskal:run(G),
  io:format("Dijkstra : ~p~n", [Dijkstra]),
  io:format("BFS : ~p~n", [BFS]),
  io:format("DFS : ~p~n", [DFS]),
  io:format("Kruskal : ~p~n", [Kruskal]),
  erlang:display('demo_ok').
  
-spec flow() -> 'true'.
flow() ->
  {'ok', RootDir} = file:get_cwd(),
  File = RootDir ++ "/test_data/graph3.txt",
  G = graph:from_file(File),
  Edmonds = edmonds_karp:run(G, 0, 5, 'bfs'),
  Ford = edmonds_karp:run(G, 0, 5, 'dfs'),
  io:format("Edmonds-Karp: ~p~n", [Edmonds]),
  io:format("Ford-Fulkerson: ~p~n", [Ford]),
  erlang:display('demo_ok').
  
-spec union_find() -> 'true'.
union_find() ->
  L = [a,b,c,d,e,f,g,h,i,j],
  F = union_find:singletons_from_list(L),
%%  union_find:pprint(F),
  10 = union_find:number_of_sets(F),
  'true' = union_find:union(F, a, e),
%%  union_find:pprint(F),
  'true' = union_find:union(F, a, d),
%%  union_find:pprint(F),
  'true' = union_find:union(F, g, i),
%%  union_find:pprint(F),
  'true' = union_find:union(F, h, f),
%%  union_find:pprint(F),
  6 = union_find:number_of_sets(F),
  [a,d,e] = lists:sort(union_find:set_elements(F, e)),
  g = union_find:find(F, i),
  3 = union_find:set_size(F, e),
  'true' = union_find:delete(F),
  erlang:display('demo_ok').
  
