data {
    int I;
    int<lower=0, upper=8> y[I];
}

parameters {
    real b;
    real x[I];
    real<lower=0> s_X;
}

transformed parameters {
    real<lower=0, upper=1> q[I];
    for(i in 1:I){
        q[i] = inv_logit(b + x[i]);
    }
}

model {
    for(i in 1:I){
        x[i] ~ normal(0, s_X);
    }
    for(i in 1:I){
        y[i] ~ binomial(8, q[i]);
    }
}

generated quantities {
    int y_pred[I];
    for(i in 1:I){
        y_pred[i] = binomial_rng(8, q[i]);
    }
}
