Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152F72
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 08:21:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t8so14790284wrq.4
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uciQn968xz5iDfDj/cdHt3DpJ9m830OzWZsXI8bgxYE=;
        b=hFym1PO+8s2sLQQA3XAlERKOx7IFza3NXKW6Fe1BO8Hm0OhBfydwrf7XXa+CmHp/hS
         MUmUuY6ASrAPAKKelv8bRyGmNh+jI8Vj9kftOSYqfMNUlhG1UgGPmj8PbII5d6uMl/5n
         agvO/1yKrH8iLWKZmfkBS8rHsxjERbH7+VjOzv0698dNt2Ewj1Qf8qXRnhkR3v+Y+qbJ
         6soY95l95zGnWOAJy8BSgCUu1VOMaG29eU2OoeB61LA6dxvqAg4UdBQKw2Sb8qi15xKJ
         bRM7f4KtjQk3jSTzrmaFpuCyzkWUI6IEcQdBiQxyv+Zo2hYXh/rLODkulmKQkF9nJ8Kb
         6XfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uciQn968xz5iDfDj/cdHt3DpJ9m830OzWZsXI8bgxYE=;
        b=T2N5EhW7WlGf+gZ5PMiDR3Ub8UB+GrMNBi7yXTT5GbKGc803EgL4KGc4DoHUVSeD6v
         FnEOvhEGXGmfMkVTYODf7S4YsY67LEMi5IkcLs0HII3i7Sgw7EQIwT8h4lskkmtk9X9S
         CPt+aOKrVlHdiVJQxImzUdx/Kl6553hbWDaRaQ8BtQJF23I6fFrTmhco+FzmDiUsOt8i
         btF4BBabJtv96Ymsz2e9bR2FE2L0/GBEnCY17zA5qkb7HDH5zUQjYPofhaV+AOSVMh1n
         CG30Aa7G3hzDpsqivKicgv6Vhh82eOK+qYfkxqaO8VvvSwqKtTPwpJ11hbfluA0UTHXn
         uSRA==
X-Gm-Message-State: AOAM532Iuby5vEN4zQjtM4BN+ICIg4bSu+mhLNMJrKWxVW8ktXs20Qxj
	scj+3mGPdH64Wb85S/ov4R0=
X-Google-Smtp-Source: ABdhPJxpHXYA7DekL4S6yicpqOuD3n++miuIYlYENlMIha7KctYNaqHmP6Z+xq7d776JpJjRjEUKxA==
X-Received: by 2002:a5d:58c9:: with SMTP id o9mr3601080wrf.279.1632385295450;
        Thu, 23 Sep 2021 01:21:35 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cad? ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id o24sm8103387wmm.11.2021.09.23.01.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 01:21:35 -0700 (PDT)
Message-ID: <2d2b1e72-9c74-a2c3-2fb7-dc0ec41bbe03@gmail.com>
Date: Thu, 23 Sep 2021 10:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 6/8] staging: r8188eu: remove dead code from
 rtl8188e_rf6052.c
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, martin@kaiser.cx, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210921194658.10654-1-straube.linux@gmail.com>
 <20210921194658.10654-7-straube.linux@gmail.com>
 <20210923072929.GA2048@kadam>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210923072929.GA2048@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/21 09:29, Dan Carpenter wrote:
> On Tue, Sep 21, 2021 at 09:46:56PM +0200, Michael Straube wrote:
>> In this driver DynamicTxHighPowerLvl is set to TxHighPwrLevel_Normal
>> and never changed. In the file rtl8188e_rf6052.c there are some if
>> statements that check DynamicTxHighPowerLvl for other values than
>> TxHighPwrLevel_Normal. The code in the if blocks is never executed.
>> Remove the dead code.
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 57 +++++--------------
>>   1 file changed, 14 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
>> index edaa9a6dfdb1..946a1b97d96f 100644
>> --- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
>> +++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
>> @@ -85,7 +85,6 @@ rtl8188e_PHY_RF6052SetCckTxPower(
>>   		u8 *pPowerlevel)
>>   {
>>   	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
>> -	struct dm_priv *pdmpriv = &pHalData->dmpriv;
>>   	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
>>   	u32 TxAGC[2] = {0, 0}, tmpval = 0, pwrtrac_value;
>>   	bool TurboScanOff = false;
>> @@ -112,34 +111,19 @@ rtl8188e_PHY_RF6052SetCckTxPower(
>>   			}
>>   		}
>>   	} else {
>> -		/* Driver dynamic Tx power shall not affect Tx power.
>> -		 * It shall be determined by power training mechanism.
>> -i		 *  Currently, we cannot fully disable driver dynamic
>     ^
> 
> You're a vimster.  :)
> 

Not really, actually this was part of the original code. ;)

Regards,
Michael
