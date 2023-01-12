using MPIBenchmarks
benchmark(OSUScatterv(Int8;max_size=2097152,filename="e1_j_scatterv.csv", iterations=262144))