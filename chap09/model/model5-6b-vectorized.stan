data {
    int N;
    int D;
    matrix[N, D] X;
    int<lower=0> M[N];
}

parameters {
    vector[D] b;
}

transformed parameters {
    vector[N] lambda;
    lambda = X * b;
}

model {
    M ~ poisson_log(lambda);
}

generated quantities {
    int m_pred[N];
    m_pred = poisson_log_rng(lambda);
}
