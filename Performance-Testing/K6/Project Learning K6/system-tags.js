import http from 'k6/http';

export const options = {
    thresholds: {
        http_req_duration: ['p(95)<1000'],
        'http_req_duration{status: 200}': ['[p(95)<1000']
    }
}

export default function () {
    http.get('');
   
} 