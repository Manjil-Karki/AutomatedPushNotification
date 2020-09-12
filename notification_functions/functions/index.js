const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();

exports.pushNotification = functions.firestore.document('bookings/{organizations}').onUpdate(async(snapshot, context)=>{
    try{
        const organization = snapshot.after.data();
        var payload ={
        'notification':{
              'title': 'Booked',
              'body': 'Booked for date',
              'sound': 'default',
              'clickAction': 'FUTTER_NOTIFICATION_CLICK',
            },
        'data':{
             'sendername': 'sender name',
             'message': 'message',
           }
    };
    tokenSnapshot = await db.collection('DeviceTokens').doc('Tokens').get();
    deviceTokens = tokenSnapshot.data();
    deviceToken = deviceTokens[organization.uid];
    return admin.messaging().sendToDevice(deviceToken, payload); 
    }catch(err){
        console.log(err);
    }   
});