# Mutter 

Mutter uses *mDNS* to *discover peers* in the same network, which is provided by *libp2p* 

And next the part is ***Grouping*** that is creating group using randomly
generated *group names* and *peer* who want to join are expected to know
the *group name*.  

A custom protocol is created for this purpose where the peer who want to 
join sends the name of group to the peer who created the group.
+ *Creator* will generate the group name and tell peer *out-of-band*
+ Peer who want to join will look for peers who are hosting group 
+ After finding a *creator* it will repeat the group name and if it matches that it 
OR you can take it a step further if paranoid
+ tell a small number to *creator* *out-of-band* as in bluetooth
+ Once the creator enters the number the peer is added in the group

## Use Cases

It can be used to create a network for brief realtime converstion over existing LAN network,
where users dont have to worry about any of the shenanigans of conventional networks like login/signin, picking and saving unique user names and passwords, reading and accepting term and conditions, worry about the data you left behind while your brief conversation. 

## Technology

1. Libp2p: swiss army knife library to create P2P networks
2. mDNS (provided by libp2p): to discovery active peers in the network
3. OpenMLS: most popular implementation of Messaging Layer Security
4. Redb/sqlite: embedded database
