data {
    int N;
    vector[N] X;
    vector[N] Y;
}

parameters {
    real a;
    real b;
    real<lower=0> sigma;
}

transformed parameters {
    vector[N] epsilon;
    epsilon = Y - (a + b*X);
}

model {
    epsilon ~ normal(0, sigma);
}
