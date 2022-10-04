// I AM NOT DONE

%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

from starkware.cairo.common.bitwise import bitwise_not

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
 n: felt, idx: felt, exp: felt, broken_chain: felt) -> (true: felt) {
    
    alloc_locals;

    if ( n==0 ){
        return (true = 0);
    }else{
        if ( n==1 ){
            return (true = 1);
        }
    }

    if ( idx==0 ){
        let(not_n) = bitwise_not(n);
        tempvar temp_n = not_n + 1;  // computing -n

        let (divisor) = bitwise_and (n , temp_n);
        let (n, rem) = unsigned_div_rem (n, divisor); // divide and remove the trailing zeroes
        let (result) = pattern(n=n, idx=idx+1, exp=1, broken_chain=0); 
        
        return (true = result);
    }
    
    // Check whether the lsb is as expected.
    let ( local lsb ) = bitwise_and (n , 1);
    if (lsb != exp){
        return (true = 0);
    }

    // Update 'n' and 'exp' for the next iteration
    let ( next_exp) = bitwise_xor( exp , 1 );   // toggle exp: 0->1 , 1->0
    let ( next_n, rem) = unsigned_div_rem (n, 2); // remove the last bit

    let (result) = pattern(n=next_n, idx=idx+1, exp=next_exp, broken_chain=0);

    return (true = result);
    
}
