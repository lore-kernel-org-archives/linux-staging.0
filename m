Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D372FAF
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 21:04:57 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id r3so4061032ljd.7
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HaUZAl6YfbHEQXiaIPa4mpZAp8nomzN9ZpQ9paddnxg=;
        b=P19vffmlkG1iJCTLs0sNasiEJUWVb3TPMdRDwEmxSbxScZ2NxMpIWzrSVF4JHrBPRe
         s3uiuRHwGScr2zQfomAlm9XfmvNZpibBT26naIE1Rb45EHMNr6oHnwNUuF0UthIpwSI5
         EKjtnFKrkm4CpDAjx+5OpK+zFIualtjiWo+cd+fprvcDWNnPEsvWBqsFYr/v7vfwMnYK
         ldO1b4TnQUeWbMKpAjsM+0jNft5X2r4HTHd59xA12FlwSTfBDEJPqkpOUfDr/fRipPgX
         HOK7tm0w4e3B9sTT1Mz67tQCxm0GCbZpoIPPNGcIKmZSxcWKRbjjKht7/be0pXDhTJLS
         rmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HaUZAl6YfbHEQXiaIPa4mpZAp8nomzN9ZpQ9paddnxg=;
        b=PIn5JNyPCnygjJihTqv3zI8hhdDO+A+48c01CZXypVpHUYQP9cf8y1INpFy7wrr4DB
         eA6HLZ9yTYwe3g8G6zvSZwKydp+sxrhWF9M6kn6nhyywA2iXPSC701/3bfhd/xIzN24L
         3e2kRqhkOxcz6gWE1xTbjA63y9JFydQTbe+03D02+oWe31h+1wPgfxkdQHLDGIBZojH8
         FEjg3vmPvh4Nt4YkojTUcJ7CKtu/Z2l4a8cd03zWIbHa7Qpvwxz0iHDfE9QXt8f0wjKQ
         0ngC/ksIGYn4sSXwtAgz9CI/Rx2kexPsQ/q8FSWLCdiXkQ0UaM1B/cV7PSek8DCy+iwk
         +/Zw==
X-Gm-Message-State: AOAM530T2c7r6o9/cFdpBxKobaiSlP7l9jtdcciK4OVzh5uAzHu2gb10
	sFWJe0ezP8Ym9dYvcQV7Ze0=
X-Google-Smtp-Source: ABdhPJxmM9jEolg3xExHgCFocx8NEIVlwbyAXz0ed+AqfNbI+CV310rzPcZkV8LG0jxUerhnAQ+R4A==
X-Received: by 2002:a2e:a810:0:b0:253:cb18:9058 with SMTP id l16-20020a2ea810000000b00253cb189058mr6528817ljq.12.1653080696019;
        Fri, 20 May 2022 14:04:56 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id i19-20020a056512007300b0047255d210d5sm791887lfo.4.2022.05.20.14.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 14:04:55 -0700 (PDT)
Message-ID: <44d12b0f-3ce0-42d2-a475-31d70dd4d699@gmail.com>
Date: Sat, 21 May 2022 00:04:54 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] staging: r8188eu: remove include/rtw_debug.h
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com, martin@kaiser.cx, saurav.girepunje@gmail.com,
 abdun.nihaal@gmail.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20220519221047.6940-1-phil@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220519221047.6940-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 5/20/22 01:10, Phillip Potter wrote:
> Remove include/rtw_debug.h, as all it now has are:
> 
> (1) A load of unused preprocessor definitions that expand to BIT(x)
>      variants.
> (2) A preprocessor definition that expands to the name of the driver
>      and is only used in one place inside a pr_info_once call in
>      core/rtw_fw.c.
> 
> It is now surplus to requirements after fixing up the few places that
> include the file.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/core/rtw_fw.c        |  4 +-
>   drivers/staging/r8188eu/include/drv_types.h  |  1 -
>   drivers/staging/r8188eu/include/rtw_debug.h  | 45 --------------------
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c |  1 -
>   4 files changed, 2 insertions(+), 49 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/include/rtw_debug.h
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
> index bf077876ed3d..0451e5177644 100644
> --- a/drivers/staging/r8188eu/core/rtw_fw.c
> +++ b/drivers/staging/r8188eu/core/rtw_fw.c
> @@ -259,8 +259,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
>   	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
>   
>   	if (IS_FW_HEADER_EXIST(fwhdr)) {
> -		pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
> -			     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
> +		pr_info_once("R8188EU: Firmware Version %d, SubVersion %d, Signature 0x%x\n",
> +			     le16_to_cpu(fwhdr->version), fwhdr->subversion,
>   			     le16_to_cpu(fwhdr->signature));
>   

What about converting this macro to dev_info_once()? IMO, looks cleaner:

[   27.985218] r8188eu 2-1:1.0: Firmware Version 11, SubVersion 1, 
Signature 0x88e1




With regards,
Pavel Skripkin
