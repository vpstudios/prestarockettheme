{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{if $field.type == 'hidden'}

    {block name='form_field_item_hidden'}
        <input type="hidden" name="{$field.name}" value="{$field.value}">
    {/block}

{else}

    <div class="form-group row {if !empty($field.errors)}has-error{/if}">
        {if $field.type == 'checkbox' || $field.type == 'radio-buttons'}
            <div class="col-md-3 col-form-label">
                {if $field.type == 'radio-buttons'}
                    {$field.label}
                {/if}
            </div>
        {else}
            <label class="col-md-3 col-form-label{if $field.required} required{/if}" for="f-{$field.name}">
                {$field.label}
            </label>
        {/if}

        <div class="col-md-6">

            {if $field.type === 'select'}

                {block name='form_field_item_select'}
                    <select class="custom-select" name="{$field.name}" id="f-{$field.name}"{if $field.required} required{/if}>
                        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                        {foreach from=$field.availableValues item="label" key="value"}
                            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                        {/foreach}
                    </select>
                {/block}

            {elseif $field.type === 'countrySelect'}

                {block name='form_field_item_country'}
                    <select
                            class="custom-select js-country"
                            name="{$field.name}"
                            id="f-{$field.name}"
                            {if $field.required}required{/if}
                    >
                        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                        {foreach from=$field.availableValues item="label" key="value"}
                            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                        {/foreach}
                    </select>
                {/block}

            {elseif $field.type === 'radio-buttons'}

                {block name='form_field_item_radio'}
                    {foreach from=$field.availableValues item="label" key="value" name="radiolist"}
                        <div class="custom-control custom-radio">
                            <input
                                    name="{$field.name}"
                                    type="radio"
                                    value="{$value}"
                                    class="custom-control-input"
                                    id="f-{$field.name}-{$smarty.foreach.radiolist.iteration}"
                                    {if $field.required}required{/if}
                                    {if $value eq $field.value} checked {/if}
                            >

                            <label class="custom-control-label" for="f-{$field.name}-{$smarty.foreach.radiolist.iteration}">{$label}</label>
                        </div>
                    {/foreach}

                {/block}

            {elseif $field.type === 'checkbox'}

                {block name='form_field_item_checkbox'}
                    <div class="custom-control custom-checkbox">
                        <input name="{$field.name}" type="checkbox" value="1" id="f-{$field.name}" class="custom-control-input"{if $field.value} checked="checked"{/if}{if $field.required} required{/if}>
                        <label class="custom-control-label" for="f-{$field.name}">{$field.label nofilter}</label>
                    </div>
                {/block}

            {elseif $field.type === 'date'}

                {block name='form_field_item_date'}
                    <input name="{$field.name}" class="form-control" type="date" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}" id="f-{$field.name}">
                    {if isset($field.availableValues.comment)}
                        <span class="form-text text-muted">
              {$field.availableValues.comment}
            </span>
                    {/if}
                {/block}

            {elseif $field.type === 'birthday'}

                {block name='form_field_item_birthday'}
                    <div class="js-parent-focus">
                        {html_select_date
                        field_order=DMY
                        time={$field.value}
                        field_array={$field.name}
                        prefix=false
                        reverse_years=true
                        field_separator='<br>'
                        day_extra='class="form-control form-control-select"'
                        month_extra='class="form-control form-control-select"'
                        year_extra='class="form-control form-control-select"'
                        day_empty={l s='-- day --' d='Shop.Forms.Labels'}
                        month_empty={l s='-- month --' d='Shop.Forms.Labels'}
                        year_empty={l s='-- year --' d='Shop.Forms.Labels'}
                        start_year={'Y'|date}-100 end_year={'Y'|date}
                        }
                    </div>
                {/block}

            {elseif $field.type === 'password'}

                {block name='form_field_item_password'}
                    <div class="input-group js-parent-focus">
                        <input
                                class="form-control js-child-focus js-visible-password"
                                name="{$field.name}"
                                id="f-{$field.name}"
                                type="password"
                                value=""
                                pattern=".{literal}{{/literal}5,{literal}}{/literal}"
                                {if $field.required}required{/if}
                        >
                        <span class="input-group-btn">
              <button
                      class="btn btn-light"
                      type="button"
                      data-action="show-password"
                      data-text-show="{l s='Show' d='Shop.Theme.Actions'}"
                      data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}"
              >
                {l s='Show' d='Shop.Theme.Actions'}
              </button>
            </span>
                    </div>
                {/block}

            {elseif $field.type === 'file'}
                <div class="custom-file">
                    <input name="{$field.name}" type="file" class="custom-file-input" id="f-{$field.name}"{if $field.required} required{/if}>
                    <label class="custom-file-label" for="f-{$field.name}">{l s='Choose file' d='Shop.Theme.Actions'}</label>
                    {literal}
                    <style>
                        .custom-file-label::after{
                            content:"{/literal}{l s='Choose file' d='Shop.Theme.Actions'}"{literal}
                        }
                    </style>
                    {/literal}
                </div>
            {else}

                {block name='form_field_item_other'}
                    <input
                            class="form-control"
                            name="{$field.name}"
                            type="{$field.type}"
                            value="{$field.value}"
                            id="f-{$field.name}"
                            {if isset($field.availableValues.placeholder)}placeholder="{$field.availableValues.placeholder}"{/if}
                            {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
                            {if $field.required}required{/if}
                    >
                    {if isset($field.availableValues.comment)}
                        <small class="form-text text-muted">
                            {$field.availableValues.comment}
                        </small>
                    {/if}
                {/block}

            {/if}

            {block name='form_field_errors'}
                {include file='_partials/form-errors.tpl' errors=$field.errors}
            {/block}

        </div>

        <div class="col-md-3 text-muted col-form-label">
            {block name='form_field_comment'}
                {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
                    <small>{l s='Optional' d='Shop.Forms.Labels'}</small>
                {/if}
            {/block}
        </div>
    </div>

{/if}
