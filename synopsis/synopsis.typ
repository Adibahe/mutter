#align(center)[ 
= Mutter
= Peer-to-Peer Chat Application with Ephemeral Identities  
\
==== Synopsis submitted to \ Shri Ramdeobaba College of Engineering & Management, Nagpur \ in partial fulfillment of requirement for the award of the degree of

== Bachelor of Technology (B.Tech)
\
_*In*_
\
=== COMPUTER SCIENCE AND ENGINEERING  (Cyber Security)
\
*_By_*\ 
\
  Mr. Aditya Bahe  \
  Mr. Arnav Varhade \
  Mr. Himanshu Pawar \
  Mr. Umesh Babde \
  
_*Guide*_ \ \
  Prof. Firdous Sadaf Mohd Ismail \ \

#image("logo.jpeg", fit: "contain", height: 15%)


==== Department of Computer Science and Engineering -- Cyber Security \ Shri Ramdeobaba College of Engineering & Management, Nagpur 440 013

(An Autonomous Institute affiliated to Rashtrasant Tukdoji Maharaj \ Nagpur University Nagpur)

*August 2024*

]

#pagebreak()

= Mutter
= Peer-to-Peer Chat Application with Ephemeral Identities 
\

=== Problem Defination:
Create a decentralized, peer-to-peer (p2p) chat application that prioritizes user privacy and anonymity. The application will leverage  cryptographic algorithms and modern p2p networking protocols to enable secure, pseudonymous messaging without relying on central server

\
=== Description:

In today's digital age, secure and private communication is essential.\
Contemporary messaging platform _own each and every user's identity and control all communications_, most of our communication is handled by _publically traded for-profit organizations_ who are willing to use every bit of information it can find about _user/product_ on and off the platform so that they can extract maximum profit which, they then use to
+ crush or acquire upstarts,
+ lobby for less or no regulations,
+ form secret alliances with other companies,
+ sell data to other company and governments without consent, etc
to make more money and which they then spend to reinforce their walled garden's strength all while degrading user experience, undermining society with endless stream of ads and spam and false news by making an black box algorithm in-charge of platform.\
We quite simply cannot rely on the for-profit companies whose sole objective is to monetize our every action on their platform in every way possible.\
\
=== Project Objective

+ Develop a P2P Messaging Application: Create a decentralized messaging platform that operates without a central server, ensuring communication directly between peers.

+ Ensure Ephemeral Identities: Implement mechanisms to assign temporary, pseudo-anonymous identities to users that last only for the duration of the session.

+ Automate Record Erasure: Design the application to automatically erase all records of messages and identities at the end of each session, ensuring no trace of communication remains.

+ Enhance Privacy and Security: Prioritize privacy and security features to protect users' identities and communication from being tracked or intercepted
\
\

=== Proposed Plan of Work
+ Achieve connection between peers using _mDNS_ or _KademliaDHT_ and join/create a _Room_ over a secure channel _WebTranport_ or _Secure WebSockets_ as fallback in case _UDP_ is blocked. 
+ Create a protocol for _communication_ and _moderation_ among peers, setup _Gossipsub_ and prepare API for frontends. 
+ Make Terminal UI for testing and Web UI for final user.  
 
\
=== Methodology

+ The connection will be bootstrapped with help of _libp2p_ which will use _mDNS_ or _kDHT_ depending on the conditions and will establish direct or relayed connection between peers.
+ Each peer will be authenticated by _Topic Name_. Once the _Room_ is created that is each peers IP address is known, no new peer can be added.
+ _PubSub_ channel is created over _WebTransport_ or as fallback _Secure Websockets_.
+ And each participant will make sure that each of other peer is reachable by regularly pinging: 
  - If peers is not able to connect to not even a single other peer its session is terminated gracefully and all the records deleted for that peer.
  - The room will only be destroyed after the last peer disconnects
\

=== Technology
- Libp2p
  - Gossipsub
  - KademliaDHT
- mDNS
- WebTransport / WebSockets
// - libSQL
\
=== Functional Specification
+ Gossipsub
  - Topic-based Subscription: Nodes can subscribe to specific topics of interest.
  - Message Propagation: Messages are propagated through a network of nodes based on their subscriptions.
  - Floodsub Compatibility: Ensure backward compatibility with the Floodsub protocol.
  - Peer Scoring: Implement peer scoring to mitigate spam and Sybil attacks by evaluating peers based on their behavior.
+ KademliaDHT
  - Purpose:
    To enable peer discovery and efficient retrieval of content in a distributed network.

  - Routing Table: Maintain a routing table to store information about neighboring peers.
  - Node Lookup: Allow nodes to find other peers by querying the network.
  - Content Storage & Retrieval: Enable the storage of key-value pairs in the DHT and retrieval by querying the network.
  - Iterative & Recursive Querying: Support both iterative and recursive querying mechanisms.

+ mDNS
  - Peer Advertisement: Each node broadcasts its presence on the local network using mDNS.
  - Service Discovery: Nodes can discover other peers offering the same service on the local network.
  - Automatic Connection: Automatically connect to discovered peers to form a local network cluster.

+  WebTransport / WebSockets
  - Bidirectional Communication: Enable real-time, bidirectional communication between peers.
  - Transport Layer Agnostic: Implement a mechanism to switch between WebTransport and WebSockets based on availability and performance.
  - Multiplexing: Support multiple streams of data over a single connection.
  - Security: Ensure transport layer security (TLS) is used to protect data in transit.

+ Integration
  - Interoperability:
    Ensure that all components (libp2p, mDNS, WebTransport/WebSockets) work seamlessly together.

  - Scalability:
    The system should be able to scale from a few nodes to thousands, maintaining performance and reliability.

  - Extensibility:
    The system should be modular, allowing for the easy addition of new protocols or components.

+ Documentation
  - User Documentation:
    Provide clear and comprehensive documentation for users on how to set up, configure, and use the system.

  - API Documentation:
    Provide detailed API documentation for developers integrating the system into their applications.
\
==== Libp2p
Libp2p is open source networking stack which handles transport protocols, secure channels, stream multiplexers, peer discovery, messaging, NAT traversal, etc.
Libp2p is modular stack as this builds on top established infrastructure, protocols and standards. It powers many global scale distributed systems like IPFS, Ethereum, Filecoin, etc. 
\
\
=== Project Scope:
  - Design and implementation of simple peer to peer messaging with ephemeral and pseudo anonymous identities by leveraging currently available protocols, algorithms and technology.
  - Try to make guarantee records of each conversation is erased under all circumstances
  // - Secure the messages.
  - Moderation policies and mechanism.\
  \

=== Outside the Project Scope:
  - High Fault Tolerance
  - Asynchronous Messaging
  - Feature parity relative to other platforms.

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

//#link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security] or 
//   - #link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security]
// - Firewall #link("https://en.wikipedia.org/wiki/Hole_punching_(networking)")[Holepunching]
