data {
    int I;  /* The number of individuals */
    int P;  /* The number of pots */
    int<lower=1, upper=P> pot[I]; /* pot for each individual */
    int<lower=0, upper=1> f[I]; /* whether treatment is done or not */
    int<lower=0> y[I];
}

parameters {
    real b[2];
    real b_P[P];
    real b_I[I];
    real<lower=0> s_P;
    real<lower=0> s_I;
}

transformed parameters {
    real lambda[I];
    for(i in 1:I){
        lambda[i] = b[1] + b[2]*f[i] + b_P[pot[i]] + b_I[i];
    }
}

model {
    for(p in 1:P){
        b_P[p] ~ normal(0, s_P);
    }
    for(i in 1:I){
        b_I[i] ~ normal(0, s_I);
    }
    for(i in 1:I){
        y[i] ~ poisson_log(lambda[i]);
    }
}

generated quantities {
    int y_pred[I];
    for(i in 1:I){
        y_pred[i] = poisson_log_rng(lambda[i]);
    }
}
