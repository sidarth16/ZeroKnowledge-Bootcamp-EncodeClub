// I AM NOT DONE

from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    %{print(f"arr_len={ids.arr_len}, arr={ids.arr}, run={ids.run}, idx = {ids.idx} ")%}
    
    if (arr_len == run+1) {
        return (sum = 0);
    }
    
    // nondeterministic Jmp: https://www.cairo-lang.org/docs/how_cairo_works/non_deterministic_jumps.html
    tempvar curr_element = arr[idx];
    %{ memory[ap] = ids.curr_element % 2 %}
    %{print(f"{ids.curr_element} % 2 :  {memory[ap]}")%}
    jmp odd if [ap] != 0, ap++;

    even:
    let (sum_of_remaining) = sum_even(arr_len=arr_len, arr=arr, run= run+1, idx = idx + 1);
    return (sum = arr[idx] + sum_of_remaining);

    odd:
    let (sum_of_remaining) = sum_even(arr_len=arr_len, arr=arr, run= run+1, idx = idx + 1);
    return (sum = sum_of_remaining);

}
