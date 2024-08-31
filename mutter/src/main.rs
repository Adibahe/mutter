use libp2p::{
    core::{muxing::StreamMuxerBox, Transport},
    identity::{self, PublicKey},
    mdns::{tokio::Behaviour as MdnsBehaviour, Config as MdnsConfig},
    quic,
    swarm::{Config, NetworkBehaviour},
    Swarm,
};

#[tokio::main]
async fn main() {
    let keypair = identity::Keypair::generate_ed25519();
    // prepare id for the swarm
    let id = libp2p::PeerId::from_public_key(&keypair.public());
    // prepare transport for the swarm
    let transport = {
        let quic_config = quic::Config::new(&keypair);
        let quic_transport = quic::tokio::Transport::new(quic_config);
        quic_transport
    };
    // prepare behaviour for the swarm
    let behaviour = MutterBehaviour {
        mdns: MdnsBehaviour::new(MdnsConfig::default(), id).unwrap(),
    };

    let swarm = Swarm::new(
        transport
            .map(|(id, conn), _| (id, StreamMuxerBox::new(conn)))
            .boxed(),
        behaviour,
        id,
        // prepare config for the swarm
        Config::with_tokio_executor(),
    );
}

const PROTOCOL_VERSION: (u8, u8, u8) = (1, 0, 0);

struct MutterConfig {
    protocol_version: (u8, u8, u8),
    local_public_key: PublicKey,
    // This will of course require some extra fields depending on the situtation
}

impl MutterConfig {
    fn new(pub_key: PublicKey) -> Self {
        Self {
            protocol_version: PROTOCOL_VERSION,
            local_public_key: pub_key,
        }
    }
}

#[derive(NetworkBehaviour)]
struct MutterBehaviour {
    mdns: MdnsBehaviour,
}
