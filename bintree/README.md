# bintree

## graph

```
graph TD
1-->2
1-->3
2-->4
2-->5
3-->6
3-->7
4-->8
4-->9
5-->10
```

## bintree search in bash

1. Start from root (index=1)
2. On each node, print it's index
3. Goes down left, then right
4. Repeat from step 2, until MAX

```
[haili@ bin]$ bintree
1 2 4 8 9 5 10 3 6 7 
[haili@ bin]$ 
[haili@ bin]$ bintree 23
1 2 4 8 16 17 9 18 19 5 10 20 21 11 22 23 3 6 12 13 7 14 15 
```

## use bintree to walk through all nodes on a cluster

1. Load hosts from`$hostfile`, and count
2. Start from 1 (ie. root), remote execute on left then right, calling itself repeatedly
3. Execute `$cmd` itself
4. Exit when all returns. Or exit first, when remote side excuting in backgroud

```
[haili@ bin]$ allhost 
To run 'hostname', load 8 hosts: node1 node2 node3 node4 node5 node6 node7 node8
comput8
comput4
comput5
comput2
comput6
comput7
comput3
comput1
[haili@ bin]$ 
[haili@ bin]$ allhost uptime
To run 'uptime', load 8 hosts: node1 node2 node3 node4 node5 node6 node7 node8
 13:21:41 up 6 days, 15:05,  0 users,  load average: 0.03, 0.02, 0.05
 13:21:41 up 6 days, 15:04,  0 users,  load average: 0.00, 0.01, 0.05
 13:21:41 up 6 days, 15:04,  0 users,  load average: 0.00, 0.01, 0.05
 13:21:41 up 6 days, 15:04,  0 users,  load average: 0.00, 0.01, 0.05
 13:21:42 up 6 days, 15:05,  0 users,  load average: 0.00, 0.01, 0.05
 13:21:42 up 6 days, 15:03,  0 users,  load average: 0.00, 0.01, 0.05
 13:21:42 up 8 days, 20:22,  0 users,  load average: 0.00, 0.02, 0.05
 13:21:42 up 8 days,  2:39,  5 users,  load average: 0.98, 0.92, 0.60
```
