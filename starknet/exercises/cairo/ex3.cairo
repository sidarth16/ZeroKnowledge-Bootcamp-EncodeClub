// Perform and log output of simple arithmetic operations
func simple_math() {
    tempvar x = 13;
    tempvar y = 14;
    tempvar z = x + y;
    %{ print(f'Adding [ {ids.x} + {ids.y} ] : ', ids.z) %}
    
    // multiplying 3 * 6
    tempvar x = 3;
    tempvar y = 6;
    tempvar z = x * y;
    %{ print(f'Multiplying [ {ids.x} * {ids.y} ] : ', ids.z) %}
    
    // dividing 6 by 2
    tempvar x = 6;
    tempvar y = 2;
    tempvar z = x / y;
    %{ print(f'Dividing [ {ids.x} / {ids.y} ] : ', ids.z) %}
    
    // dividing 70 by 2
    tempvar x = 70;
    tempvar y = 2;
    tempvar z = x / y;
    %{ print(f'Dividing [ {ids.x} / {ids.y} ] : ', ids.z) %}
    
    // dividing 7 by 2
    tempvar x = 7;
    tempvar y = 2;
    tempvar z = x / y;
    %{ print(f'Dividing [ {ids.x} / {ids.y} ] : ', ids.z) %}

    return ();
}
