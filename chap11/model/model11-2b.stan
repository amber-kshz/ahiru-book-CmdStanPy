data {
    int N;
    int<lower=0> Y[N];
}

parameters {
    real<lower=0> lambda;
}

model {
    Y ~ poisson(lambda * 0.5);
}
