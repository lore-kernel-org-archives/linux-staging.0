Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03617F
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 14:16:55 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id j10so33871110lfb.12
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=fH6pRt4HIVRgmGCmNbHBz0wD2RZsVq0fQhpWNY78NSs=;
        b=ourtQDkogRIT7YryMxBVsoTOxpkReIvvLDFHn2m56TTRELvKpj0PZnXgXCcoqsmiLk
         yKhJboZ1AjQ0s+YJpqtgwzJQamNb6GXEX5SZx39usBBLaEleXVVUKikMyb7WcNueeUT7
         llbyYGnY3+yd3tXUzEhZbZNvx/UjPWHD0EP6dysiUBmDl1Ihg0Ap/o/kBG9oeqHVEKQ2
         kdIbn/Xlaj53Ar8IyjWf+Z2zD+UlzfV+30Zd4f/O07G/oHzrs9w/kncQ9FFTgRpiHLUs
         Gj870cVQdoXDCK7Xs0CeueMnpTqq2E8+cBM1uXHqMzHZ/WakPyzacWygViElxPQ/KBCS
         nk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fH6pRt4HIVRgmGCmNbHBz0wD2RZsVq0fQhpWNY78NSs=;
        b=IWH1Rdu9+zkwlDbowXNMVM+ccYT3fLlkF/dcPZMhArmAWQQsPfS69h9Ed4JTZyoZ4w
         8q9YAb8RRWztOwlcNeI8x8Hw8xviOu5cNBeOarqa1YljB9/15W74Z/yP8iUWoy5+XZe9
         Xyn8W9AMfF1O1ER4qkmp+gwyGx3NAr2iBvyqOY7ZsgS+neKZukHVnfge7NKpGEzdjln0
         BYiewbgcLxuU72d1gVRmYStEjxvWv5Hn9IyH591SjsTFRD4U9WQjbG3T8gE8entWsNYi
         OSndPW9SjB9hPf286Smh6TtfdIrldaVyhEwtfQeyddHjl7aMw1TqjeQNCcZC4xmN0HwT
         ee7Q==
X-Gm-Message-State: AOAM530mZxcn/q/82QjNOgNT9S7+ovMw/Fv5Oc4HXhLjjsdZoaAnUiN4
	ZSZeLuGbc+l6OatdDaoSQV8=
X-Google-Smtp-Source: ABdhPJwLtfKyAV8wG+bybU7/iQ5v+ivaYOBPbhjRjLfZmJ6Fxwjigll/Rd/JFA0z3QSslOdHNdPaTA==
X-Received: by 2002:a19:c107:: with SMTP id r7mr5326241lff.247.1621693013355;
        Sat, 22 May 2021 07:16:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-83.dynamic.spd-mgts.ru. [109.252.193.83])
        by smtp.googlemail.com with ESMTPSA id w5sm932721lfk.2.2021.05.22.07.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 07:16:52 -0700 (PDT)
Subject: Re: [PATCH -next] staging: media: tegra-vde: add missing error return
 code in tegra_vde_probe()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210522031911.129361-1-yangyingliang@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bc08636a-8f0f-772c-7df0-ec6459cc205d@gmail.com>
Date: Sat, 22 May 2021 17:16:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210522031911.129361-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

22.05.2021 06:19, Yang Yingliang пишет:
> Add missing return error code when pm_runtime_resume_and_get() failed.
> 
> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index e025b69776f2..ed4c1250b303 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	 * power-cycle it in order to put hardware into a predictable lower
>  	 * power state.
>  	 */
> -	if (pm_runtime_resume_and_get(dev) < 0)
> +	err = pm_runtime_resume_and_get(dev);
> +	if (err)
>  		goto err_pm_runtime;
>  
>  	pm_runtime_put(dev);
> 

Hello Yang,

Thank you for the patch. The problem was already reported by Dan
Carpenter to the original patch, apparently Mauro missed it.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
