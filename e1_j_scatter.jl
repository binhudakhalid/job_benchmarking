using MPIBenchmarks
benchmark(OSUScatter(Int8;max_size=2097152,filename="e1_j_scatter.csv", iterations=262144))