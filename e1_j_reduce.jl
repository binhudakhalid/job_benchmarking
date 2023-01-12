using MPIBenchmarks
benchmark(OSUReduce(max_size=2097152,filename="e1_j_reduce.csv", iterations=262144))