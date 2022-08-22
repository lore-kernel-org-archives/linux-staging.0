Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D54A02
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 17:59:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id h5so13383025wru.7
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7yBJRGwvl/pzUs+EDHj7+n2SkDx+t8AASlR3dqtZZaU=;
        b=YrTEYKKZZJ4+AKSYYoKlNFNH/p/HLBInnCt9pvlW0TOn3RykpWYHy34gjepSzQZY7R
         Yv7//FXhXGLAk+nHdErdXid773KJEqpXbQ3V7zZoD77P3KYy25Xb5dbumGodd1uCgAVT
         DXVyeMdRK+clNTwopsLiF0MzjeDfIaiUspH4h3vB+OcwBNn68ZPIC00EK/MA70F/v3Z8
         +1+l3Duh0ZbIxXAzlF5zScOTz1q4UY0FXnf9iFlZwJfQIS34YFtOubfJ4P1GYK1EPq3a
         aLhk0jo/R7tLEzIWKW5sgPe0JOVORpSQnhj+tNR8BfVTLLffCJM1pTSRWul4Mke3e5OU
         yu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7yBJRGwvl/pzUs+EDHj7+n2SkDx+t8AASlR3dqtZZaU=;
        b=yuOA3vj87jO1jXV28mbdusfC+tjmqJnci1E33V4ldDys9o6h/Tx4ZNFlTtMkwxasuh
         BmyWMG/Z1rJCTPKXn1UwuMecbk62ABzm99zAZ6ZVdkrJOm2wFp9q9xp5rcGrXj3ZOpcy
         m50njRtOxNeQoitxTX9Q+uJI/Q+OF/M8pwdlmOQgCCnLlWZzuz/Qpc2le370QKxl92Rv
         1xT2lKd4+LVx6K61wX//LHLOM3aF34iJhxFyT6AlP/0VfAm/eg/j4O5k953fV16YhMjz
         S3r7M+CDiU9pWX775EAWEYUQbKOfpJJ+s3O2SgtJrGLqRYFdk/TJHXbTGCXD8zXN/7Gd
         mDkg==
X-Gm-Message-State: ACgBeo0PRUW7RgLAMJB9Tuzm16nbiMwdUN8G+lTnDhO4i11xbc2S7a7Q
	T/pbKbLaYAnJbqot4xStKuE=
X-Google-Smtp-Source: AA6agR54fhx4TBdfypPsE0ikMuSvjARjCrHEb/YsmcAd6NF2wc6qTzPphSV/Qw7BzJQhbB9NLke3pQ==
X-Received: by 2002:a05:6000:156b:b0:222:c789:cb2d with SMTP id 11-20020a056000156b00b00222c789cb2dmr11648628wrz.197.1661191172237;
        Mon, 22 Aug 2022 10:59:32 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id r38-20020a05600c322600b003a2e92edeccsm17150184wmp.46.2022.08.22.10.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:59:31 -0700 (PDT)
Message-ID: <5102d3a2-56b1-7111-72c9-905cd56f86bf@gmail.com>
Date: Mon, 22 Aug 2022 19:59:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: remove unused module parameter
 rtw_chip_version
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220821123138.8070-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220821123138.8070-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/22 14:31, Michael Straube wrote:
> The module parameter rtw_chip_version sets the chip_version field of
> struct registry_priv but that field is never used in the driver code.
> Remove the unused module parameter.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/include/drv_types.h | 1 -
>   drivers/staging/r8188eu/os_dep/os_intfs.c   | 3 ---
>   2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
> index 79351b3aa60d..1bd0c8f3a358 100644
> --- a/drivers/staging/r8188eu/include/drv_types.h
> +++ b/drivers/staging/r8188eu/include/drv_types.h
> @@ -37,7 +37,6 @@
>   #define FW_RTL8188EU	"rtlwifi/rtl8188eufw.bin"
>   
>   struct registry_priv {
> -	u8	chip_version;
>   	u8	rfintfs;
>   	u8	lbkmode;
>   	u8	hci;
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 2d2a1c27d433..dd4e6aac3509 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -22,7 +22,6 @@ MODULE_FIRMWARE(FW_RTL8188EU);
>   #define RTW_NOTCH_FILTER 0 /* 0:Disable, 1:Enable, */
>   
>   /* module param defaults */
> -static int rtw_chip_version = 0x00;
>   static int rtw_rfintfs = HWPI;
>   static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
>   static int rtw_network_mode = Ndis802_11IBSS;/* Ndis802_11Infrastructure; infra, ad-hoc, auto */
> @@ -104,7 +103,6 @@ char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac
>   
>   module_param(rtw_initmac, charp, 0644);
>   module_param(rtw_channel_plan, int, 0644);
> -module_param(rtw_chip_version, int, 0644);
>   module_param(rtw_rfintfs, int, 0644);
>   module_param(rtw_lbkmode, int, 0644);
>   module_param(rtw_network_mode, int, 0644);
> @@ -151,7 +149,6 @@ static uint loadparam(struct adapter *padapter)
>   {
>   	struct registry_priv  *registry_par = &padapter->registrypriv;
>   
> -	registry_par->chip_version = (u8)rtw_chip_version;
>   	registry_par->rfintfs = (u8)rtw_rfintfs;
>   	registry_par->lbkmode = (u8)rtw_lbkmode;
>   	registry_par->network_mode  = (u8)rtw_network_mode;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
