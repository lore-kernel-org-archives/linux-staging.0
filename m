Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3B168
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 04:15:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id e65so14014715pgc.5
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 20:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0vTb2Eh26EDQpQcNXEmLn0oGcTGvpNGAV1iupzbirMM=;
        b=b7D2TToafJTPLm0i63Nn6QpKsrHmIbUzDnzU1fD92pSo3LOwtwXKUwZSrjsBqBCv/O
         TPaxhtp/XBjQpIl+0xzjzvDM9dZLu0MTUUk3sqMdpH+Y3CtLKjSRhHPPZdAd13RMvD4b
         d7azvHwMg7DLMzI6nBC2uQO0dIRezB+FODr+Umc+reQPp+L9iaC/njLKB/NiraDcWOOe
         eTTlEx8kG8SFY1U2BQ9wOH3Zksc+ud9gLSLum/uyQ4SW6xEGzGwT1ltqexc2WjvkdlDP
         BjYyOZ3oHv42EzQTdHeO128VA48Yo1XSsjbnTmQj+UehqsBODpSKSH0oCPjlaKkA56Cf
         k35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0vTb2Eh26EDQpQcNXEmLn0oGcTGvpNGAV1iupzbirMM=;
        b=oD0PowDUmjs6a4qBbDp6YTb8odYdhEZXBQAsmSzupYqudfWIm8oU3LQR37E4n+tHk1
         fjZNb/hdtV4mJBmXANzTaQs7ziXygoIGoAoDJJQmtvEk7P7fVkdjaAvR1Cs3bvhimayW
         JRsw0i8Rn6YvY/kqW8DRNswvw7d0TiUyfMUfFd6z3Nss1jqaBRBQyk9aRJyEhpaXP8Xf
         8gK5dZiWq9DWrdpt6CThU6PKTZV+yXOtibGKZYee1rIU0tguLDO0a49PcxUz0ZMul53+
         L3Sav0jIeiA1YEeXwpTzZ+YPIbV4VA4kWzE2T5Lk8kqc9Nj/08IWT+g8gDecUh/D6UOC
         GQtQ==
X-Gm-Message-State: AOAM530VPSMPv8yLWhtHdSaNVAoyMwze6oc4C7J85M+4o5b36bYwB5/T
	UX2hzKfwiGULBEbTfEz5SvA=
X-Google-Smtp-Source: ABdhPJyPWcaTTgqdCleaOpm+cehsHuGg/TzMXEj+bFjeOv2cr0G86yWMVT6bGW4mYgN1FAC9oXbYlA==
X-Received: by 2002:a63:8742:: with SMTP id i63mr43016950pge.282.1636344910874;
        Sun, 07 Nov 2021 20:15:10 -0800 (PST)
Received: from [192.168.1.2] ([59.88.109.27])
        by smtp.gmail.com with ESMTPSA id y32sm14997687pfa.145.2021.11.07.20.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 20:15:10 -0800 (PST)
Message-ID: <24befb64-0fdc-03ab-5a9a-c7be443be1a1@gmail.com>
Date: Mon, 8 Nov 2021 09:45:05 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: rtl8192u: remove the if condition without effect
Content-Language: en-GB
To: gregkh@linuxfoundation.org, kuba@kernel.org, lee.jones@linaro.org,
 nathan@kernel.org, clrrm@isep.ipp.pt, johan@kernel.org,
 dinghao.liu@zju.edu.cn, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YYijapuGOmObwM3S@Sauravs-MacBook-Air.local>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YYijapuGOmObwM3S@Sauravs-MacBook-Air.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/11/21 9:41 am, Saurav Girepunje wrote:
> In function rtl8192_adapter_start priv->pFirmware->firmware_status
> is assign to FW_STATUS_0_INIT just after assignment variable is
> again get check for same value. Therefore if condition will be
> always be true. So remove the if condition ,else if section and
> else section which will never get execute.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 726d7ad9408b..f5d9e81f4ac7 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -2666,14 +2666,7 @@ static bool rtl8192_adapter_start(struct net_device *dev)
>  	/* config CPUReset Register */
>  	/* Firmware Reset or not? */
>  	read_nic_dword(dev, CPU_GEN, &dwRegRead);
> -	if (priv->pFirmware->firmware_status == FW_STATUS_0_INIT)
> -		dwRegRead |= CPU_GEN_SYSTEM_RESET; /* do nothing here? */
> -	else if (priv->pFirmware->firmware_status == FW_STATUS_5_READY)
> -		dwRegRead |= CPU_GEN_FIRMWARE_RESET;
> -	else
> -		RT_TRACE(COMP_ERR,
> -			 "ERROR in %s(): undefined firmware state(%d)\n",
> -			 __func__,   priv->pFirmware->firmware_status);
> +	dwRegRead |= CPU_GEN_SYSTEM_RESET; /* do nothing here? */
> 
>  	write_nic_dword(dev, CPU_GEN, dwRegRead);
>  	/* config BB. */
> --
> 2.33.0
> 

read_nic_dword function call also does not update value of priv->pFirmware->firmware_status.
read_nic_dword return a value that never check by any caller function.
That can cover on another patch.

Regards,
Saurav
