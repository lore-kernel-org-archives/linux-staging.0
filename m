Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D22FAD
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 07:06:28 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id dj8so22294108edb.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 00:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fdL9A5Bks/5vn8JW+16em0duE4n+ssWkWG29OSq8opQ=;
        b=hWvl9c8Rgr8vY8JdclfWv1qbJY2E4lZuTXn26Se5+G+3LnfMgZK4uefrOizvC+zUiS
         5+esBDdQSFgJv5Eb4zpF0Ju3h5/TtH3BexC/gjmjrNZjX3W99Q6ji7h+CC2JjAjpZhOg
         Xd4zVICAEh9KOdPq/rmRo73HoqXXq81bXdFNKggciv37NJB86OBbfEvKl2EdIPI92tGE
         bJ6d1AmqfHGUWtGbKVUgNneRKCF4sTunBjJa7gs8LqxyVzvL8QTGnMl78rLA3DjmJeuF
         7sL8GqZiKRZWl9eERdNAOQUo/nmCBDcXM+CpK/FccRVEjsQ5HzIf8hnTVtOT4Epu0yjS
         dG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fdL9A5Bks/5vn8JW+16em0duE4n+ssWkWG29OSq8opQ=;
        b=WUjyLhcmreUP353rcart0oT9XS8nuRowvEEKgkiD7Gydm1HN4QqHXOPwZDYZbpbHZ5
         XzEED3QE2Ldzd5AzRQCT6v1hMviES1JbHaw/CqnDNxruAPF11XmLkMmW/OR5Qt8x0kjL
         ShBmh5bui8nUGcU2Ig3vX7og8WAt9l4Y6e9JsveBeq4ITV0Wx0tTN3fcRC+4rvYJCvLk
         CZZUiESkQccWN4igUIfJctI0B69+Fi/lwpb2ihiuiu984RdntOJhO3VSJVK8vs98MCIN
         qeO84XcNQg9fUBLlaTobyNWod80hslmTFQO6zbzkEeBcSy/25zsyc1L/ttjvKV49ALwB
         Lbjw==
X-Gm-Message-State: AOAM531p0MoC54RMwciTRqC2rmA7o83HeSejWIU08kPdGC74oMUZk2td
	myxCmgFIcycXOiiMhd0nhoI=
X-Google-Smtp-Source: ABdhPJwnQ9Dh7+zxTZOrs8Q9WHObL4l1Kc5BlXa87CNnS0HDxNe7IwBWRRWYOGF+jMkIPaAIwCWAaw==
X-Received: by 2002:a05:6402:1850:: with SMTP id v16mr2565716edy.308.1629183986886;
        Tue, 17 Aug 2021 00:06:26 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::4058? ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id l16sm354923eje.67.2021.08.17.00.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 00:06:26 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] staging: r8188eu: perform cleanup in
 rtl8188e_Add_RateATid
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, martin@kaiser.cx, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210816234459.132239-1-phil@philpotter.co.uk>
 <20210816234459.132239-4-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <d9a12b30-07bf-0c73-4a32-b2f4703998f3@gmail.com>
Date: Tue, 17 Aug 2021 09:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210816234459.132239-4-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/17/21 1:44 AM, Phillip Potter wrote:
> Perform some cleanup items in the rtl8188e_Add_RateATid function:
> (1) Rename variable shortGIrate to short_gi_rate to comply with kernel
>      camel case rules.
> (2) Introduce additional whitespace around certain operators in the
>      function, to make it clearer what is happening.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> index 77c057e276a5..8d03b24dc5af 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> @@ -155,25 +155,25 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
>   {
>   	struct hal_data_8188e *haldata = GET_HAL_DATA(pAdapter);
>   
> -	u8 macid, raid, shortGIrate = false;
> +	u8 macid, raid, short_gi_rate = false;
>   
> -	macid = arg&0x1f;
> +	macid = arg & 0x1f;
>   
> -	raid = (bitmap>>28) & 0x0f;
> +	raid = (bitmap >> 28) & 0x0f;
>   	bitmap &= 0x0fffffff;
>   
>   	if (rssi_level != DM_RATR_STA_INIT)
>   		bitmap = ODM_Get_Rate_Bitmap(&haldata->odmpriv, macid, bitmap, rssi_level);
>   
> -	bitmap |= ((raid<<28)&0xf0000000);
> +	bitmap |= ((raid << 28) & 0xf0000000);
>   
> -	shortGIrate = (arg&BIT(5)) ? true : false;
> +	short_gi_rate = (arg & BIT(5)) ? true : false;
>   
> -	raid = (bitmap>>28) & 0x0f;
> +	raid = (bitmap >> 28) & 0x0f;
>   
>   	bitmap &= 0x0fffffff;
>   
> -	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, shortGIrate);
> +	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, short_gi_rate);
>   }
>   
>   void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
> 

Perhaps the added spaces around operators could conflict with
pending patch sets that address spacing style issues, otherwise...

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
