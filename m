Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72D2C9F
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 17:36:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id r5so82132pls.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fedtuZxfy8Ocxg9jPE6FfUu7D50bZfVQXO7CcPYFPaQ=;
        b=Rp/48xqJ726UzicfVm/WK0fAu1dJLrUw0jyhc6peOETyiGRW0XiHtW55NGw/+aKEZD
         s0wff2jsf5BN2iLHZ++fT0fvMqu3VjRhbcOYKWhike8NQXbIkREkzdz5xmiOJL3BqORP
         NBuD16qLJQeFz8/aHHaE2KddMbOPwKEaZIJvQyZegRK+la7qSCDhPTF2KJp+nJxJnYtj
         UKyhEXzxzAXz97GYWcEFWTiuT+N8t9p5z9TJhmO3guHixiPnKcOowNz1lJBk6WGMpeEy
         +z+XTnyieY8ZG2/zVLtHv6xxENfagcoH/i8mcddl4BkV1q3oYWr0HBU0HFSSrnOCRqDP
         3JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fedtuZxfy8Ocxg9jPE6FfUu7D50bZfVQXO7CcPYFPaQ=;
        b=rn5vjxvPWN5uzi7z0td46Z02SwXnA6vM/i5mo6/PDKXJaNmRHQOntnNWGBGwbj2QZL
         xZ50mUoa/+LfOqhhYQryBO64B191WJD5Rc8eHq8YcF+NpuBboPK4SSXtXWJiRWGJqOoR
         3Vjp+0ElG1Siw8Yo7/6PKWVP12OTAvY6UptgynToCVORo1gkVwmh+Uo2S5udI6yFLSq+
         SfJtj10MFI4nizhlj2+MPyptOTXhpBvhvUeYD88vBwpTiR3AUcWzOWGUMdcb9TwWcFWc
         p3nboMuW1qA8S5/aZyhnGfWPZSHYP0SDd+Pq1R2IG7CI0iilPoLWSoNgPURby3/XkdVc
         rRcQ==
X-Gm-Message-State: AOAM533NrnPn64s+rBwneCwQPdGVawpZ11k6lILdM21Aocvji8v9wgqo
	0eYU/0YqldMvbMvP6+1+KbM=
X-Google-Smtp-Source: ABdhPJzGeJ8N58vhk++ZAXYX5Lv+5Kzx3VLeM+YxCIh4Zoy9wuSoB5rbLnCj2HflWfzKKwIsvRl5Rg==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id v13mr116099pjj.138.1635269796433;
        Tue, 26 Oct 2021 10:36:36 -0700 (PDT)
Received: from ?IPV6:2405:201:d007:e827:784a:f821:cdd9:94b9? ([2405:201:d007:e827:784a:f821:cdd9:94b9])
        by smtp.gmail.com with ESMTPSA id l11sm1473285pjg.22.2021.10.26.10.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 10:36:36 -0700 (PDT)
Message-ID: <fc1d20ea-762a-f9cc-31e4-76737897a8e8@gmail.com>
Date: Tue, 26 Oct 2021 23:06:30 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: core: Refactor
 nested if-else
Content-Language: en-US
To: kushal kothari <kushalkothari285@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, hdegoede@redhat.com, marcocesati@gmail.com,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, Mike Rapoport <mike.rapoport@gmail.com>,
 kushalkothari2850@gmail.com
References: <20211026134253.7868-1-kushalkothari285@gmail.com>
 <84add494-6e39-cdd9-96c6-04a0245ae11c@gmail.com>
 <CALtHPQsh=0LyM3K9dn8d0X+n4gbx2TApF6k_WhpypHXGj6Hj-w@mail.gmail.com>
From: Praveen Kumar <kpraveen.lkml@gmail.com>
In-Reply-To: <CALtHPQsh=0LyM3K9dn8d0X+n4gbx2TApF6k_WhpypHXGj6Hj-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26-10-2021 20:00, kushal kothari wrote:
>> Can you please check if this works well. Thanks.
> 
>  checkpatch.pl again warns of
> "WARNING: Too many leading tabs - consider code refactoring"
> when adding another if loop on top .
> 


Thanks for checking. The whole intention was to reduce unnecessary memcmp.
These operations are heavy and performing same comparison twice, IMHO needs to be thought well.
But, I'll wait for others to comment on this. Thanks.

Regards,

~Praveen.



