import http from 'k6/http';

const host = __ENV.HOST || 'http://hydra:4444';

export const options = {
    scenarios: {
        alive: {
            executor: 'constant-vus',
            vus: 100,
            duration: '10s',
        },
    },
    thresholds: {
        http_req_failed: ['rate<0.01'],
        http_req_duration: ['p(95)<500'],
    },
};

export default function () {
    http.get(`${host}/health/alive`);
}
