def attack(port: int):
    from pwn import remote, context, PwnlibException
    from itertools import product
    import sys

    context.log_level = "CRITICAL"

    # generate 8 bytes from 0x00 * 8 to 0xff * 8
    for payload in product(range(0x00, 0xFF + 1), repeat=8):

        sys.stdout.write(f"\r{payload}")
        sys.stdout.flush()

        try:
            r = remote("host3.dreamhack.games", port)
            r.recvline()
            r.sendline(bytes(payload))
            res = r.recvline()
            r.close()

            if len(res) > 0 and b"wrong" not in res:
                print(f" -> {res.decode()}")
                return
        except PwnlibException as e:
            print("Check port number")
            return
        except (KeyboardInterrupt, Exception) as e:
            return


if __name__ == "__main__":
    import time

    start = time.time()
    attack(19435)
    print(f"Time taken: {time.time() - start}")