> On Tue, Oct 26, 2021 at 7:24 PM Praveen Kumar <kpraveen.lkml@gmail.com>
> wrote:
> 
>> On 26-10-2021 19:12, Kushal Kothari wrote:
>>> Refactor nested if-else to avoid deep indentations. There is no change
>>> in the logic of the new code, however, now it is simple because it gets
>>> rid of five unnecessary else conditionals and it combines nested if into
>>> single if-else-if. This refactor also leads to fix warning detected by
>>> checkpatch.pl:
>>> WARNING: Too many leading tabs - consider code refactoring
>>>
>>> Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
>>> ---
>>>
>>> Changes in v2: Fix the bug of not handling properly the else logic
>>> when p is not null in else-if. Also, reword the subject line and break
>>> it up at 72 columns.
>>>
>>>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 69 ++++++++-----------
>>>  1 file changed, 29 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>>> index 0f82f5031c43..267d853b1514 100644
>>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>>> @@ -1192,50 +1192,39 @@ unsigned int OnAssocReq(struct adapter
>> *padapter, union recv_frame *precv_frame)
>>>               p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
>>>               for (;;) {
>>>                       p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC,
>> &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
>>> -                     if (p) {
>>> -                             if (!memcmp(p+2, WMM_IE, 6)) {
>>> -
>>> -                                     pstat->flags |= WLAN_STA_WME;
>>> -
>>> -                                     pstat->qos_option = 1;
>>> -                                     pstat->qos_info = *(p+8);
>>> -
>>> -                                     pstat->max_sp_len =
>> (pstat->qos_info>>5)&0x3;
>>> -
>>> -                                     if ((pstat->qos_info&0xf) != 0xf)
>>> -                                             pstat->has_legacy_ac =
>> true;
>>> -                                     else
>>> -                                             pstat->has_legacy_ac =
>> false;
>>> -
>>> -                                     if (pstat->qos_info&0xf) {
>>> -                                             if (pstat->qos_info&BIT(0))
>>> -                                                     pstat->uapsd_vo =
>> BIT(0)|BIT(1);
>>> -                                             else
>>> -                                                     pstat->uapsd_vo =
>> 0;
>>> -
>>> -                                             if (pstat->qos_info&BIT(1))
>>> -                                                     pstat->uapsd_vi =
>> BIT(0)|BIT(1);
>>> -                                             else
>>> -                                                     pstat->uapsd_vi =
>> 0;
>>> -
>>> -                                             if (pstat->qos_info&BIT(2))
>>> -                                                     pstat->uapsd_bk =
>> BIT(0)|BIT(1);
>>> -                                             else
>>> -                                                     pstat->uapsd_bk =
>> 0;
>>> -
>>> -                                             if (pstat->qos_info&BIT(3))
>>> -                                                     pstat->uapsd_be =
>> BIT(0)|BIT(1);
>>> -                                             else
>>> -                                                     pstat->uapsd_be =
>> 0;
>>> -
>>> -                                     }
>>> -
>>> -                                     break;
>>> +                     if (p && memcmp(p+2, WMM_IE, 6)) {
>>> +                             p = p + ie_len + 2;
>>> +                     } else if (p && !memcmp(p+2, WMM_IE, 6)) {
>>
>> I would think of something,
>>
>> for(;;) {
>>         p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len -
>> WLAN_HDR_A3_LEN - ie_offset);
>>         if (p) {
>>                 if (memcmp(p+2, WMM_IE, 6)) {
>>                         p = p + ie_len + 2;
>>                         continue;
>>                 }
>>                 pstat->flags |= WLAN_STA_WME;
>>                 ...
>>         }
>>         /* Here we will reach only if p is NULL or its required entry */
>>         break;
>> }
>>
>> Can you please check if this works well. Thanks.
>> Also, wanted to check how are you testing these changes ?
>>
>>> +                             pstat->flags |= WLAN_STA_WME;
>>> +                             pstat->qos_option = 1;
>>> +                             pstat->qos_info = *(p+8);
>>> +                             pstat->max_sp_len =
>> (pstat->qos_info>>5)&0x3;
>>> +
>>> +                             pstat->has_legacy_ac = false;
>>> +                             if ((pstat->qos_info&0xf) != 0xf)
>>> +                                     pstat->has_legacy_ac = true;
>>> +
>>> +                             if (pstat->qos_info&0xf) {
>>> +                                     pstat->uapsd_vo = 0;
>>> +                                     if (pstat->qos_info&BIT(0))
>>> +                                             pstat->uapsd_vo =
>> BIT(0)|BIT(1);
>>> +
>>> +                                     pstat->uapsd_vi = 0;
>>> +                                     if (pstat->qos_info&BIT(1))
>>> +                                             pstat->uapsd_vi =
>> BIT(0)|BIT(1);
>>> +
>>> +                                     pstat->uapsd_bk = 0;
>>> +                                     if (pstat->qos_info&BIT(2))
>>> +                                             pstat->uapsd_bk =
>> BIT(0)|BIT(1);
>>> +
>>> +                                     pstat->uapsd_be = 0;
>>> +                                     if (pstat->qos_info&BIT(3))
>>> +                                             pstat->uapsd_be =
>> BIT(0)|BIT(1);
>>>                               }
>>> +                             break;
>>>                       } else {
>>>                               break;
>>>                       }
>>> -                     p = p + ie_len + 2;
>>>               }
>>>       }
>>>
>>>
>>
>> Regards,
>>
>> ~Praveen.
>>
>>
> 

