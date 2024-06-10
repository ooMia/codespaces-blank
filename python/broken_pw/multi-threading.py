from pwn import *
from itertools import product
import time, threading


job_success = False
context.log_level = "ERROR"


def job(payload):
    global job_success

    res = {"input": bytes(payload), "is_valid": False, "output": None}
    if job_success:
        return res
    try:
        r = remote("host3.dreamhack.games", 14045)
        r.recvline()
        r.sendline(res["input"])
        res["output"] = r.recvline()
        if b"wrong" not in res["output"]:
            res["is_valid"] = True
            job_success = True
            print(f"{res=}")
        r.close()
    except (KeyboardInterrupt, PwnlibException) as e:
        job_success = True
        print(e.args)
    pass


def run():
    global job_success

    args = product(range(0x00, 0xFF + 1), repeat=8)
    for arg in args:
        if job_success:
            pass
        # start a new thread with timeout
        threading.Thread(target=job, args=(arg,)).start()


if __name__ == "__main__":
    start = time.time()
    run()
    print(f"Time taken: {time.time() - start}")
