Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3976FDA
	for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 14:44:21 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9338e4695so32168341fa.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691765059; x=1692369859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23iy46YoHlQ8ZdzkkXxxjCRqtIyclR2w0mCbF3+9ghs=;
        b=EOSjCfOIpuA9Na44YvAo4hMfC+Psn0Jq72683hQUNKYH4rSn47qptGthyUXz0JXX5T
         hEHL5KWv4hMn1YBe/RvyYyoe4IypiJyMhts0youxMXyuQZpwJV3n1W5u85E5Qu2Q9zRy
         dzWuNYDSR7NtUdV330PT5S2vMKb3aQE3qOH8JBd3hJpjDZzf227d4K9hJCSr+9+XL9l7
         DGge+bTZfYnaCTJELpFFywW6u/wa7ZKTG3PlGs/dcOYz1pjizJ0nFFTVqynnZsVss4eY
         Dn274t9KiN3+piMIcVdpjvVMtcjaaGPi9uuLmdunpHa+ofiP/vuVvespLjywpIR7Rm/p
         ZTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691765059; x=1692369859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23iy46YoHlQ8ZdzkkXxxjCRqtIyclR2w0mCbF3+9ghs=;
        b=jJPJbxGMVH9TvzScpuNPBaX9KV9G/3Hfd3GHgJRzKJrBp2kbmXbINwIyGcGNVy+JqG
         Mkc4AvKPrBhsdpqtN1/32QFX8Qm61nJvbCqIusnjO6+xcyiqs9FVrgDZGkV6cDF1ZPWP
         1ATym0aRv6lOlWD3HZmG1cKt7ZMJBA9qRyKM/dFO+d1dITYfwcutJbo7F+kcf9wZmmV8
         CxRz/qYXrdHDGM+ZIAeZuqYMz+sK9ZyETMJzMtjPfnX5JN/1V7CJ8VfzrZ3AM2IHsQR6
         xp/hTR+jVD+M64MnZjdi1pFNsSXh9+4sSeMfN5da9cvFN548WUlqLKBt4/0K0zY1WIon
         uowA==
X-Gm-Message-State: AOJu0Yw/2mq8VZnXf8JCxvIrUi8Q5MGd728h4fF1PhhYcb4clmD1t+Zh
	XbY2w5FEKRCv4Unk10IO6QuYYA==
X-Google-Smtp-Source: AGHT+IHZkrWe9j4sHAkgC8McDPxmHFcNwFOYsGP9orV4VGRJRp/8hRNCcvzluUIklg5F94QY3fPtpQ==
X-Received: by 2002:a05:651c:23c:b0:2b6:eb5a:6504 with SMTP id z28-20020a05651c023c00b002b6eb5a6504mr2112183ljn.18.1691765059557;
        Fri, 11 Aug 2023 07:44:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v22-20020a1cf716000000b003fe23b10fdfsm8470836wmh.36.2023.08.11.07.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 07:44:19 -0700 (PDT)
Date: Fri, 11 Aug 2023 13:55:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] staging: axis-fifo: remove unnecessary
 dev_set_drvdata()
Message-ID: <8d099d8f-a10d-457f-8966-6c02c15092f0@kadam.mountain>
References: <20230811092756.893592-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811092756.893592-1-yangyingliang@huawei.com>

On Fri, Aug 11, 2023 at 05:27:56PM +0800, Yang Yingliang wrote:
> The driver data will be cleared in device_unbind_cleanup() in driver
> core code. So the dev_set_drvdata(..., NULL) called in remove and error
> path in probe can be removed.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 727b956aa231..b9dc3c01a5f3 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -899,7 +899,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_initial:
> -	dev_set_drvdata(dev, NULL);
>  	return rc;

I can't really get excited about these patches.  Setting dev_set_drvdata()
to NULL is harmless...  But if we were going to do it, then I'd prefer
to get rid of the err_initial: label as well.

regards,
dan carpenter

