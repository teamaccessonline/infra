<?php

require_once('_include.php');
$as = new \SimpleSAML\Auth\Simple('testsite');
$as->requireAuth();


$config = \SimpleSAML\Configuration::getInstance();

if ($config->getBoolean('usenewui', false)) {
    \SimpleSAML\Utils\HTTP::redirectTrustedURL(SimpleSAML\Module::getModuleURL('core/login'));
}
\SimpleSAML\Utils\HTTP::redirectTrustedURL(SimpleSAML\Module::getModuleURL('core/authenticate.php?as=testsite'));
#\SimpleSAML\Utils\HTTP::redirectTrustedURL(SimpleSAML\Module::getModuleURL('core/frontpage_welcome.php'));
