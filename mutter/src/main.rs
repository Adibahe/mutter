use libp2p::{
    core::{muxing::StreamMuxerBox, Transport},
    futures::StreamExt,
    identity::{self, PublicKey},
    mdns::{self, tokio::Behaviour as MdnsBehaviour, Config as MdnsConfig},
    quic,
    swarm::{Config, NetworkBehaviour, SwarmEvent},
    Swarm,
};
use tokio::select;

const PROTOCOL_VERSION: (u8, u8, u8) = (1, 0, 0);

#[tokio::main]
async fn main() {
    let keypair = identity::Keypair::generate_ed25519();
    // prepare id for the swarm
    let id = libp2p::PeerId::from_public_key(&keypair.public());
    // prepare transport for the swarm
    //TODO: also prepare a tcp fallback if the quic connection fails
    let transport = {
        let quic_config = quic::Config::new(&keypair);
        let quic_transport = quic::tokio::Transport::new(quic_config);
        quic_transport
    };
    // prepare behaviour for the swarm
    let behaviour = MutterBehaviour {
        mdns: MdnsBehaviour::new(MdnsConfig::default(), id).unwrap(),
    };

    // Swarm contains the whole state of network where the most important bit is
    // *Behaviour* which dictates the behaviour of peer
    let mut swarm = Swarm::new(
        transport
            .map(|(id, conn), _| (id, StreamMuxerBox::new(conn)))
            .boxed(),
        behaviour,
        id,
        // prepare config for the swarm
        Config::with_tokio_executor(),
    );

    swarm
        .listen_on("/ip4/0.0.0.0/udp/0/quic-v1".parse().unwrap())
        .unwrap();

    println!("My peer ID is: {}", swarm.local_peer_id());

    loop {
        select! {
            event = swarm.select_next_some() => match event {
                SwarmEvent::Behaviour(MutterBehaviourEvent::Mdns(mdns::Event::Discovered(list))) => {
                    for (peer_id, _multiaddr) in list {
                        println!("mDNS discovered a new peer: {peer_id}");
                    }
                },
                SwarmEvent::Behaviour(MutterBehaviourEvent::Mdns(mdns::Event::Expired(list))) => {
                    for (peer_id, _multiaddr) in list {
                        println!("mDNS discover peer has expired: {peer_id}");
                    }
                },
                _ => {},
            }
        }
    }
}

#[derive(NetworkBehaviour)]
struct MutterBehaviour {
    // mDNS Will handle peer discovery
    mdns: MdnsBehaviour,
    // grouping will handle peer selection based on group name
    // grouping: Grouping,
}

//TODO: figure out which value should be here and not here.
struct MutterConfig {
    protocol_version: (u8, u8, u8),
    local_public_key: PublicKey,
    nickname: String,
    // This will of course require some extra fields depending on the situtation
}

impl MutterConfig {
    fn new(pub_key: PublicKey, nickname: String) -> Self {
        Self {
            protocol_version: PROTOCOL_VERSION,
            local_public_key: pub_key,
            nickname,
        }
    }
}

// First the connection is established and then group name is sent to
// the room's creator and if all is well the peer is added to `waiting room` of chat
enum Grouping {
    Create {
        group_name: String,
        //TODO: which Id will best identify a Peer
        peers: Vec<PeerId>,
        //TODO: which Id will best identify a Malicious Node it is not PeerId for sure
        malicious_nodes: Vec<PeerId>,
    },
    Join {
        group_name: String,
    },
}

enum GroupingRole {
    Create,
    Join,
}

impl Grouping {
    fn new(role: GroupingRole, group_name: Option<String>) -> Self {
        match (role, group_name) {
            (GroupingRole::Create, None) => Grouping::Create {
                group_name: generate_group_name(),
                peers: Vec::new(),
                malicious_nodes: Vec::new(),
            },
            (GroupingRole::Join, Some(group_name)) => Grouping::Join {
                group_name: group_name,
            },
            _ => unreachable!(),
        }
    }

    //TODO: maybe we make this more peer to peer like that is every peer does something
    // appropriate not just throwing errors if the role does not match

    // Can only be triggered by Creator
    fn listen_for_joins(&mut self) {
        // need to establish connecting with new peer over some channel and listen for group name
        if let Self::Create {
            group_name,
            peers,
            malicious_nodes,
        } = self
        {
            unimplemented!()
        } else {
        }
    }

    fn ask_for_waiting(&mut self) {
        // need to advertise to other peer which is hosting the room
    }
}

impl NetworkBehaviour for Grouping {
    type ConnectionHandler;

    type ToSwarm;

    fn handle_established_inbound_connection(
        &mut self,
        _connection_id: libp2p::swarm::ConnectionId,
        peer: PeerId,
        local_addr: &libp2p::Multiaddr,
        remote_addr: &libp2p::Multiaddr,
    ) -> Result<libp2p::swarm::THandler<Self>, libp2p::swarm::ConnectionDenied> {
        todo!()
    }

    fn handle_established_outbound_connection(
        &mut self,
        _connection_id: libp2p::swarm::ConnectionId,
        peer: PeerId,
        addr: &libp2p::Multiaddr,
        role_override: libp2p::core::Endpoint,
        port_use: libp2p::core::transport::PortUse,
    ) -> Result<libp2p::swarm::THandler<Self>, libp2p::swarm::ConnectionDenied> {
        todo!()
    }

    fn on_swarm_event(&mut self, event: libp2p::swarm::FromSwarm) {
        todo!()
    }

    fn on_connection_handler_event(
        &mut self,
        _peer_id: PeerId,
        _connection_id: libp2p::swarm::ConnectionId,
        _event: libp2p::swarm::THandlerOutEvent<Self>,
    ) {
        todo!()
    }

    fn poll(
        &mut self,
        cx: &mut std::task::Context<'_>,
    ) -> std::task::Poll<libp2p::swarm::ToSwarm<Self::ToSwarm, libp2p::swarm::THandlerInEvent<Self>>>
    {
        todo!()
    }
}

fn generate_group_name() -> String {
    unimplemented!("Generate a random phrase 2 or 3 words long ")
}
