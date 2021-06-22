Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849F70
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624353582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vaz1oKxn0xL1NGbMhTjeqWjSUbsvQprK96mQlfR8OLw=;
	b=JqdeRkw778f+xst7J3mipKci4M0xfxg8RlrPDwCJjwYjLE/NORX1pVbajGdIGAHJ9L0HBt
	7Zc4OYK4gG1eOqWM67JSkZYfdrPzowTtA+flkXzfGDT3R288YVOfWGVhpHxsEReeKH33ux
	CftS4oe+NkXh/PArjU4Cc2oYSyhzGic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-_6v9qfdiPkmMZ9BHrOA1TA-1; Tue, 22 Jun 2021 05:19:38 -0400
X-MC-Unique: _6v9qfdiPkmMZ9BHrOA1TA-1
Received: by mail-ed1-f71.google.com with SMTP id y16-20020a0564024410b0290394293f6816so9115643eda.20
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 02:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vaz1oKxn0xL1NGbMhTjeqWjSUbsvQprK96mQlfR8OLw=;
        b=QxL6oA/knMgX7n6FiVlz0ePprnbqErHGz17oDo8kaQFEWeFOORrW/VGpMG1hWgDV8x
         z899KMp0T58EHwbWmV6PzIXDUWgAppUaHEYnig+hm3TlFVoyRuVfXg1EIz+JX6Cio2Bc
         QLsPovB2vmBvsRCozQm9bxgpC4z1BVat2dwxiL2/7HJA91zCxaml5BHD7YWIYTczsipu
         HsfeLfJzkQ8rRTcLtboqhJx6JFTbzDRdHwVILd5l0byCih3cR2mE9o+HZ9VFmt+nbsvx
         AvsBIMGm/kM9193SDHr5H1ahxo1n6MlhHCsbEsN7q9NJ2pXa1/XlrA7gHpatUvtDxLm9
         NY/g==
X-Gm-Message-State: AOAM5305IgzZRelyCdQOyyEhlx+gpKDxRFjCcR7IzKk6GHqdGi124oF6
	FXzgxg4JVu9fBCnzRxPyez2Fl6a6tH8T3YdudBXzLjBnunMsxgJh7CxETg28bvZqJs026OTfNCF
	v9ArgunzIiZKr11hKCOzZ166Fdg==
X-Received: by 2002:a05:6402:3586:: with SMTP id y6mr3566219edc.154.1624353577782;
        Tue, 22 Jun 2021 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMFctQ6qg0F+qaIC8pXjyIayPfCXlzAkQmifrAZwMnlyGpt3T1sV9JKXKYCJhqsDdMDlpFXg==
X-Received: by 2002:a05:6402:3586:: with SMTP id y6mr3566197edc.154.1624353577605;
        Tue, 22 Jun 2021 02:19:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jx9sm3484744ejc.110.2021.06.22.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:19:37 -0700 (PDT)
Subject: Re: [PATCH 12/18] staging: rtl8723bs: remove VHT dead code
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
 <d3f79570088ad339bd80fe9d6b24604ac91ea8d3.1624099126.git.fabioaiuto83@gmail.com>
 <dd0332d7-5d9f-49e5-3fc6-8ae3e623f29c@redhat.com>
 <20210622091602.GA1426@agape.jhs>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4f128bd2-b84b-132e-c75f-0030701a8a9b@redhat.com>
Date: Tue, 22 Jun 2021 11:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210622091602.GA1426@agape.jhs>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Fabio,

