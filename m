Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B9A3FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 11:55:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so8887351wml.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O7ZwczbeMR/YAkYS1Itn/5ZToVV+8zRvhc01oQeZjrA=;
        b=I2aowjRvamyDFJwmsALT6bFyPoB01MRLr/fP9dqbriQNTzaTmILnsf5ATt12A+1X0j
         DH7lRR5YsW+5piWxbkdgjpoP6EwYLVF3Mkq4VlY2/czG7t9GubK8mYoV7PMxA+B8Exq+
         fn+DIjOlYZulgr/YDqH8AMRpKqu31w7Y9bJQxaaBqpl/Owxxpt+ljWkPqqjq89rVAPE9
         BoTmL7E3AIGr6Vh0WRXcrsGZKTdhheEq5JEMwr0BDVUK2bbSedm0CBds3wpxEc1/V8s5
         omBqN9cwvcb6jd1nx3wvv0O8uE6fRqr84JA4ex6/uvny97WeZINRnIYewiMnxvSJfQHV
         64bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O7ZwczbeMR/YAkYS1Itn/5ZToVV+8zRvhc01oQeZjrA=;
        b=GXhyDuKPeg9y1ULnri89ciEgqEzvjYBhHIpyI/UQ+68GfwM8dumfRjE4Ferw6S0X9B
         p6pKEjkLIKKs1YRIdCd7YHPL/i3a4M0pi7xSDTzzTUbfjbSPxBhRSbSz24rV1FD39fZe
         7s/gGuLYs3audSxBS5eYpZPJ6tAu4hn343qAROjUCwzqR3ivDksyVd/HnwCeOlnj4NQV
         cO2TKSPlLXmqclx0B078xj+5gFSz2rSChYQIPT8g7al5JaIu57sMwEoOjBrXCrv1yb8o
         8OOD7JwsfM8CEhk9kz8EebIZ7AJq0fb5dxfAlSHkERMxgquZy6RFEjLCp/WEDrQoipxL
         OxSQ==
X-Gm-Message-State: AOAM530Qsc40W8cCIv4XfSdlZPeKBr/yCBF1Ap15hU3NsxOqxv3tjEXO
	9WBzor+7y90294M9HKwOoHqb5p1bSv0=
X-Google-Smtp-Source: ABdhPJx+aKdGGcRzworMCbhoPyusUkyTrSKnZYepR4sNOtL8AphSHo4x9dkDEvRNoE+JzuVCovRbiA==
X-Received: by 2002:a05:600c:350c:: with SMTP id h12mr11476611wmq.88.1629633316348;
        Sun, 22 Aug 2021 04:55:16 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id l19sm10521393wmi.4.2021.08.22.04.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 04:55:15 -0700 (PDT)
Subject: Re: [PATCH 01/10] staging: r8188eu: remove unnecessary cast
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210821164859.4351-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <7718dee6-e841-8e8b-8db1-210425ddba77@gmail.com>
Date: Sun, 22 Aug 2021 13:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821164859.4351-1-martin@kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 6:48 PM, Martin Kaiser wrote:
> name is a const char * by default. This type should be ok for r8188eu.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index e002070f7fba..72556ac10d7d 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -61,7 +61,7 @@ struct rtw_usb_drv {
>   };
>   
>   static struct rtw_usb_drv rtl8188e_usb_drv = {
> -	.usbdrv.name = (char *)"r8188eu",
> +	.usbdrv.name = "r8188eu",
>   	.usbdrv.probe = rtw_drv_init,
>   	.usbdrv.disconnect = rtw_dev_remove,
>   	.usbdrv.id_table = rtw_usb_id_tbl,
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
