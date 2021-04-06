Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68E5F
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 13:14:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso9295546wmq.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Jyc4XzYiplxZKJWr8stiFiY4OI9641o8fprPOPnJi5M=;
        b=LCfQYoiia24DPIO9J78E90nCCMkNt6x11pCJsnL0tapjZR070TKPSOmVtOednCoRGC
         Ox279dPM63l8hpj+b2p38FmvWvw2J78yc0557EgNIbUA2eVg55NVAZASkJSfuoH72VTn
         7urg2n+aFT/TbDhiFtCqOROyRC15XTEssCCQqMvk3UmCcwgvWEBWdot6MSm7bgwCb+ed
         inCO6A6sC/sBejU4DunzSLTtNDvw3fUfVRqAMuzL5chafhoYuGaXtHhdEqBrwJA1DVmI
         9vwJBTx12ydslUiQBhyQ2CVbmvcsHYTJPKfeGvBC+18OG+M3pJmuR6zlI0mRnGwYLfhH
         Ei8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Jyc4XzYiplxZKJWr8stiFiY4OI9641o8fprPOPnJi5M=;
        b=jJ71byQIgKPJpR075GeGhLuj0L5EJuCW2Q5Oi2kfdeMyJNQORbfP8//fvL/Xo695Fl
         nQne0NiBMGqNTMWEwbxVvJ5b4MRig4nJowGFIpv7juhY5iv28XjruM+T3mnHP6SVv1Jz
         AC+Hi7xAeBPaC1k5OGmsDh0eA0shE8380wUf8ZbGahAjCZOLksxNTWDYXwBuHwHkNGHh
         Ymrxn47tDH0Nz5GyOkCZAenvhWxTiObe90FqYHnbnOTfYPpNWGif0aO9RmDZbRZSfn0A
         R7SlAQHXhbIL9ZIBRotFjKLp73gijGJItqbrf6CuGahxGhvtW4MKJp1k9EslYWECinNc
         Q3/Q==
X-Gm-Message-State: AOAM532676Qvlgrh6rx7VURjjjHDlEGzUN/n9HHYZgJp+22sQWJG/Sgn
	z6bhhL8V5M3hWmU4aFt1Iu8=
X-Google-Smtp-Source: ABdhPJzDs/Ff7ae+dmQpa+Wj6Xp8TqaXa2G75GP5fM56uoTOV5ZMpuD0jPlPvq0L2oEp6vIFEUnCzQ==
X-Received: by 2002:a05:600c:4d13:: with SMTP id u19mr4062099wmp.16.1617714864689;
        Tue, 06 Apr 2021 06:14:24 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ad13:af9b:f63b:bc4b? ([2001:818:de85:7e00:ad13:af9b:f63b:bc4b])
        by smtp.gmail.com with ESMTPSA id s83sm2909188wms.16.2021.04.06.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:14:24 -0700 (PDT)
Subject: Re: [PATCH 3/4] staging: rtl8723bs: core: reorganize characters so
 the lines are under 100 ch
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
References: <cover.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
 <6ce5f20399f2bea9f08bb37150fc67fe3c2b2a55.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
 <YGxQcEvmxHrNz2US@kroah.com>
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <2103809f-fc6d-be31-a57a-6d65914d8cf3@gmail.com>
Date: Tue, 6 Apr 2021 14:14:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YGxQcEvmxHrNz2US@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Em 06/04/21 13:13, Greg KH escreveu:
> On Mon, Apr 05, 2021 at 06:29:19PM +0100, Beatriz Martins de Carvalho wrote:
>> Cleans up warnings of "line over 100 characters" but avoinding
>> more than 90 characters in file rtw_ap.c
>>
>> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_ap.c | 22 ++++++++++++++--------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
>> index 4dab4d741675..ca6fec52d213 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
>> @@ -278,11 +278,13 @@ void expire_timeout_chk(struct adapter *padapter)
>>   
>>   			if (psta->state & WIFI_SLEEP_STATE) {
>>   				if (!(psta->state & WIFI_STA_ALIVE_CHK_STATE)) {
>> -					/* to check if alive by another methods if station is at ps mode. */
>> +					/* to check if alive by another methods */
>> +					/* if station is at ps mode. */
>>   					psta->expire_to = pstapriv->expire_to;
>>   					psta->state |= WIFI_STA_ALIVE_CHK_STATE;
>>   
>> -					/* DBG_871X("alive chk, sta:%pM is at ps mode!\n", MAC_ARG(psta->hwaddr)); */
>> +					/* DBG_871X("alive chk, sta:%pM is at ps */
>> +					/* mode!\n", MAC_ARG(psta->hwaddr)); */
> You just wrapped a code line :(
>
> Just remove it, it's not needed.
Sorry! Yesterday I didn't realize that it was a code line. I will remove it.
>
>
>>   
>>   					/* to update bcn with tim_bitmap for this station */
>>   					pstapriv->tim_bitmap |= BIT(psta->aid);
>> @@ -309,7 +311,8 @@ void expire_timeout_chk(struct adapter *padapter)
>>   			);
>>   			updated = ap_free_sta(padapter, psta, false, WLAN_REASON_DEAUTH_LEAVING);
>>   		} else {
>> -			/* TODO: Aging mechanism to digest frames in sleep_q to avoid running out of xmitframe */
>> +			/* TODO: Aging mechanism to digest frames in sleep_q to */
>> +			/* avoid running out of xmitframe */
>>   			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
>>   				&& padapter->xmitpriv.free_xmitframe_cnt < ((
>>   					NR_XMITFRAME / pstapriv->asoc_list_cnt
>> @@ -375,7 +378,8 @@ void expire_timeout_chk(struct adapter *padapter)
>>   			if (list_empty(&psta->asoc_list) == false) {
>>   				list_del_init(&psta->asoc_list);
>>   				pstapriv->asoc_list_cnt--;
>> -				updated = ap_free_sta(padapter, psta, false, WLAN_REASON_DEAUTH_LEAVING);
>> +				updated = ap_free_sta(padapter, psta, false,
>> +						      WLAN_REASON_DEAUTH_LEAVING);
>>   			}
>>   			spin_unlock_bh(&pstapriv->asoc_list_lock);
>>   		}
>> @@ -469,7 +473,8 @@ void update_bmc_sta(struct adapter *padapter)
>>   
>>   		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>>   
>> -		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
>> +		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, */
>> +		/* because it has been set before this. */
> Again, look at what you are changing to see if it makes sense.
Yesterday had to make sense, but now I saw that was wrong. I will remove it.
>>   
>>   		/* prepare for add_RATid */
>>   		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->SupportedRates);
>> @@ -748,8 +753,8 @@ void start_bss_network(struct adapter *padapter, u8 *pbuf)
>>   	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
>>   
>>   	/* check if there is wps ie, */
>> -	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
>> -	/* and at first time the security ie (RSN/WPA IE) will not include in beacon. */
>> +	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating */
>> +	/* hostapd, and at first time the security ie (RSN/WPA IE) will not include in beacon. */
> These changes do not look correct, you made them longer?

No, I only rearranged the block comment, where I sent the last word in 
the sentence to the next line,

and with that, each sentence stays with less than 100 characters. But I 
will remove it.

>
> thanks,
Thank you for to review, once more I will have more attention to my changes.
> greg k-h
Beatriz Martins de Carvalho
