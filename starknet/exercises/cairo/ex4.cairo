// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    if (n==0){
        %{print() %}
        return(sum=0);
    }
    let (sum) = calculate_sum(n = n-1 );
    tempvar result = n + sum ;
    %{print(f'Sum [ {ids.n} ] : {ids.result}') %}
    return (sum = result);
}