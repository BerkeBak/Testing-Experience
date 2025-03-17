import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
    stages:[
        {
            //Ramp-Up-Stage
            duration: '5m',
            target: 100
        },
        {
            //Steady-Load-Stage
            duration: '30m',
            target: 100
        },
        {
            //Ramp-Down-Stage
            duration: '5m',
            target: 0
        }
    ]
}

export default function () {
    http.get('https://test.k6.io');
    sleep(1);
    http.get('https://test.k6.io/contacts.php');
    sleep(2);
    http.get('https://test.k6.io/news.php');
    sleep(2);
} 