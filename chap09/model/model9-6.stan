data {
    int I;
    int N;
    int T;
    real Time[T];
    int<lower=1, upper=N> PersonID[I];
    int<lower=1, upper=T> TimeID[I];
    vector[I] Y;
}

parameters {
    real a0;
    real b0;
    vector[N] log_a;
    vector[N] log_b;
    real<lower=0> s_a;
    real<lower=0> s_b;
    real<lower=0> s_Y;
}

transformed parameters {
    vector[N] a;
    vector[N] b;
    matrix[N, T] mu;
    a = exp(log_a);
    b = exp(log_b);
    for(t in 1:T){
        for(n in 1:N){
            mu[n, t] = a[n] * (1 - exp(-b[n]*Time[t]));
        }
    }
}

model {
    for(n in 1:N){
        log_a[n] ~ normal(a0, s_a);
        log_b[n] ~ normal(b0, s_b);
    }
    for(i in 1:I){
        Y[i] ~ normal(mu[PersonID[i], TimeID[i]], s_Y);
    }
}
