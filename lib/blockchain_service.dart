import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class BlockchainService {
  // Set your Infura URL (use the Project ID you got from Infura)
  static const String infuraUrl =
      'https://mainnet.infura.io/v3/7ee33dbe7d514f1db6e6004b969ac0c3';

  // Create an HTTP client (to make requests to Infura)
  final Client httpClient = Client();

  // Create a Web3Client instance
  final Web3Client web3Client;

  // Constructor to initialize the web3Client with Infura URL and HTTP client
  BlockchainService() : web3Client = Web3Client(infuraUrl, Client());

  // Add any methods to interact with the blockchain here
  Future<void> getAccountBalance(String address) async {
    EthereumAddress ethAddress = EthereumAddress.fromHex(address);
    var balance = await web3Client.getBalance(ethAddress);
    print('Balance: ${balance.getInEther} ETH');
  }
}
