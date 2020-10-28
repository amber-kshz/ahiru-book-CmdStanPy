functions {
    real CateCateCount_lpmf(int cnt, int i, int K, vector theta, vector[] phi){
        vector[K] lp;
        for (k in 1:K){
            lp[k] = log(theta[k]) + log(phi[k, i]);
        }
        return cnt * log_sum_exp(lp);
    }
}

data {
    int<lower=1> E;
    int<lower=1> N;
    int<lower=1> I;
    int<lower=1> K;
    int<lower=1, upper=N> PersonID[E];
    int<lower=1, upper=I> ItemID[E];
    int<lower=0> count[E];
    vector<lower=0>[I] Alpha;
}

parameters {
    simplex[K] theta[N];
    simplex[I] phi[K];
}

model {
    for (k in 1:K){
        phi[k] ~ dirichlet(Alpha);
    }
    for (e in 1:E){
        count[e] ~ CateCateCount(ItemID[e], K, theta[PersonID[e]], phi);
    }
}
