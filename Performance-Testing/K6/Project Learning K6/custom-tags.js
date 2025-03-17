import http from 'k6/http';
import { check } from 'k6';
import { Counter } from 'k6/metrics';

export const options = {
    thresholds: {
        http_req_duration: ['p(95)<1000'],
        'http_req_duration{status: 200}': ['p(95)<1000'],
        'http_req_duration{page:order}':['p(95)<250'],
        http_errors: ['count==0'],
        'http_errors{page:order}': ['count==0'],
        checks: ['rate>=0.99'],
        'checks{page:order}': ['rate>=0.99'],
    }
}

let httpErrors= new Counter('http_errors');

export default function () {
    let res = http.get('https://test.k6.io',
        {
            tags: {
                page: 'order'
            }
    });

    if (res.error) {
        httpErrors.add(1, { page: 'order'});
    }

    check(res, {
        'status is 200': (r) => r.status === 200
    }, { page: 'order'});


    
} 