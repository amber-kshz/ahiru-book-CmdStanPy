data {
    int I;
    int<lower=0, upper=1> A[I];
    real<lower=0, upper=1> Score[I];
    real<lower=0, upper=1> W[I];
    int<lower=0, upper=1> Y[I];
}

parameters {
    real b[4];
}

transformed parameters {
    real q[I];
    for (i in 1:I){
        q[i] = inv_logit(b[1] + b[2]*A[i] + b[3]*Score[i] + b[4]*W[i]);
    }
}

model {
    for (i in 1:I){
        Y[i] ~ bernoulli(q[i]);
    }
}
