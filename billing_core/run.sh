#!/bin/bash
if [ -z ${APP_BILLING_DIR} ]; 
then 
	APP_BILLING_DIR='/opt/billing/'
else 
	APP_BILLING_DIR=${APP_BILLING_DIR}
fi

$APP_BILLING_DIR/jre/bin/java -cp $APP_BILLING_DIR/billing_core/libs/*:$APP_BILLING_DIR/billing_core/billing-core-0.0.1-SNAPSHOT.jar -Dspring.profiles.active=test com.sbd.billingcore.BillingCoreApplication
