data {
    int I;
    int<lower=0, upper=1> A[I];
    real<lower=0, upper=1> Score[I];
    int<lower=0, upper=1> Cloudy[I];
    int<lower=0, upper=1> Rainy[I];
    int<lower=0, upper=1> Y[I];
}

parameters {
    real b[3];
    real bw[2];
}

transformed parameters {
    real q[I];
    for (i in 1:I){
        q[i] = inv_logit(b[1] + b[2]*A[i] + b[3]*Score[i] + bw[1]*Cloudy[i] + bw[2]*Rainy[i]);
    }
}

model {
    for (i in 1:I){
        Y[i] ~ bernoulli(q[i]);
    }
}
