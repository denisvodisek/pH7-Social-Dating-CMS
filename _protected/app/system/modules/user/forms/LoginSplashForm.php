<?php
/**
 * @author         Pierre-Henry Soria <ph7software@gmail.com>
 * @copyright      (c) 2012-2018, Pierre-Henry Soria. All Rights Reserved.
 * @license        GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
 * @package        PH7 / App / System / Module / User / Form
 */

namespace PH7;

use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Url\Header;

class LoginSplashForm
{
    public static function display()
    {
        if (isset($_POST['submit_login_user'])) {
            if (\PFBC\Form::isValid($_POST['submit_login_user'])) {
                new LoginFormProcess();
            }

            Header::redirect();
        }

        $oForm = new \PFBC\Form('splash_page_login');
        $oForm->configure(['view' => new \PFBC\View\Horizontal, 'action' => Uri::get('user', 'main', 'login')]);
        $oForm->addElement(new \PFBC\Element\Hidden('submit_login_user', 'form_login_user'));
        $oForm->addElement(new \PFBC\Element\Token('login'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('<div class="col-xs-12">'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('<div class="col-md-6 col-sm-6 col-xs-12">'));
        $oForm->addElement(new \PFBC\Element\Email('', 'mail', ['placeholder' => t('Your Email'), 'style' => 'width:100%', 'required' => 1], false));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('</div>'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('<div class="col-md-6 col-sm-6 col-xs-12">'));
        $oForm->addElement(new \PFBC\Element\Password('', 'password', ['placeholder' => t('Your Password'), 'style' => 'width:100%', 'required' => 1]));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('</div>'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('<div class="col-md-3 splash_page_button">'));
        $oForm->addElement(new \PFBC\Element\Button(t('<i class="fa fa-key"></i> Login'), 'submit',  ['class' => 'btn btn-danger btn-raised btn-lg']));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('</div>'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('<div class="col-md-3 bt_login_remember">'));
        $oForm->addElement(new \PFBC\Element\Checkbox('', 'remember', [1 => t('Stay signed in')]));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('</div>'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('<div class="col-md-6 col-sm-12 bt_login_forgot_pswd">' . LostPwdDesignCore::link('user', false) . '</div>'));
        $oForm->addElement(new \PFBC\Element\HTMLExternal('</div>'));
        $oForm->render();
    }
}
