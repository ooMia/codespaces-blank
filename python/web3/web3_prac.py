import os

from dotenv import load_dotenv

from web3 import web3

# Load environment variables from .env file
load_dotenv()

# 이더리움 노드에 연결
alchemy_api_key = os.environ.get("ALCHEMY_API_KEY")
w3 = web3(web3.HTTPProvider(f"https://eth-sepolia.g.alchemy.com/v2/{alchemy_api_key}"))

# 주소
address = web3.to_checksum_address("0x1c415D68f299241654177Ff4D16eD7ad0f757eA2")

# 잔액 조회
balance = w3.eth.get_balance(address)

# Wei 단위의 잔액을 Ether 단위로 변환
balance_in_ether = w3.from_wei(balance, "ether")

print(f"주소 {address}의 잔액: {balance_in_ether} Ether")
