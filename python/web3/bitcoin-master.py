# merkle root(이하`mr`)과 16 이상 32 미만 길이의 transaction hashes(이하 `tx_hashes`), 그리고
# 임의의 비어있는 트랜잭션 번호(이하 `index`)가 주어진다.
# 이때, `mr`과 `tx_hashes`를 이용하여 `index`번째 트랜잭션의 hash를 계산하는 함수를 작성하라.

# 64바이트의 16진수 최솟값부터 최댓값까지 순차적으로 접근하여 수행하는 반복문
from typing import Callable


def run(
    is_valid: Callable[[str], bool]
) -> str or None:
    # define limit as 2 ** 64
    # and do not make an array of 2 ** 64 elements
    # just add 1 to the value of the loop
    val = 0
    while val < 2 ** 64:
        # convert val to 64 bytes hex string
        val_hex = format(val, '064x')
        # if the value is valid, return the value
        if is_valid(val_hex):
            return val_hex
        # add 1 to the value
        val += 1

    return None


def timeit(func: Callable, *args, **kwargs):
    import time
    start = time.time()
    result = func(*args, **kwargs)
    print(f"Execution time: {time.time() - start}")
    return result


if __name__ == '__main__':
    timeit(run, lambda x: x.startswith('000000000000000000000000000000000000000000000000000001'))
