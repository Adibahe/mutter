#align(center)[ 
= Mutter \ A Secure Peer-to-Peer Chat Application with Ephemeral Identity
=== Synopsis submitted to 
== Shri Ramdeobaba College of Engineering & Management, Nagpur
=== in partial fulfillment of requirement for the award of the degree of
== Bachelor of Technology (B.Tech)
\
_*In*_
\
== COMPUTER SCIENCE AND ENGINEERING \ (Cyber Security) \
\
_*By*_\ 
  Aditya Bahe  \
  Arnav Varhade \
  Himanshu Pawar \
  Umesh Babde \ \
_*Guide*_ \ 
  Prof. Firdous Sadaf\
\
#image("logo.jpeg", fit: "contain", height: 15%)


==== Department of Computer Science and Engineering -- Cyber Security \ Shri Ramdeobaba College of Engineering & Management, Nagpur 440 013

(An Autonomous Institute affiliated to Rashtrasant Tukdoji Maharaj \ Nagpur University Nagpur)

*August 2024*

]

#pagebreak()

#align(center)[
= Mutter
= Secure Peer-to-Peer Chat Application with Ephemeral Identities 
]
\
#par(justify: true)[

//TODO; this seems like introduction
// rewrite this 
== Problem Definition:
\
In today's digital age, secure and private communication is essential.\
Contemporary messaging platform _own each and every user's identity and control all communications_, most of our communication is handled by _publically traded for-profit organizations_ who are willing to use every bit of information it can find about _user/product_ on and off the platform so that they can extract maximum profit which, they then use to
- crush or acquire competetion,
- lobby for less or no regulations,
- form secret alliances with other companies,
- sell data to other companies and governments without consent, etc
to make more money and which they then spend to reinforce their walled garden's strength all while degrading user experience, undermining society with endless stream of ads and spam and false news by making an black box algorithm in-charge of platform.\
We quite simply cannot rely on the for-profit companies whose sole objective is to monetize our every action on their platform in every way possible.\


== Project Objective
// spite this into 2 parts instead of one
+ To develop a Peer-to-Peer (P2P) messaging application that provides ephemeral and pseudo-anonymous identities to it users and aims to erase all the records of messages and identities after every session under every circumstances.
+ To demonstrate that P2P application can replace the current messaging platform for atleast some use cases (if not for all) as we have very powerful computers with reasonable network access.

== Proposed Plan of Work
+ Achieve connection between peers using _mDNS_ and join/create a _Room_ over a secure channel.
//  _Secure WebSockets_ as fallback in case _UDP_ is blocked. 
// _WebTranport_ or 
// or _KademliaDHT_ 
+ Layer _Messaging Layer Security_ over the created mesh network 
+ Create a protocol for _communication_ and _moderation_ among peers.//, setup _Gossipsub_ and prepare API for frontends. 
+ Make Terminal UI for testing and Web UI for final user.  
 

== Methodology
// add diagram
+ The connection will be bootstrapped with help of _libp2p_ which will use _mDNS_.
//or _AminoDHT_ depending on the conditions and will establish direct or relayed connection between peers.
+ Each peer will be authenticated by _Topic Name_. Once the _Room_ is created that is each peers IP address is known, no new peer can be added.
// + _PubSub_ channel is created over _WebTransport_ or as fallback _Secure Websockets_.
// + Group created which 
+ Once _mesh_ network is established along peers then secure channel is establised with help of _OpenMLS_. 
+ And each participant will make sure that each of other peer is reachable by regularly pinging: 
  - If peers is not able to connect to not even a single other peer its session is terminated gracefully and all the records deleted for that peer.
  - The room will only be destroyed after the last peer disconnects

== Technology
+ Libp2p
  // - Gossipsub
  // - KademliaDHT
+ mDNS
+ Messaging Layer Security
// - WebTransport / WebSockets
// - libSQL / sqlite3

== Functional Specification

==== Libp2p
Libp2p is open source networking stack which handles transport protocols, secure channels, stream multiplexers, peer discovery, messaging, NAT traversal, etc.
Libp2p is modular stack as this builds on top established infrastructure, protocols and standards. 
It is used on global scale distributed systems like IPFS, Ethereum, Filecoin, etc. 

// ==== Gossipsub
//   - Topic-based Subscription: Nodes can subscribe to specific topics of interest.
//   - Message Propagation: Messages are propagated through a network of nodes based on their subscriptions.
//   - Floodsub Compatibility: Ensure backward compatibility with the Floodsub protocol.
//   - Peer Scoring: Implement peer scoring to mitigate spam and Sybil attacks by evaluating peers based on their behavior.

// ==== KademliaDHT
//   - Purpose: To enable peer discovery and efficient retrieval of content in a distributed network.
//   - Routing Table: Maintain a routing table to store information about neighboring peers.
//   - Node Lookup: Allow nodes to find other peers by querying the network.
//   - Content Storage & Retrieval: Enable the storage of key-value pairs in the DHT and retrieval by querying the network.
//   - Iterative & Recursive Querying: Support both iterative and recursive querying mechanisms.

==== mDNS
  - Peer Advertisement: Each node broadcasts its presence on the local network using mDNS.
  - Service Discovery: Nodes can discover other peers offering the same service on the local network.
  - Automatic Connection: Automatically connect to discovered peers to form a local network cluster.

==== Messaging Layer Security
  - Messaging Layer Security (MLS) is a security layer for end-to-end encrypting messages in arbitrarily sized groups. It is maintained by the MLS working group of the Internet Engineering Task Force to provide an efficient and practical security mechanism.
  - Security properties of MLS include message confidentiality, message integrity and authentication, membership authentication, asynchronicity, forward secrecy, post-compromise security, and scalability.

// ====  WebTransport / WebSockets
//   - Bidirectional Communication: Enable real-time, bidirectional communication between peers.
//   - Transport Layer Agnostic: Implement a mechanism to switch between WebTransport and WebSockets based on availability and performance.
//   - Multiplexing: Support multiple streams of data over a single connection.
//   - Security: Ensure transport layer security (TLS) is used to protect data in transit.

// ==== Integration
//   - Interoperability: Ensure that all components (libp2p, mDNS, WebTransport/WebSockets) work seamlessly together.
//   - Scalability: The system should be able to scale from a few nodes to thousands, maintaining performance and reliability.
//   - Extensibility: The system should be modular, allowing for the easy addition of new protocols or components.

// ==== Documentation
//   - User Documentation: Provide clear and comprehensive documentation for users on how to set up, configure, and use the system.
//   - API Documentation: Provide detailed API documentation for developers integrating the system into their applications.

== Project Scope:
  - Design and implementation of simple peer to peer messaging with ephemeral and pseudo anonymous identities by leveraging currently available protocols, algorithms and technology.
  - Try to make guarantee records of each conversation is erased under all circumstances.
  - Secure messages.
  // - Moderation policies and mechanism.

== Outside the Project Scope:
  - High Fault Tolerance
  - Asynchronous Messaging
  - Feature parity relative to other platforms.

== Reference 
// to the research papers
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
\ 
*Approved by (with approval date):*

// #link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security] or 
// - #link("https://en.wikipedia.org/wiki/Messaging_Layer_Security")[Messaging Layer Security]
// - Firewall #link("https://en.wikipedia.org/wiki/Hole_punching_(networking)")[Holepunching]
