<?php
/**
 * @author         Pierre-Henry Soria <ph7software@gmail.com>
 * @copyright      (c) 2012-2018, Pierre-Henry Soria. All Rights Reserved.
 * @license        GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
 * @package        PH7 / App / System / Module / HotOrNot / Controller
 */

namespace PH7;

use PH7\Framework\Http\Http;
use Teapot\StatusCode;

class MainController extends Controller
{
    /** @var HotOrNotModel */
    private $oHoNModel;

    public function __construct()
    {
        parent::__construct();

        $this->oHoNModel = new HotOrNotModel();
    }

    public function rating()
    {
        /*** JS File Only to Members. For its part, the Rating System will redirect the visitors who are not connected to the registration form. ***/
        if (UserCore::auth()) {
            $this->design->addJs(PH7_LAYOUT . PH7_SYS . PH7_MOD . $this->registry->module . PH7_SH . PH7_TPL . PH7_TPL_MOD_NAME . PH7_SH . PH7_JS, 'script.js');
        }

        /*** Meta Tags ***/
        /**
         * @internal We can include HTML tags in the title since the template will erase them before display.
         */
        $sMenDesc = t('You <span style="color: dodgerblue">Men!</span>') . '<br />' . t('Vote for the <span style="color:deeppink">most beautiful women</span>, the sexiest and hottest!');
        $sWomenDesc = t('You <span style="color: deeppink">Women!</span>') . '<br />' . t('Vote for  <span style="color:dodgerblue">the best men</span>, the sexiest and hottest!');

        $this->view->page_title = t('Hot On Not - Free Online Dating Site');
        $this->view->meta_description = $sMenDesc . ' ' . $sWomenDesc;
        $this->view->meta_keywords = t('hot, hot or not, hotornot, sexy, rate, rating, voting, women, free, dating, speed dating, flirt');

        $this->view->sex = $this->session->get('member_sex');

        if($this->view->sex == "Female") {
            $this->view->desc_for_woman = $sWomenDesc;
            $this->view->desc_for_man = "";
        }
        else {
            $this->view->desc_for_man = $sMenDesc;
            $this->view->desc_for_woman = "";
        }



        /*** Display ***/
        // If the user is logged in, we do not display its own avatar since the user cannot vote for himself.
        $iProfileId = UserCore::auth() ? $this->session->get('member_id') : null;
        $oData = $this->oHoNModel->getPicture($iProfileId);

        if (empty($oData)) {
            Http::setHeadersByCode(StatusCode::NOT_FOUND);
            $this->view->error = t("Sorry, we haven't found any photo to Hot Or Not Party.");
        } else {
            $this->view->avatarDesign = new AvatarDesignCore; // Avatar Design Class
            $this->view->data = $oData;
        }

        $this->output();
    }
}
