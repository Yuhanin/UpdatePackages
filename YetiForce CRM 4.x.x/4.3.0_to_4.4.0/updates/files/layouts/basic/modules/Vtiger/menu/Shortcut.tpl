{strip}
	{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
	{assign var=ICON value=Vtiger_Menu_Model::getMenuIcon($MENU, Vtiger_Menu_Model::vtranslateMenu($MENU['name'],$MENU_MODULE))}
	{if (isset($MENU['active']) && $MENU['active']) || $PARENT_MODULE == $MENU['id']}
		{assign var=ACTIVE value='true'}
	{else}
		{assign var=ACTIVE value='false'}
	{/if}
	<li class="tpl-menu-Shortcut c-menu__item js-menu__item nav-item menuShortcut {if !$HASCHILDS}hasParentMenu{/if}" data-id="{$MENU.id}" data-js="mouseenter mouseleave">
		<a class="nav-link {if $ACTIVE =='true'}active{else}collapsed{/if}{if $ICON} hasIcon{/if}{if $HASCHILDS == 'true'} js-submenu-toggler{/if}{if isset($MENU['hotkey'])} hotKey{/if}" {if isset($MENU['hotkey'])} data-hotkeys="{$MENU['hotkey']}"{/if}
			{if $HASCHILDS == 'true'} data-toggle="collapse" data-target="#submenu-{$MENU['id']}" role="button"{/if}
			href="{$MENU['dataurl']}"
			{if $HASCHILDS == 'true'} aria-haspopup="true" aria-expanded="{$ACTIVE}" aria-controls="submenu-{$MENU['id']}"{/if}
			{if $MENU.newwindow eq 1}target="_blank" {/if} rel="noreferrer">
			{$ICON}
			<span class="c-menu__item__text js-menu__item__text" data-js="class: u-white-space-n">
				{Vtiger_Menu_Model::vtranslateMenu($MENU['name'],$MENU_MODULE)}
			</span>
			{if $HASCHILDS == 'true'}<span class="toggler" aria-hidden="true"><span class="fas fa-plus-circle"></span><span class="fas fa-minus-circle"></span></span>{/if}
		</a>
		{include file=\App\Layout::getTemplatePath('menu/SubMenu.tpl', $MODULE)}
	</li>
{/strip}

