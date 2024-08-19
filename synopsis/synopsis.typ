#align(center)[ 
= Mutter
= Peer-to-Peer Chat Application with Ephemeral Identities  
\
=== Synopsis submitted to \ Shri Ramdeobaba College of Engineering & Management, Nagpur \ in partial fulfillment of requirement for the award of the degree of

== Bachelor of Technology (B.Tech)
\
_*In*_
\
=== COMPUTER SCIENCE AND ENGINEERING  (Cyber Security)
\
*_By_*\ 
\
  Aditya Bahe  \
  Arnav Varhade \
  Himanshu Pawar \
  Umesh Babde \
  
_*Guide*_ \ \
  Prof. Firdous Sadaf Mohd Ismail \ \

#image("logo.jpeg", fit: "contain", height: 15%)


==== Department of Computer Science and Engineering -- Cyber Security \ Shri Ramdeobaba College of Engineering & Management, Nagpur 440 013

(An Autonomous Institute affiliated to Rashtrasant Tukdoji Maharaj \ Nagpur University Nagpur)

*August 2024*

]

#pagebreak()

#align(center)[
= Mutter
= Peer-to-Peer Chat Application with Ephemeral Identities 
\
]
#par(justify: true)[
=== Problem Defination:
Create a decentralized, peer-to-peer (p2p) chat application that prioritizes user privacy and anonymity. The application will leverage  cryptographic algorithms and modern p2p networking protocols to enable secure, pseudonymous messaging without relying on central server

\
=== Description:

In today's digital age, secure and private communication is essential.\
Contemporary messaging platform _own each and every user's identity and control all communications_, most of our communication is handled by _publically traded for-profit organizations_ who are willing to use every bit of information it can find about _user/product_ on and off the platform so that they can extract maximum profit which, they then use to
- crush or acquire competetion,
- lobby for less or no regulations,
- form secret alliances with other companies,
- sell data to other companies and governments without consent, etc
to make more money and which they then spend to reinforce their walled garden's strength all while degrading user experience, undermining society with endless stream of ads and spam and false news by making an black box algorithm in-charge of platform.\
We quite simply cannot rely on the for-profit companies whose sole objective is to monetize our every action on their platform in every way possible.\
\
 === Project Objective
+ Develop a P2P Messaging Application: Create a decentralized messaging platform that operates without a central server, ensuring communication directly between peers.
+ Ensure Ephemeral Identities: Implement mechanisms to assign temporary, pseudo-anonymous identities to users that last only for the duration of the session.
+ Automate Record Erasure: Design the application to automatically erase all records of messages and identities at the end of each session, ensuring no trace of communication remains.
+ Enhance Privacy and Security: Prioritize privacy and security features to protect users' identities and communication from being tracked or intercepted
\
// + To develop a Peer-to-Peer (P2P) messaging application that provides ephemeral and pseudo-anonymous identities to it users and aims to erase all the records of messages and identities after every session under every circumstances.
// + To demonstrate that P2P application can replace the current messaging platform for atleast some use cases (if not for all) as we have very powerful computers with reasonable network access.

#pagebreak()
== Proposed Plan of Work
// + Achieve connection between peers using _mDNS_ and join/create a _Room_ over a secure channel.
// + Layer _Messaging Layer Security_ over the created mesh network 
// + Create a protocol for _communication_ and _moderation_ among peers.//, setup _Gossipsub_ and prepare API for frontends. 
// + Make Terminal UI for testing and Web UI for final user.  
#image("Plan.png")

== Methodology
// add diagram
+ The connection will be bootstrapped with help of _libp2p_ which will use _mDNS_.
+ Each peer will be authenticated by _Topic Name_. Once the _Room_ is created that is each peers IP address is known, no new peer can be added.
+ Once _mesh_ network is established along peers then secure channel is establised with help of _OpenMLS_. 
+ And each participant will make sure that each of other peer is reachable by regularly pinging: 
  - If peers is not able to connect to not even a single other peer its session is terminated gracefully and all the records deleted for that peer.
  - The room will only be destroyed after the last peer disconnects
#image("methodology.png", fit: "contain") 


== Technology
+ Libp2p
+ mDNS
+ Messaging Layer Security @mls

== Functional Specification

==== Libp2p
Libp2p is open source networking stack which handles transport protocols, secure channels, stream multiplexers, peer discovery, messaging, NAT traversal, etc.
Libp2p is modular stack as this builds on top established infrastructure, protocols and standards. 
It is used on global scale distributed systems like IPFS, Ethereum, Filecoin, etc. 

==== mDNS
  - Peer Advertisement: Each node broadcasts its presence on the local network using mDNS.
  - Service Discovery: Nodes can discover other peers offering the same service on the local network.
  - Automatic Connection: Automatically connect to discovered peers to form a local network cluster.

==== Messaging Layer Security
  - Messaging Layer Security (MLS) is a security layer for end-to-end encrypting messages in arbitrarily sized groups. It is maintained by the MLS working group of the Internet Engineering Task Force to provide an efficient and practical security mechanism.
  - Security properties of MLS include message confidentiality, message integrity and authentication, membership authentication, asynchronicity, forward secrecy, post-compromise security, and scalability.


== Project Scope:
- Design and implementation of simple peer to peer messaging with ephemeral and pseudo anonymous identities by leveraging currently available protocols, algorithms and technology.
- Try to make guarantee records of each conversation is erased under all circumstances
- Secure the messages.

== Outside Project Scope:
  - High Fault Tolerance
  - Asynchronous Messaging
  - Feature parity relative to other platforms.

\ 
 
// to the research papers
// - #link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security]
#bibliography("ref.yml")
]
\
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
\ \ \
*Approved by:*
\ \ \
#grid(
  rows: 3cm,
  columns: 2,
  gutter: 1fr,
  [*Head of Department* #parbreak() *Cyber Security*],
  [*Guide* #v(0pt) Prof.Firdous Sadaf Mohd Ismail],
)