On 6/22/21 11:16 AM, Fabio Aiuto wrote:
> Hello Hans,
> 
> On Mon, Jun 21, 2021 at 11:45:39AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 6/19/21 12:47 PM, Fabio Aiuto wrote:
>>> remove VHT dead code, as the device doesn't support
>>> VHT (which is a 802.11ac capability).
>>>
>>> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
>>> ---
>>>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   1 -
>>>  drivers/staging/rtl8723bs/hal/hal_com.c       | 241 -----------
>>>  .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 383 +-----------------
>>>  drivers/staging/rtl8723bs/include/hal_com.h   |  62 +--
>>>  .../rtl8723bs/include/hal_com_phycfg.h        |   4 -
>>>  drivers/staging/rtl8723bs/include/ieee80211.h |  45 --
>>>  .../staging/rtl8723bs/include/rtl8723b_xmit.h |  21 -
>>>  drivers/staging/rtl8723bs/include/rtw_ht.h    |   4 -
>>>  8 files changed, 9 insertions(+), 752 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>>> index 285acd3d843b..c128d462c6c7 100644
>>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>>> @@ -46,7 +46,6 @@ static struct action_handler OnAction_tbl[] = {
>>>  	{RTW_WLAN_CATEGORY_UNPROTECTED_WNM, "ACTION_UNPROTECTED_WNM", &DoReserved},
>>>  	{RTW_WLAN_CATEGORY_SELF_PROTECTED, "ACTION_SELF_PROTECTED", &DoReserved},
>>>  	{RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &DoReserved},
>>> -	{RTW_WLAN_CATEGORY_VHT, "ACTION_VHT", &DoReserved},
>>>  	{RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &DoReserved},
>>>  };
>>>  
>>> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
>>> index 7a88447f8294..eebd48438733 100644
>>> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
>>> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
>>> @@ -295,126 +295,6 @@ u8 MRateToHwRate(u8 rate)
>>>  	case MGN_MCS31:
>>>  		ret = DESC_RATEMCS31;
>>>  		break;
>>> -	case MGN_VHT1SS_MCS0:
>>> -		ret = DESC_RATEVHTSS1MCS0;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS1:
>>> -		ret = DESC_RATEVHTSS1MCS1;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS2:
>>> -		ret = DESC_RATEVHTSS1MCS2;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS3:
>>> -		ret = DESC_RATEVHTSS1MCS3;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS4:
>>> -		ret = DESC_RATEVHTSS1MCS4;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS5:
>>> -		ret = DESC_RATEVHTSS1MCS5;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS6:
>>> -		ret = DESC_RATEVHTSS1MCS6;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS7:
>>> -		ret = DESC_RATEVHTSS1MCS7;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS8:
>>> -		ret = DESC_RATEVHTSS1MCS8;
>>> -		break;
>>> -	case MGN_VHT1SS_MCS9:
>>> -		ret = DESC_RATEVHTSS1MCS9;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS0:
>>> -		ret = DESC_RATEVHTSS2MCS0;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS1:
>>> -		ret = DESC_RATEVHTSS2MCS1;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS2:
>>> -		ret = DESC_RATEVHTSS2MCS2;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS3:
>>> -		ret = DESC_RATEVHTSS2MCS3;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS4:
>>> -		ret = DESC_RATEVHTSS2MCS4;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS5:
>>> -		ret = DESC_RATEVHTSS2MCS5;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS6:
>>> -		ret = DESC_RATEVHTSS2MCS6;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS7:
>>> -		ret = DESC_RATEVHTSS2MCS7;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS8:
>>> -		ret = DESC_RATEVHTSS2MCS8;
>>> -		break;
>>> -	case MGN_VHT2SS_MCS9:
>>> -		ret = DESC_RATEVHTSS2MCS9;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS0:
>>> -		ret = DESC_RATEVHTSS3MCS0;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS1:
>>> -		ret = DESC_RATEVHTSS3MCS1;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS2:
>>> -		ret = DESC_RATEVHTSS3MCS2;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS3:
>>> -		ret = DESC_RATEVHTSS3MCS3;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS4:
>>> -		ret = DESC_RATEVHTSS3MCS4;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS5:
>>> -		ret = DESC_RATEVHTSS3MCS5;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS6:
>>> -		ret = DESC_RATEVHTSS3MCS6;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS7:
>>> -		ret = DESC_RATEVHTSS3MCS7;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS8:
>>> -		ret = DESC_RATEVHTSS3MCS8;
>>> -		break;
>>> -	case MGN_VHT3SS_MCS9:
>>> -		ret = DESC_RATEVHTSS3MCS9;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS0:
>>> -		ret = DESC_RATEVHTSS4MCS0;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS1:
>>> -		ret = DESC_RATEVHTSS4MCS1;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS2:
>>> -		ret = DESC_RATEVHTSS4MCS2;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS3:
>>> -		ret = DESC_RATEVHTSS4MCS3;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS4:
>>> -		ret = DESC_RATEVHTSS4MCS4;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS5:
>>> -		ret = DESC_RATEVHTSS4MCS5;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS6:
>>> -		ret = DESC_RATEVHTSS4MCS6;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS7:
>>> -		ret = DESC_RATEVHTSS4MCS7;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS8:
>>> -		ret = DESC_RATEVHTSS4MCS8;
>>> -		break;
>>> -	case MGN_VHT4SS_MCS9:
>>> -		ret = DESC_RATEVHTSS4MCS9;
>>> -		break;
>>>  	default:
>>>  		break;
>>>  	}
>>> @@ -559,127 +439,6 @@ u8 HwRateToMRate(u8 rate)
>>>  	case DESC_RATEMCS31:
>>>  		ret_rate = MGN_MCS31;
>>>  		break;
>>> -	case DESC_RATEVHTSS1MCS0:
>>> -		ret_rate = MGN_VHT1SS_MCS0;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS1:
>>> -		ret_rate = MGN_VHT1SS_MCS1;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS2:
>>> -		ret_rate = MGN_VHT1SS_MCS2;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS3:
>>> -		ret_rate = MGN_VHT1SS_MCS3;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS4:
>>> -		ret_rate = MGN_VHT1SS_MCS4;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS5:
>>> -		ret_rate = MGN_VHT1SS_MCS5;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS6:
>>> -		ret_rate = MGN_VHT1SS_MCS6;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS7:
>>> -		ret_rate = MGN_VHT1SS_MCS7;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS8:
>>> -		ret_rate = MGN_VHT1SS_MCS8;
>>> -		break;
>>> -	case DESC_RATEVHTSS1MCS9:
>>> -		ret_rate = MGN_VHT1SS_MCS9;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS0:
>>> -		ret_rate = MGN_VHT2SS_MCS0;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS1:
>>> -		ret_rate = MGN_VHT2SS_MCS1;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS2:
>>> -		ret_rate = MGN_VHT2SS_MCS2;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS3:
>>> -		ret_rate = MGN_VHT2SS_MCS3;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS4:
>>> -		ret_rate = MGN_VHT2SS_MCS4;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS5:
>>> -		ret_rate = MGN_VHT2SS_MCS5;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS6:
>>> -		ret_rate = MGN_VHT2SS_MCS6;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS7:
>>> -		ret_rate = MGN_VHT2SS_MCS7;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS8:
>>> -		ret_rate = MGN_VHT2SS_MCS8;
>>> -		break;
>>> -	case DESC_RATEVHTSS2MCS9:
>>> -		ret_rate = MGN_VHT2SS_MCS9;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS0:
>>> -		ret_rate = MGN_VHT3SS_MCS0;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS1:
>>> -		ret_rate = MGN_VHT3SS_MCS1;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS2:
>>> -		ret_rate = MGN_VHT3SS_MCS2;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS3:
>>> -		ret_rate = MGN_VHT3SS_MCS3;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS4:
>>> -		ret_rate = MGN_VHT3SS_MCS4;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS5:
>>> -		ret_rate = MGN_VHT3SS_MCS5;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS6:
>>> -		ret_rate = MGN_VHT3SS_MCS6;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS7:
>>> -		ret_rate = MGN_VHT3SS_MCS7;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS8:
>>> -		ret_rate = MGN_VHT3SS_MCS8;
>>> -		break;
>>> -	case DESC_RATEVHTSS3MCS9:
>>> -		ret_rate = MGN_VHT3SS_MCS9;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS0:
>>> -		ret_rate = MGN_VHT4SS_MCS0;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS1:
>>> -		ret_rate = MGN_VHT4SS_MCS1;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS2:
>>> -		ret_rate = MGN_VHT4SS_MCS2;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS3:
>>> -		ret_rate = MGN_VHT4SS_MCS3;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS4:
>>> -		ret_rate = MGN_VHT4SS_MCS4;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS5:
>>> -		ret_rate = MGN_VHT4SS_MCS5;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS6:
>>> -		ret_rate = MGN_VHT4SS_MCS6;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS7:
>>> -		ret_rate = MGN_VHT4SS_MCS7;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS8:
>>> -		ret_rate = MGN_VHT4SS_MCS8;
>>> -		break;
>>> -	case DESC_RATEVHTSS4MCS9:
>>> -		ret_rate = MGN_VHT4SS_MCS9;
>>> -		break;
>>> -
>>>  	default:
>>>  		break;
>>>  	}
>>> diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>> index 395eb3b5af71..bb7941aee0c4 100644
>>> --- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>> +++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>> @@ -39,18 +39,6 @@ u8 PHY_GetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
>>>  	case HT_MCS24_MCS31:
>>>  		value = pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][5];
>>>  		break;
>>> -	case VHT_1SSMCS0_1SSMCS9:
>>> -		value = pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][6];
>>> -		break;
>>> -	case VHT_2SSMCS0_2SSMCS9:
>>> -		value = pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][7];
>>> -		break;
>>> -	case VHT_3SSMCS0_3SSMCS9:
>>> -		value = pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][8];
>>> -		break;
>>> -	case VHT_4SSMCS0_4SSMCS9:
>>> -		value = pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][9];
>>> -		break;
>>>  	default:
>>>  		break;
>>>  	}
>>> @@ -91,18 +79,6 @@ phy_SetTxPowerByRateBase(
>>>  	case HT_MCS24_MCS31:
>>>  		pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][5] = Value;
>>>  		break;
>>> -	case VHT_1SSMCS0_1SSMCS9:
>>> -		pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][6] = Value;
>>> -		break;
>>> -	case VHT_2SSMCS0_2SSMCS9:
>>> -		pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][7] = Value;
>>> -		break;
>>> -	case VHT_3SSMCS0_3SSMCS9:
>>> -		pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][8] = Value;
>>> -		break;
>>> -	case VHT_4SSMCS0_4SSMCS9:
>>> -		pHalData->TxPwrByRateBase2_4G[RfPath][TxNum][9] = Value;
>>> -		break;
>>>  	default:
>>>  		break;
>>>  	}
>>> @@ -131,14 +107,6 @@ struct adapter *padapter
>>>  		base = PHY_GetTxPowerByRate(padapter, path, RF_3TX, MGN_MCS23);
>>>  		phy_SetTxPowerByRateBase(padapter, path, HT_MCS16_MCS23, RF_3TX, base);
>>>  
>>> -		base = PHY_GetTxPowerByRate(padapter, path, RF_1TX, MGN_VHT1SS_MCS7);
>>> -		phy_SetTxPowerByRateBase(padapter, path, VHT_1SSMCS0_1SSMCS9, RF_1TX, base);
>>> -
>>> -		base = PHY_GetTxPowerByRate(padapter, path, RF_2TX, MGN_VHT2SS_MCS7);
>>> -		phy_SetTxPowerByRateBase(padapter, path, VHT_2SSMCS0_2SSMCS9, RF_2TX, base);
>>> -
>>> -		base = PHY_GetTxPowerByRate(padapter, path, RF_3TX, MGN_VHT3SS_MCS7);
>>> -		phy_SetTxPowerByRateBase(padapter, path, VHT_3SSMCS0_3SSMCS9, RF_3TX, base);
>>
>> You are removing a bunch of register writes from a block here, while keeping others,
>> so this does not seem like it is just dead-code removal it feels like you are
>> actually making a functional change.
> 
> I looked deeply at what I deed, and I just removed some functions updating tables
> in memory, no register write here. Tables are used to load Tx Power Limit. So
> removing these function calls according with the removal of the VHT enum items
> grants that wrong Power Limits will never be fetched.
> 
> Moreover I have been quite conservative, for I left untouched HT indexes above
> 7 which rtl8723bs doesn't support.
> 
> So IMO I think this patch is fine as is...
>> Perhaps this entire block can never be executed ?
> 
> the block is executed but there's no register write happening. Just
> updating of values which will never be fetched.

Ack, my bad I was under the impression that phy_SetTxPowerByRateBase()
would actually do a register write, but I checked and it just updates
some unused table values, so dropping this code is fine and you can
keep this patch for v2 of the patch set.

Regards,

Hans

