data {
    int N;
    int<lower=0, upper=1> Y[N];
}

parameters {
    real<lower=0, upper=1> q;
    real<lower=0, upper=1> p_coin;
}

model {
    for (n in 1:N){
        target += log_sum_exp(
            log(0.5 * p_coin) + bernoulli_lpmf(Y[n] | q),
            log(1 - 0.5 * p_coin) + bernoulli_lpmf(Y[n] | 1)
        );
    }
}
