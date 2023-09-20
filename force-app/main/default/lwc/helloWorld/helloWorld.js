import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getApiEvent from '@salesforce/apex/ApiEventExplore.getApiEvents';

export default class HelloWorld extends LightningElement {

    displayWait=false;

    @track columns = [
        { label: 'ID', fieldName: 'Id' },
        { label: 'EventDate', fieldName: 'EventDate' },
        { label: 'ApiType', fieldName: 'ApiType' },
        //{ label: 'Operation', fieldName: 'Operation' },
        { label: 'Query', fieldName: 'Query' },
        { label: 'Records', fieldName: 'Records' },
        { label: 'RowsProcessed', fieldName: 'RowsProcessed' }
    ];
    @track fetchedApiEvents = [];

    @wire(getApiEvent)
    wiredApiEvents({ error, data }) {
        if (data) {

            console.log('£££ MCLA - wiredApiEvents - data : ' + data);


            this.fetchedApiEvents = data;
            this.displayWait=false;

            const toastEvt = new ShowToastEvent({
                title: 'Data',
                message: 'API Events found !',
                variant: 'info',
                mode: 'dismissable'
            });
            this.dispatchEvent(toastEvt);

        } else if (error) {

            this.displayWait=true;
            const toastEvt = new ShowToastEvent({
                title: 'Error',
                message: error,
                variant: 'error',
                mode: 'dismissable'
            });
            this.dispatchEvent(toastEvt);
            console.log(error);

        }
    }

}