Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE033D2
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 17:24:40 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id j17so24628314lfr.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 09:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BufMsqlOmmyRV+XDYJhsyo4WkH0AKxC4lBAUlIrdNpw=;
        b=EjhiTHwgsLYT1dXXadNVuaLrEVqPaKDgcEk/n7llNSw4fOryw6ICtE72kHW7R4Nv1G
         xPJhEk3Ul+t5OPL2no5zC6lqaGrTYmNcEIHe+9YAtUaaUrUraNfYIa7htYIQ0QpYL6hF
         j/B4NujczzQGVUYvRfdA/NxTD5rHNJSiaXX6Sz7CE/Pm2S1+RRKv5YqKedMbvLKhZGsY
         VlxRjb0hEAOTGYrk93bdIGQKKqSTmTEz0U2tec/q69YaUizsmuCM+HlX9G4fUCXAaTvG
         rzB5CrEDDlzGtz23bsLMEkuzJdrZZuT2VHvvvnjMdcOY8u1U9t4JgHR8zdOpefZo5WVV
         421g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BufMsqlOmmyRV+XDYJhsyo4WkH0AKxC4lBAUlIrdNpw=;
        b=LtVvOUAp0RziToR+b8342z9lUqgujUTRXS3DE+qVXxFef13DOHoVJEc4P6eba01vND
         iAf7xoGDnEQAWy2yy9jPpcLCTWnw0qw89nE4NtWDmwO6icTrH4R+knFt0x6hkK27oF4D
         0msHtjPGyGxWS7/dk3goRFFzB62wxHbzSH+Z1tiO2CPu9QHmKh/yVVtiPkVTo+Dphnbm
         SCQLqxv1Noc59HFb8QGGgEAJs60T1Tv11iegORtXSI0nfbcOKK3juqDLNFsoHqRLt7Xd
         BqRjApBnWnKZuZ9Y+PCiotpn2y4d0M1Lo+qg9kvC+QSLnwArSdXL7BstER5FOWKfV2uW
         7ljg==
X-Gm-Message-State: AFqh2kol5tcXSGYugR9bu6aiySZXs/gqq2v/ohRbYJa/e1SWb0sgNwmG
	N0/+7kfK/9Lqlf/ZLap4BeA=
X-Google-Smtp-Source: AMrXdXujTyNtlst9+CBaQp6G4ZsaUKLRlM/diN5BcAsJA2TLQFc9R4ywslpUwNMPu5s6kDpNgBpuZg==
X-Received: by 2002:ac2:43a4:0:b0:4cb:3a60:65cc with SMTP id t4-20020ac243a4000000b004cb3a6065ccmr9145712lfl.5.1673457878294;
        Wed, 11 Jan 2023 09:24:38 -0800 (PST)
Received: from ?IPV6:2a00:1370:8180:6b00:a1a8:4887:1af4:637a? ([2a00:1370:8180:6b00:a1a8:4887:1af4:637a])
        by smtp.gmail.com with ESMTPSA id q6-20020a056512210600b004aa0870b5e5sm2817544lfr.147.2023.01.11.09.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 09:24:37 -0800 (PST)
Message-ID: <bfbdb94f-c965-0b07-3539-c1a057e5b0b4@gmail.com>
Date: Wed, 11 Jan 2023 20:24:37 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] staging: r8188eu: always process urb status
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230110205626.183516-1-martin@kaiser.cx>
 <20230110205626.183516-5-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20230110205626.183516-5-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <martin@kaiser.cx> says:
> Remove the if clause in usb_write_port_complete and process the urb
> status regardless of bSurpriseRemoved, bDriverStopped and
> bWritePortCancel.
> 
> The only possible results of urb status processing are updates to
> bSurpriseRemoved and bDriverStopped. All of the three status variable are
> set to true only if the whole USB processing has to be stopped (when the
> driver is unloaded or when the system goes to sleep).
> 

Not sure if it matters but we still have that weird rule that after 5 
failed usb read/writes bSurpriseRemoved will be set to true

Maybe also worth removing above logic?


> It's no problem if one of the "stop everything" variables is already set
> and the urb status processing sets another one.
> 
> This patch removes the last goto in usb_write_port_complete. It's also
> part of the ongoing effort to limit the use of the "stop everything"
> variables.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> index 3fd080091340..62106d2f82ad 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
> @@ -44,9 +44,6 @@ static void usb_write_port_complete(struct urb *purb)
>   	if (pxmitbuf->flags == HIGH_QUEUE_INX)
>   		rtw_chk_hi_queue_cmd(padapter);
>   
> -	if (padapter->bSurpriseRemoved || padapter->bDriverStopped || padapter->bWritePortCancel)
> -		goto check_completion;
> -
>   	switch (purb->status) {
>   	case 0:
>   	case -EINPROGRESS:
> @@ -63,7 +60,6 @@ static void usb_write_port_complete(struct urb *purb)
>   		break;
>   	}
>   
> -check_completion:
>   	rtw_sctx_done_err(&pxmitbuf->sctx,
>   			  purb->status ? RTW_SCTX_DONE_WRITE_PORT_ERR : RTW_SCTX_DONE_SUCCESS);
>   	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);





With regards,
Pavel Skripkin
