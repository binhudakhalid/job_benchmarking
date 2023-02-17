## Job
System: Noctua 2
Node: 2 exclusively (because one-sided benchmark requiered only two mpi_ranks)
Total iteration: 262144
Maximum message size: 2097152


## Collective blocking
512 on 4 Node
| name          |  JobID|  status|
|---------------|-----------|-------|
|bcast| 2776237     ||    Done
|allreduce| 2776233  | |  Done
|scatter|  2776242|-> timeout start with 1 hr plus -> 2885003| Done


256 on 4 Node  with 20h

|allgather|  2776231 | seems like going to fail ->  2885006 | 2886555 (128)
|gather| 2776239 |time limit erorr -> 2885009| not enought memory ->2886553(128)
|alltoall| 2776234 -> 2885011 ||  -> taking alot time going to fail due to time  (ibwarn: [37189] _do_madrpc: recv failed: Connection timed out) -> 2886556 ->partial
|scatterv| 2776243|slurm-2776243.out -> timeout start with 1 hr plus ->  2885013| Inshallah -> done
|alltoallv|2776235 ->  2885018 || too slow decerease the itratio  -> 2886557 (128)(0.7iteration)


|reduce| 2776241  | error due to memory ->  2885025| -> memory error

-----------------------------------------------
|gatherv| 2776240 -> 2885026 ||  -> error
|allgatherv| 2776232 | memory ->  2885027 |   out of memory ->2886558  (128)(0.7iteration)















[khalids@n2login3 com_j_osu]$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           2885027    normal JuliaBen  khalids  R       1:34      4 n2cn[0405-0406,0410,0412]
           2885026    normal JuliaBen  khalids  R       3:07      4 n2cn[0401-0404]
           2885025    normal JuliaBen  khalids  R       4:31      4 n2cn[0787-0789,0792]
           2885018    normal JuliaBen  khalids  R      20:01      4 n2cn[0781-0784]
           2885013    normal JuliaBen  khalids  R      23:06      4 n2cn[0772-0773,0779-0780]
           2885011    normal JuliaBen  khalids  R      25:40      4 n2cn[0763,0767,0769,0771]
           2885009    normal JuliaBen  khalids  R      27:44      4 n2cn[0384-0385,0387-0388]
           2885006    normal JuliaBen  khalids  R      33:35      4 n2cn[0360,0369,0382-0383]
           2885003    normal JuliaBen  khalids  R      35:44      4 n2cn[1175-1176,1189-1190]
           2884989    normal JuliaBen  khalids  R      56:43      2 n2cn[0184-0185]
           2884988    normal JuliaBen  khalids  R      57:47      2 n2cn[0186,0192]
           2884984    normal JuliaBen  khalids  R    1:05:42      2 n2cn[0193,0195]


           2885027    normal JuliaBen  khalids  R   11:39:50      4 n2cn[0405-0406,0410,0412]
           2885018    normal JuliaBen  khalids  R   11:58:17      4 n2cn[0781-0784]
           2885013    normal JuliaBen  khalids  R   12:01:22      4 n2cn[0772-0773,0779-0780]
           2885011    normal JuliaBen  khalids  R   12:03:56      4 n2cn[0763,0767,0769,0771]
           2885009    normal JuliaBen  khalids  R   12:06:00      4 n2cn[0384-0385,0387-0388]
           2885006    normal JuliaBen  khalids  R   12:11:51      4 n2cn[0360,0369,0382-0383]
