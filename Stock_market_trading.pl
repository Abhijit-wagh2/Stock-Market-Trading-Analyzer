% Define stocks
stock(meta).
stock(google).
stock(amazon).

% Define performance metrics for stocks
performance_metric(returns).
performance_metric(risk).
performance_metric(liquidity).
performance_metric(volatility).

% Define rules for evaluating stock performance
evaluate_performance(Stock, high) :-
    achieved_metric(Stock, returns, high),
    achieved_metric(Stock, risk, low),
    achieved_metric(Stock, liquidity, high),
    achieved_metric(Stock, volatility, low).

evaluate_performance(Stock, medium) :-
    achieved_metric(Stock, returns, medium),
    achieved_metric(Stock, risk, medium),
    achieved_metric(Stock, liquidity, medium),
    achieved_metric(Stock, volatility, medium).

evaluate_performance(Stock, low) :-
    achieved_metric(Stock, returns, low),
    achieved_metric(Stock, risk, high),
    achieved_metric(Stock, liquidity, low),
    achieved_metric(Stock, volatility, high).

% Define metrics achieved by stocks
achieved_metric(meta, returns, high).
achieved_metric(meta, risk, low).
achieved_metric(meta, liquidity, high).
achieved_metric(meta, volatility, low).

achieved_metric(google, returns, medium).
achieved_metric(google, risk, medium).
achieved_metric(google, liquidity, medium).
achieved_metric(google, volatility, medium).

achieved_metric(amazon, returns, low).
achieved_metric(amazon, risk, high).
achieved_metric(amazon, liquidity, low).
achieved_metric(amazon, volatility, high).

% Define suggestions for stock performance improvement
improvement_suggestion(high, 'Continue investing in high-return, low-risk assets with good liquidity and stable volatility.').
improvement_suggestion(medium, 'Diversify investments across different asset classes for moderate returns and risk.').
improvement_suggestion(low, 'Reassess investment strategy to reduce risk and improve returns, liquidity, and volatility.').

consult_performance_system :-
    write('Enter stock symbol (e.g., meta, google, amazon): '), nl,
    read(Stock),
    stock(Stock), % Check if the entered stock symbol is valid
    evaluate_performance(Stock, Performance),
    write('Performance of '), write(Stock), write(' is '), write(Performance), nl,
    improvement_suggestion(Performance, Suggestion),
    write('Suggestion for improvement: '), write(Suggestion), nl.

% Handling invalid stock symbols
consult_performance_system :-
    write('Invalid stock symbol. Please enter a valid stock symbol (e.g., meta, google, amazon).'), nl,
    consult_performance_system.
