<?php
// Site
$_['site_base']         = HTTP_SERVER;
$_['site_ssl']          = HTTPS_SERVER;

// Database
$_['db_autostart']      = true;
$_['db_type']           = DB_DRIVER; // mpdo, mssql, mysql, mysqli or postgre
$_['db_hostname']       = DB_HOSTNAME;
$_['db_username']       = DB_USERNAME;
$_['db_password']       = DB_PASSWORD;
$_['db_database']       = DB_DATABASE;
$_['db_port']           = DB_PORT;


// Email

$_['config_mail_protocol']		=  config_mail_protocol;
$_['config_smtp_host']			=  config_smtp_host;
$_['config_mail_parameter']		=  config_mail_parameter;
$_['config_smtp_username']		=  config_smtp_username;
$_['config_smtp_password']		=  config_smtp_password;
$_['config_smtp_port']			=  config_smtp_port;
$_['config_email']				=  config_email;
$_['config_name']				=  config_name;

$_['DIR_SCRIPT']				=  DIR_SCRIPT;

// Session
$_['session_autostart'] = true;

// Actions
$_['action_pre_action'] = array(
	'startup/startup',
	'startup/error',
	'startup/event',
	'startup/sass',
	'startup/login',
	'startup/permission'
);

// Actions
$_['action_default'] = 'common/dashboard';

// Action Events
$_['action_event'] = array(
    'view/*/before'                           => 'event/theme',
	'controller/extension/analytics/*/before' => 'event/compatibility/controller',
	'controller/extension/captcha/*/before'   => 'event/compatibility/controller',
	'controller/extension/feed/*/before'      => 'event/compatibility/controller',
	'controller/extension/fraud/*/before'     => 'event/compatibility/controller',
	'controller/extension/module/*/before'    => 'event/compatibility/controller',
	'controller/extension/payment/*/before'   => 'event/compatibility/controller',
	'controller/extension/recurring/*/before' => 'event/compatibility/controller',
	'controller/extension/shipping/*/before'  => 'event/compatibility/controller',
	'controller/extension/theme/*/before'     => 'event/compatibility/controller',
	'controller/extension/total/*/before'     => 'event/compatibility/controller',
	'view/analytics/*/before'                 => 'event/compatibility/view',
	'view/captcha/*/before'                   => 'event/compatibility/view',
	'view/feed/*/before'                      => 'event/compatibility/view',
	'view/fraud/*/before'                     => 'event/compatibility/view',
	'view/module/*/before'                    => 'event/compatibility/view',
	'view/payment/*/before'                   => 'event/compatibility/view',
	'view/recurring/*/before'                 => 'event/compatibility/view',
	'view/shipping/*/before'                  => 'event/compatibility/view',
	'view/theme/*/before'                     => 'event/compatibility/view',
	'view/total/*/before'                     => 'event/compatibility/view',
	'language/extension/analytics/*/before'   => 'event/compatibility/language',
	'language/extension/captcha/*/before'     => 'event/compatibility/language',
	'language/extension/feed/*/before'        => 'event/compatibility/language',
	'language/extension/fraud/*/before'       => 'event/compatibility/language',
	'language/extension/module/*/before'      => 'event/compatibility/language',
	'language/extension/payment/*/before'     => 'event/compatibility/language',
	'language/extension/recurring/*/before'   => 'event/compatibility/language',
	'language/extension/shipping/*/before'    => 'event/compatibility/language',
	'language/extension/theme/*/before'       => 'event/compatibility/language',
	'language/extension/total/*/before'       => 'event/compatibility/language'
);
