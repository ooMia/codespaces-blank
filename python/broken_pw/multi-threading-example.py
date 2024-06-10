import concurrent.futures
import threading


def job(n):
    global n_submit, job_success
    n_submit += 1
    res = {"input": n, "is_valid": False, "output": None}
    if n == 567:
        res["is_valid"] = True
        res["output"] = "567 found!"
        job_success = True
    return res


def done(future):
    res = future.result()
    if res["is_valid"]:
        print(res)


def run():
    global job_success, n_submit
    [job_success, n_submit] = [False, 0]
    args = range(1000000)

    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as executor:
        for arg in args:
            if job_success:
                break
            future = executor.submit(job, arg)
            future.add_done_callback(done)
    print(f"concurrent_counter: {n_submit}")


if __name__ == "__main__":

    # calc running time of run()
    import time

    start = time.time()
    run()
    print(f"Time taken: {time.time() - start}")
