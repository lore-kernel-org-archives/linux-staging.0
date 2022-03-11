Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38359211B
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 19:13:50 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id h14so16652456lfk.11
        for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 11:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aIl3qyAJQDV5o+ArVkOH0QKLBlNpboQaLuO8XFWfnr4=;
        b=ZxB0bjMnh3W+v4rXJtn/5FJdqM9Z+8ET/FwPKp0ht2Z34agafOBgclCABLR5Rk8nDT
         jej9or3aW+ZIYljJ3//wz9hjh+qjxF6GOtRRDePHzVvQAddXOiam1W7t1KuxQWMCDVG9
         Tdr/+j3g5xv+/oCt0FvPj3BwLnB1aEAa9wDsELm1fFVfjKoz7BvREK2tuVyBBkkUqS8A
         GtWz5L65W/0nau9AGpSYlbePS4lnLKaQl6+K50gc1DXrrtt2h0154PaVLlWmFDzGkeSl
         viGGMEGw+6cb8Oq3gwH8/2ueoiQnzADUKAlHFSbopPmpIuXYiF2TSwKcg7Q9K5rbrbgV
         dVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aIl3qyAJQDV5o+ArVkOH0QKLBlNpboQaLuO8XFWfnr4=;
        b=2rRRvHwwAmW6UKXShPfDdvYWQhItEFHYS1JlC4krIW25njskOgXLZjRpVMr9YXQaCO
         2x0v+l304VJPzsridVVwLOPqw7lo5PvxH2lj914eooZJKg3uAE/ISagjFu5kwyp2Yr6C
         c4bYtHcF9bqmIKBeAcJAcUdwL6lYQtTFB+9CArLcPvHbAOshNwz5B19FjcWQGFWyQEql
         YOYVAPqzbbvcCV4d6kaA3M/hUbXLBm87L+y6v0L8wwOmJ/uvzaXt6zXGQA/BfSLXahzT
         t1NXATKaBGLpQ20RkpH/p7IiIHBaMYElqkBBK9lTzX+YhAIJ5sjP8wDLX7Cc72Rlqyi5
         GBYg==
X-Gm-Message-State: AOAM531L1ckI8aH9hwBTV0/Bd03yd3PF/8bYG/K0O5vVKwFZHBdLIyXH
	Ei5wLLLq5Yoqb0SYTuNVIkM=
X-Google-Smtp-Source: ABdhPJwOY3jvr12Q0QCOoAzPM61VxdF/xvDSkyW4H/fkHJ6XmBt8tQ7JgpddmLa/EuRAmexogIueEQ==
X-Received: by 2002:a05:6512:31d4:b0:448:3937:c09c with SMTP id j20-20020a05651231d400b004483937c09cmr6860184lfe.158.1647026027995;
        Fri, 11 Mar 2022 11:13:47 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.107])
        by smtp.gmail.com with ESMTPSA id h23-20020a19ca57000000b004486be4b96csm797465lfj.118.2022.03.11.11.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 11:13:47 -0800 (PST)
Message-ID: <ec429deb-104a-1b63-1acf-dd69d486b1c6@gmail.com>
Date: Fri, 11 Mar 2022 22:13:43 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] staging: r8188eu: simplify unnecessary NULL check
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1646994801-26211-1-git-send-email-baihaowen@meizu.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <1646994801-26211-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Haowen,

On 3/11/22 13:33, Haowen Bai wrote:
> remove the optimisation of NULL checking it inline, kfree/rtw_free_netdev
> will take care if that would ever be the case.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>   drivers/staging/r8188eu/os_dep/usb_intf.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 91792df..8d1ac48 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -425,10 +425,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>   		rtw_handle_dualmac(padapter, 0);
>   free_adapter:
>   	if (status != _SUCCESS) {
> -		if (pnetdev)
> -			rtw_free_netdev(pnetdev);
> -		else if (padapter)
> -			vfree(padapter);
> +		rtw_free_netdev(pnetdev);
> +		vfree(padapter);
>   		padapter = NULL;
>   	}
>   exit:

I don't see such code on staging-testing branch.

All error handling code was refactored in commit 13456b9. Please, always 
base your code on top of newest branch but not upstream one



With regards,
Pavel Skripkin
