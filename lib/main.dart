import 'package:flutter/material.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/common/iden3_message_entity.dart';
import 'package:polygonid_flutter_sdk/identity/domain/entities/private_identity_entity.dart';
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';

void main() async {
  await PolygonIdSdk.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polygon ID SDK Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Polygon ID SDK Example Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define the SDK instance
  final PolygonIdSdk sdk = PolygonIdSdk.I;

  // Define your private key
  String privateKey = 'YourPrivateKey';

  // Define your blockchain, network, and profileNonce
  String blockchain = 'YourBlockchain';
  String network = 'YourNetwork';
  String profileNonce = 'YourProfileNonce';

  // Identity operation functions
  Future<void> createIdentity() async {
    PrivateIdentityEntity identity =
        await sdk.identity.addIdentity(secret: privateKey);
  }

  Future<void> getDidIdentifier() async {
    String didIdentifier = await sdk.identity.getDidIdentifier(
        privateKey: privateKey,
        blockchain: blockchain,
        network: network,
        profileNonce: BigInt.parse(profileNonce));
  }

  Future<void> removeIdentity(String genesisDid) async {
    await sdk.identity.removeIdentity(
      privateKey: privateKey,
      genesisDid: genesisDid,
    );
  }

  // Credential operation functions
  Future<void> fetchAndSaveClaims(
      Iden3MessageEntity iden3message, String genesisDid) async {
    // Fetch and save claims code goes here
  }

  Future<void> getAllClaims(String genesisDid) async {
    // Get all claims code goes here
  }

  // Proof operation functions
  Future<void> generateProof(
      Iden3MessageEntity iden3message, String genesisDid) async {
    // Generate proof code goes here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Polygon ID SDK Example'),
      ),
    );
  }
}
