Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B068
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 16:30:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 127so20067543pfu.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 09:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pfwgbe2ksFAA3UJkUKv7Buq35y1OMHoVJCtwm+mmfws=;
        b=DtmfFBw1GdShKLk7kJwiwEjT73512QMSF3A/yBK1FObyez5Kx59YSwT8B8T3reAsNp
         EqSe5UmDrEFGmBbnY0Y/S0eb4/K1RGkyPvpEsTN/MaLEIwichvvw3fnGytsQFmAkPekH
         G7KeUly6c1LoevgzNPdH1TgbxeDZfTG7yWRIjVRVRtx306vj/Gk1a9oA1KMqM2KkMWLD
         mKLqGbfqd20v5NJLB1DHkWxIVCmRUKT+8f+nOUR13nqm5eQDJuszc7lHxW27iz3AIwaE
         5z/bVzewT+CitSAZX4ArqNCWlI0xVhKfwdp83Ae94i8g54dtyQ7sMqMZ9fQeaqCn4G1v
         lL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pfwgbe2ksFAA3UJkUKv7Buq35y1OMHoVJCtwm+mmfws=;
        b=cQDd+eb5Sjjka1IuJyNUFpEpN/MZc6X/CYTJY5pPMIM2EsoXpUr/CeivhVXaR/atIt
         S3wb00Kxl6rXFedotfhEbSTVT7yn/sQEA/4U4O2+dSBHy3okBPq1KtHI2iPzi6kY6602
         1Yw/Upt1XDP08cUHWsIcjGvSzHWEBdrwECsknWH+9HPd6635gQRArgEaaREDp6MIC6It
         2w+EwfmmTNe0eRn66Og0gwDPiNBRJlh0+aH4T2awH5yUX6tLx6MtIndo8fcdmOdwtHQW
         gYr91RUaR9zLgkLsg1U+J+Umxn+s9E6bhZNm/T+QK7oPsoCZ9SMeMkh62BfzQalzTW6k
         FB4Q==
X-Gm-Message-State: AOAM531307eMvhvrpLL6cu1JbdSNV0ZCaewcoqBpDfpkQyov5fmgnVDg
	UI/budIuSdkC3kejNwuPeOY=
X-Google-Smtp-Source: ABdhPJwKUqqfB/vDdiLKQ/5v2QLyxMDw4R1pMy9hzE0DiaKGH4dEzcyqIbaUAEk3/BayGvKaSpZK6w==
X-Received: by 2002:a05:6a00:1312:b0:44c:becf:b329 with SMTP id j18-20020a056a00131200b0044cbecfb329mr37976011pfu.5.1635870624634;
        Tue, 02 Nov 2021 09:30:24 -0700 (PDT)
Received: from [192.168.1.2] ([59.95.93.69])
        by smtp.gmail.com with ESMTPSA id s22sm18820163pfe.76.2021.11.02.09.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 09:30:18 -0700 (PDT)
Message-ID: <9bbc97e2-ab20-efb4-d055-ebce021b7c97@gmail.com>
Date: Tue, 2 Nov 2021 22:00:06 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
References: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
 <YX/lJMEfqXqlserL@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YX/lJMEfqXqlserL@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/11/21 6:31 pm, Greg KH wrote:
> On Sun, Oct 31, 2021 at 11:40:18PM +0530, Saurav Girepunje wrote:
>> Remove the goto statement from rtw_init_drv_sw(). In this function goto
>> can be replace by return statement. As on goto label exit, function
>> only return it is not performing any cleanup. Avoiding goto will
>> improve the function readability.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>  drivers/staging/r8188eu/os_dep/os_intfs.c | 39 +++++++----------------
>>  1 file changed, 12 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
>> index 1418c9c4916c..4b409479108e 100644
>> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
>> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
>> @@ -480,48 +480,34 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
>>  {
>>  	u8	ret8 = _SUCCESS;
>>
>> -	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
>> -		ret8 = _FAIL;
>> -		goto exit;
>> -	}
>> +	if (!rtw_init_cmd_priv(&padapter->cmdpriv))
>> +		return _FAIL;
>>
>>  	padapter->cmdpriv.padapter = padapter;
>>
>> -	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
>> -		ret8 = _FAIL;
>> -		goto exit;
>> -	}
>> -
>> -	if (rtw_init_mlme_priv(padapter) == _FAIL) {
>> -		ret8 = _FAIL;
>> -		goto exit;
>> -	}
>> +	if (!rtw_init_evt_priv(&padapter->evtpriv) || !rtw_init_mlme_priv(padapter))
>> +		return _FAIL;
> 
> These are functions that are being called so keeping them separate as
> the code you removed did makes it "obvious" what is happening here.
> 
> So can you keep it that way please?
> 
I will make them separate as they were.

> But my larger question is do these functions create state or allocate
> memory that needs to be unwound properly if an error does happen?  Right
> now the function seems to not be doing that at all, but that does not
> mean it is correct as-is...
> 
> thanks,
> 
> greg k-h
> Regards,
Saurav

