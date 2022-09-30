%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

//  Constant definitions
const EMPIRIC_ORACLE_ADDRESS = 0x012fadd18ec1a23a160cc46981400160fbf4a7a5eed156c4669e39807265bcd4;
const ETH_KEY = 28556963469423460; 
const BTC_KEY = 27712517064455012;
const SOL_KEY = 32492132765102948;
const AGGREGATION_MODE = 120282243752302;  // str_to_felt("median")

// Contract interface
@contract_interface
namespace IEmpiricOracle{
    func get_value(key : felt, aggregation_mode : felt) -> (
        value : felt,
        decimals : felt,
        last_updated_timestamp : felt,
        num_sources_aggregated : felt
    ){
    }
}

// btc price function
@view
func btc_price{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}() -> (price: felt){
    let (price,
        decimals,
        last_updated_timestamp,
        num_sources_aggregated) = IEmpiricOracle.get_value(
            EMPIRIC_ORACLE_ADDRESS, BTC_KEY, AGGREGATION_MODE
        );
    return (price,);
}

// eth price function
@view
func eth_price{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}() -> (price: felt){
    let (price,
        decimals,
        last_updated_timestamp,
        num_sources_aggregated) = IEmpiricOracle.get_value(
            EMPIRIC_ORACLE_ADDRESS, ETH_KEY, AGGREGATION_MODE
        );
    return (price,);
}

// sol price function
@view
func sol_price{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr
}() -> (price: felt){
    let (price,
        decimals,
        last_updated_timestamp,
        num_sources_aggregated) = IEmpiricOracle.get_value(
            EMPIRIC_ORACLE_ADDRESS, SOL_KEY, AGGREGATION_MODE
        );
    return (price,);
}