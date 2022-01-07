Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31683168
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 11:15:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id p13so14252434lfh.13
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sEQUWH9+nKsbSRBifAxPqas320XSmelj+qMN3565rLM=;
        b=FXQotnz+fUgxzX1zUd3uGAMbEY4zNBz/nechr9w9/T4JpGKUEcp4sBwpPkuHnY9qUV
         aYjLjO7sTq1lkLnv61q9wwNk0kyfLcVakc5Bc9yOD2tJyixlFVMHgB+JtuRYBLuAG9Jx
         IYxNx+3r74nLzA7LYuU9ZXsAO8JGrj/feWGGI4W/OjlmyRwcY6IQG+ZiotYtODHzYykp
         jEiDS9RLfcQopS8daxshyhNQPfh6ojIFR6JQ6fU0/zAwxS1W4FBHf1uCRBi7OPg2TZ7f
         l6I+c3GRRdV6W0etHxl7v9g9q+QQTqsK7tZTxfmgoG/i+HzoSikktjKxa9LMcUaSRLZ5
         LFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sEQUWH9+nKsbSRBifAxPqas320XSmelj+qMN3565rLM=;
        b=lY+w9OUUaxaGw5tKKGMQK7wKb/Qh4TC/3KVrVP6Ufgtpjsb/ByXJ74jxHcpiTcFFEw
         1vMIJA8u1ugbZvvj/KyyLGDAqdmNkAvhpMNMzp4hYdllbZmmOdRkjggdQ2YyNbx1JtjL
         OVOqyVqdLN5x+VteyPyDxGGJwjjFlQLsOSFcE2w3hCabLFSO+vF84AkhBtihfOgos7X8
         ekjsIFNTBYckW9CNPwuzy2NKAYolNYd/oNxgx5sy4d7iCiQUn6JrJ6T5xoLkehjAyzqU
         qgbKjbA3sQicNpH/CJMJFbnUUvj8fMm9bKrp+McRDg66xkT0kq39y0SAiSHfWU4+JeCt
         0NPg==
X-Gm-Message-State: AOAM532FK4rn5c4+E4SmWGZ+xDVEweXadXF0Urzs0kJ4vjNeR3oZZbLY
	+AYD4+XpjIyQ7Qh/Hzr06zw=
X-Google-Smtp-Source: ABdhPJxIcgwo9lOVSrBRjkS41885ithJPKjhvhDFlSQ4rNqGOzo5YBEPtbFEnM6vF5DNUhvCelM7tA==
X-Received: by 2002:a05:6512:3f8f:: with SMTP id x15mr26125125lfa.90.1641554121255;
        Fri, 07 Jan 2022 03:15:21 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.67])
        by smtp.gmail.com with ESMTPSA id y2sm569029ljp.20.2022.01.07.03.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 03:15:20 -0800 (PST)
Message-ID: <ca0548c0-b36c-98dc-3e49-b629b3d3fb6a@gmail.com>
Date: Fri, 7 Jan 2022 14:15:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 03/19] staging: r8188eu: release_firmware is not called if
 allocation fails
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220107103620.15648-1-straube.linux@gmail.com>
 <20220107103620.15648-4-straube.linux@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220107103620.15648-4-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 1/7/22 13:36, Michael Straube wrote:
> In function load_firmware() release_firmware() is not called if the
> allocation of pFirmware->szFwBuffer fails or if fw->size is greater
> than FW_8188E_SIZE.
> 
> Move the call to release_firmware() to the exit label at the end of
> the function to fix this.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index dc41682fd8d6..cfafbb6c42f7 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -538,10 +538,10 @@ static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
>   	}
>   	memcpy(pFirmware->szFwBuffer, fw->data, fw->size);
>   	pFirmware->ulFwLength = fw->size;
> -	release_firmware(fw);
>   	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", pFirmware->ulFwLength);
>   
>   Exit:
> +	release_firmware(fw);
>   	return rtStatus;
>   }
>   


This patch looks like a bug fix and it should go to stable kernels as 
well. The problem is this patch is made on top of 2 previous clean up 
patches, so it can't go to stable as is.

I think, the less painful way is to move this patch on the first place 
in this series. On the other hand you can just resend this one separately.


Or, maybe, Greg knows some magic that will help here, we can wait him 
before you resend 20 patch series :)

If you will somehow resend, please, add following tag:

Fixes: 8cd574e6af54 ("staging: r8188eu: introduce new hal dir for 
RTL8188eu driver")


Thanks for you clean up work on this driver!


With regards,
Pavel Skripkin
