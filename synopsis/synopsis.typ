#show link : underline

#align(center)[ 
= Mutter
= Secure, Ephemeral and Pseudo-Anonymous Peer to Peer Chat Application
\
*Synopsis submitted to \ Shri Ramdeobaba College of Engineering & Management, Nagpur in partial fulfillment of requirement for the award of the degree of*

= Bachelor of Technology (B.Tech)

In

= COMPUTER SCIENCE AND ENGINEERING \ (Cyber Security)

_*By*_\ 
  Aditya Rameshwar Bahe (28) \
  Arnav Dinesh Varhade (34)\
  Himanshu Hemraj Pawar (43)\
  Umesh Suresh Babde (65)\
_*Guide*_ \
  Prof. Firdous Sadaf\

#image("logo.jpeg", fit: "contain", height: 15%)


*Department of Computer Science and Engineering -- Cyber Security \ Shri Ramdeobaba College of Engineering & Management, Nagpur 440 013*

(An Autonomous Institute affiliated to Rashtrasant Tukdoji Maharaj \ Nagpur University Nagpur)

*August 2024*
]
#pagebreak(weak: false)

= Mutter
== Secure, Ephemeral and Pseudo-Anonymous Peer to Peer Chat Application

=== Problem Definition:

In today's digital age, secure and private communication is essential.\
Contemporary messaging platform _own each and every user's identity and control all communications_, most of our communication is handled by _publically traded for-profit organizations_ who are willing to use every bit of information it can find about _user/product_ on and off the platform so that they can extract maximum profit which, they then use to
+ crush or acquire upstarts,
+ lobby for less or no regulations,
+ form secret alliances with other companies,
+ sell data to other company and governments without consent, etc
to make more money and which they then spend to reinforce their walled garden's strength all while degrading user experience, undermining society with endless stream of ads and spam and false news by making an black box algorithm in-charge of platform.\
We quite simply cannot rely on the for-profit companies whose sole objective is to monetize our every action on their platform in every way possible.\

=== Project Objective

+ To develop a Peer-to-Peer (P2P) messaging application that provides ephemeral and pseudo-anonymous identities to it users and aims to erase all the records of messages and identities after every session under every circumstances.
+ To demonstrate that P2P application can be replace the current messaging platform for atleast some use cases (if not for all) as we have very powerful computers with reasonable network access.

=== Proposed Plan of Work
*_WIP_*

=== Methodology

+ The connection will be bootstrapped with help of _libp2p_ which will use _mDNS_ or _kDHT_ depending on the conditions and will establish direct or relayed connection between peers.
+ Each peer will be authenticated by _Topic Name_. Once the _Room_ is created that is each peers IP address is known, no new peer can be added.
+ _PubSub_ channel is created over _WebTransport_ or as fallback _Secure Websockets_.
// #link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security] or 
+ And each participant will make sure that each of other peer is reachable by regularly pinging: 
  - If peers is not able to connect to not even a single other peer its session is terminated gracefully and all the records deleted for that peer.
  - The room will only be destroyed after the last peer disconnects

=== Technology
- Libp2p
  - Gossipsub
  - KademliaDHT
- mDNS
- WebTransport / WebSockets

=== Functional Specification
*_WIP_*

=== Project Scope:
  - Design and implementation of simple peer to peer messaging with ephemeral and (pseudo)anonymous identities by leveraging currently available protocols, algorithms and technology.
  - Try to make guarantee records of each conversation is erased under all circumstances
  - Secure the messages.
  //   - #link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security]

=== Outside the Project Scope:
  - High Fault Tolerance
  - Asynchronous Messaging
  - Feature parity relative to other platforms.
  // - Moderation with help of Consensus mechanism
  // - Firewall #link("https://en.wikipedia.org/wiki/Hole_punching_(networking)")[Holepunching]

\ \

#table(  
  columns: (1fr, 4fr, 4fr),
  table.header(
    [*Roll No.*], [*Name of Students*], [*Name of Guide*]
  ),
  align: center,

  [28], [Aditya Rameshwar Bahe], 
  table.cell(
    [Firdous Sadaf],
    rowspan: 4,
    align: horizon,
  ),
  [34], [Arnav Dinesh Varhade],
  [43], [Himanshu Hemraj Pawar],
  [65], [Umesh Suresh Babde],
)
\ 
*Approved by (with approval date):*
