## Job
System: Noctua 2
Node: 2 exclusively (because one-sided benchmark requiered only two mpi_ranks)
Total iteration: 262144
Maximum message size: 2097152

| name          |  JobID| status |
|---------------|-------|--------|   
|get with lock  | 2776249| completed| Done
|get with fence | 2776252| completed| Done
|put with lock |  2776277| completed| Done
|put with fence |  2776278|completed|  Done
|get_accumulate with lock|2884984| completed| Done
|get_accumulate with fence |2884988| completed| Done
|accumulate with lock | 2884989| completed| Done
|accumulate with fence |2776284| completed| Done
-----------------------------------------------



|get_accumulate with lock| 2776291 ->  28828849844984|waiting|  Done  -> slurm-2884984.out
|get_accumulate with fence |2776290 ->   2884988 20h|waiting|  Done  ->  slurm-2884988.out




|accumulate with lock |2776285 ->        2884989 20h|waiting| error time limit | Done
|accumulate with fence |2776284->2776310|2776284 error due to job time limit, |  Done


5 completed
3 remaining
=======
|get_accumulate with fence |2776290 -> 2884983|waiting| error time -> 2886516
|accumulate with lock |2776285 ->  2884977 8h|waiting| error time limit 
|accumulate with fence |2776284->2776310|2776284 error due to job time limit, |  Done



2886516 normal    hpc-prf-mpibj nocont khalids 125013   RUNNING 21:00:00   0:52     2     256  2     240000M    cpu=256,mem=480000M,node=2,billing=256 (null)   2023-02-02T23:18:38 0            /scratch/hpc-prf-mpibj/com_j_osu/onesided JuliaBenchMark
[khalids@n2login5 onesided]$
>>>>>>> a2252c8c338fc0dfeccaa1860e58e4cea9f0a641
