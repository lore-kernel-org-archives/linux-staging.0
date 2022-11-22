Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7066FD1
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 16:09:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t1so11057316wmi.4
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 08:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MB7sh8EfMeiMpT6eyk0gEECQb5t5VgXPL9obUDUw5Sc=;
        b=mVDeJYEkvQC6eWfFWLtGuUF637u9WsgKRxpLDgfw8QzLz9JsB+URj8WuFMXEpz0Mww
         MgAp+g9ay+YEVSueITnwwqqtN1rWa9OS5/0GRbDdcdgvJMy03n/QJcQeAN3jezT1z6pt
         oX06q0G9b/lvpcLBRVF1Ia3e5YoQVkUIcPjO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB7sh8EfMeiMpT6eyk0gEECQb5t5VgXPL9obUDUw5Sc=;
        b=Eno6F8VDZPJsAiC/ku9BJsAVSo+Jfq2DJ7qHVsUKexTFC9wd8dcgr9ZPfpt0NsdajA
         mXUdcb1JGHTGn9jVAWYSsNQnaXeOjbVny0K5pXt5F1fSEZtpLsgxuHL6Lj92gx4AddVh
         lmmFUctZNW204Jqn/jJbJR1TxbabgG8cdO2OKBO69RV4y4tfGoWyKdMC5yiIDQy/yAgL
         s4RW7vqx9ZyYoejhzOgzJhpzU7NTgXneHsE1t80ZbhMReKNzmd9BQP971eRyb9DoGNdx
         +It9vSbUZNllGp2TamZACoyQDh/0qoOy5DgOZhUjPQjuMbSAJrPfyfK38iFZ9bUKL/GO
         L0TA==
X-Gm-Message-State: ANoB5pl8YjwgDC0UGX/18wVpAeY+X9CeOrATwg75pgoiG99nzNmZj5LJ
	jGBg8aDaFcSifrfx9jWIJQ04lA==
X-Google-Smtp-Source: AA0mqf5NtqJ76RIotfZLCAGTg2jm4dfBI9IjABHCpRidd+mpCKzKmdG8CWw7n5MGPzF5JoVww0RHxg==
X-Received: by 2002:a1c:7404:0:b0:3cf:b091:e5a1 with SMTP id p4-20020a1c7404000000b003cfb091e5a1mr16700981wmc.44.1669133380511;
        Tue, 22 Nov 2022 08:09:40 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bcbd8000000b003b4fdbb6319sm22345740wmi.21.2022.11.22.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 08:09:39 -0800 (PST)
Date: Tue, 22 Nov 2022 17:09:37 +0100
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: remove code for non-existing config
 IMX_GPT_ICAP
Message-ID: <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i>
References: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122132330.30408-1-lukas.bulwahn@gmail.com>

Hi Lukas,

On Tue, Nov 22, 2022 at 02:23:30PM +0100, Lukas Bulwahn wrote:
> There never was a config IMX_GPT_ICAP in the repository. So remove the code
> conditional on this config and simplify the callers that just called empty
> functions.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-fim.c | 54 -----------------------
>  1 file changed, 54 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index 3a9182933508..19a48eb445fd 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -187,54 +187,6 @@ static void frame_interval_monitor(struct imx_media_fim *fim,
>  		send_fim_event(fim, error_avg);
>  }
>  
> -#ifdef CONFIG_IMX_GPT_ICAP
> -/*
> - * Input Capture method of measuring frame intervals. Not subject
> - * to interrupt latency.
> - */
> -static void fim_input_capture_handler(int channel, void *dev_id,
> -				      ktime_t timestamp)
> -{
> -	struct imx_media_fim *fim = dev_id;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&fim->lock, flags);
> -
> -	frame_interval_monitor(fim, timestamp);
> -
> -	if (!completion_done(&fim->icap_first_event))
> -		complete(&fim->icap_first_event);
> -
> -	spin_unlock_irqrestore(&fim->lock, flags);
> -}
> -
> -static int fim_request_input_capture(struct imx_media_fim *fim)
> -{
> -	init_completion(&fim->icap_first_event);
> -
> -	return mxc_request_input_capture(fim->icap_channel,
> -					 fim_input_capture_handler,
> -					 fim->icap_flags, fim);
> -}
> -
> -static void fim_free_input_capture(struct imx_media_fim *fim)
> -{
> -	mxc_free_input_capture(fim->icap_channel, fim);
> -}
> -
> -#else /* CONFIG_IMX_GPT_ICAP */
> -
> -static int fim_request_input_capture(struct imx_media_fim *fim)
> -{
> -	return 0;
> -}
> -
> -static void fim_free_input_capture(struct imx_media_fim *fim)
> -{
> -}
> -
> -#endif /* CONFIG_IMX_GPT_ICAP */
> -
>  /*
>   * In case we are monitoring the first frame interval after streamon
>   * (when fim->num_skip = 0), we need a valid fim->last_ts before we
> @@ -435,14 +387,8 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
>  		spin_unlock_irqrestore(&fim->lock, flags);
>  
>  		if (icap_enabled(fim)) {
> -			ret = fim_request_input_capture(fim);
> -			if (ret)
> -				goto out;
>  			fim_acquire_first_ts(fim);
>  		}

As suggested by the checkpatch.pl:
WARNING: braces {} are not necessary for single statement blocks

> -	} else {
> -		if (icap_enabled(fim))
> -			fim_free_input_capture(fim);
>  	}
>  
>  	fim->stream_on = on;
> -- 
> 2.17.1
> 

Apart of this, patch looks good to me.
Thanks.

Regards,
Tommaso

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
