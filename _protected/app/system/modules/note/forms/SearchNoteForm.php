<?php
/**
 * @author         Pierre-Henry Soria <ph7software@gmail.com>
 * @copyright      (c) 2012-2018, Pierre-Henry Soria. All Rights Reserved.
 * @license        GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
 * @package        PH7 / App / System / Module / Note / Form
 */

namespace PH7;

use PH7\Framework\Mvc\Router\Uri;

class SearchNoteForm
{
    /**
     * @param int|null $iWidth
     *
     * @throws Framework\File\Exception
     */
    public static function display($iWidth = null)
    {
        $aOptions = ['description' => t('Enter Name, Keyword of posts, Author (username, first name, last name) or ID of a note.')];
        if (!empty($iWidth)) {
            $aOptions += ['style' => 'width:' . ((int)$iWidth * 1.09) . 'px'];
        }

        $oForm = new \PFBC\Form('form_search', $iWidth);
        $oForm->configure(['action' => Uri::get('note', 'main', 'result') . PH7_SH, 'method' => 'get']);
        $oForm->addElement(new \PFBC\Element\Search(t('Search Note Posts:'), 'looking', $aOptions));
        $oForm->addElement(new \PFBC\Element\Select(t('Browse By:'), 'order', [SearchCoreModel::TITLE => t('Title'), SearchCoreModel::VIEWS => t('Popular'), SearchCoreModel::RATING => t('Rated'), SearchCoreModel::CREATED => t('Created Date'), SearchCoreModel::UPDATED => t('Updated Date')]));
        $oForm->addElement(new \PFBC\Element\Select(t('Direction:'), 'sort', [SearchCoreModel::ASC => t('Ascending'), SearchCoreModel::DESC => t('Descending')]));
        $oForm->addElement(new \PFBC\Element\Button(t('<i class="fa fa-search"></i> Search'), 'submit',  ['class' => 'btn btn-danger btn-raised btn-lg']));

        $oForm->render();
    }
}
