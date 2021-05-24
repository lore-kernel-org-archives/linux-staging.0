Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FA2F80
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 13:27:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id i9so40660942lfe.13
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WlD4zojrALQJ3lMjLIav5M7SKi5ELnimDryncsQ/eew=;
        b=n+janOnwDY0e+M/oqh/h5lp+KO3spsFId0m8fYDlrunNShBYLSDx99+oihuZFnQrKb
         p+yan76rURm+le3301pH9UEAHBSF0dey5vrlm3Gz229XQARguK7u66/P97HssAFcT/kL
         Q49eHUPqimmyUiQr6+ylw0QD1G4lGXs8AkPEBnBLotdqPQBDLtjMzykFtPq2T5Ws7ji4
         T3939zY0oAjChf4BxQA6FJtqXJ9v7+VEwVKHVz5rrYoQHKzTxSqRSuy7obS/A1EYKgEC
         QvRJpo3uM/ObkgZRe1RsNhDvL4Ba93MVrtleRksDndDfVqsZFcD2SfNhkyuXJhMWVZCc
         NIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WlD4zojrALQJ3lMjLIav5M7SKi5ELnimDryncsQ/eew=;
        b=LbzF1ZOPCH8biXyG06NDB7nmMAz5DVcwMrh7yRKZntUCD1qXhINyudzIl7duDqs0WN
         tZa+m3br7dSDNfuE6SsyuUSRVQtwL2VcXu/u/fIqys164FeqXgXW3KzQeYId+U7QIPme
         hIjVFS7zW2lud8GjwDub9oOQNWMJOOCFTXb2qD/qwh09Jsl6vEl54qkrR5YnPRqr5tB6
         7PfLRPWCJYiv7ajqgp7J91smgCTM08tG2s41NzqdkDcwDKKjLn2iG8TPlkz8X6xuvm20
         n78oxgtgtxGoXoAyCVTBzOgK8TpEI3qUivmj24TTVRdOmiWr6aPpt5E6uHYZfIZFODLy
         H/9Q==
X-Gm-Message-State: AOAM530/n7suxkh6uwlGM6TSPB/PTmuyVMY9jlehb0US88bPun1D5cOl
	SxpUWG6QQq/HqaxDqrvFppo=
X-Google-Smtp-Source: ABdhPJx21C2ia2YRPJ+KM6HGkOOUDyuFOa4OvvZsYw21/Dc6XaNds85PS5+Mk5I/jXr0R6uagP0uBw==
X-Received: by 2002:a05:6512:3dac:: with SMTP id k44mr10709502lfv.256.1621862867427;
        Mon, 24 May 2021 06:27:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id a25sm1763802ljp.11.2021.05.24.06.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:27:47 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
To: Wei Yongjun <weiyongjun1@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
References: <20210524133550.2363884-1-weiyongjun1@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Date: Mon, 24 May 2021 16:27:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210524133550.2363884-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

24.05.2021 16:35, Wei Yongjun пишет:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index e025b69776f2..321d14ba2e56 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	 * power-cycle it in order to put hardware into a predictable lower
>  	 * power state.
>  	 */
> -	if (pm_runtime_resume_and_get(dev) < 0)
> +	err = pm_runtime_resume_and_get(dev);
> +	if (err < 0)
>  		goto err_pm_runtime;
>  
>  	pm_runtime_put(dev);
> 

pm_runtime_resume_and_get() doesn't return positive values, the previous
variant was okay.

You should also version your patches and add changelog.
