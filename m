Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0570
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 03:49:27 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id s4so6671037plg.12
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+SnlRgT1Xc6ohfBD2dJu/m0JZhJUUZhWe06KN/vy3fY=;
        b=DRt5Ij/MVJsGZlVg9NahZ8EdbSNiK3KF68+d690p94x+QMN5DFHVOiLwSQX6XMuO/V
         /BMH0JRSBzGLpLdMoIq1viF1Y4g6R1Xh52rruHv7yoO9Q9S8tG/Pd/rad6dzfv2WyU06
         6weIC261LS2PQddhiyE+BqS5GMPZtN6X/yf5snt1m4QVF2j/ZrWBRmJKvNfj5br19BS4
         fVQ8a7U5CTuvmgcmEmWn6pOSEfb7Cl/C6YE3Lm0Ux5hIrRlBaVjAP2N0IgjLsbvBjLxJ
         zMVSKirLj3HfPVM644+/hLI4ApBWQKzJb7kToyho7CAxxcZdEGSFzW8VyDOxn+Np59Q8
         HYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+SnlRgT1Xc6ohfBD2dJu/m0JZhJUUZhWe06KN/vy3fY=;
        b=cOgZXfo/VEvMjoTrt/mimtb1nJgj2bnlnEnOhArCzz+9cka5pKfWw6KK5YIQPNeoHv
         rbWtpjIpiBDRmbVaNBIFfs77n7gHbhFcaddJ+q7rzJA275+rwYUx0aQypbcgxXCDUDFz
         VWcLp2L+DJ2VacjV3/tt+ipryMMacWNe+5Ud7ogGjXZBm61P5yaNWlvjHzAdUY7do0rb
         8abgphHZMlR+5DOFKugxyGT9VziVqUqLlZ+2DsxhSdXoduaF8mac4UZ8ddlap5Neo3yN
         3RRjmcI7UdUWhnc+mdD+fGOPSwTOrju9XPU/xUUjHo39l46VaAecQUpzfkhz5FUIsGzz
         RU9A==
X-Gm-Message-State: AOAM531kjBidAh7MFRhGXE0YTDbsR09vLGuRhyJXr6lpvJ+hVE1Ml3Sc
	q+BZG/DUmC6COOY0x93bXWhRUg==
X-Google-Smtp-Source: ABdhPJzHYjsKL7bUvN9XeoQbFPnem90jhxUfH4NDK2Tpf0if5EUiZqVBBMYeATd3+l1X+Xx4wjmevQ==
X-Received: by 2002:a17:90a:9d88:: with SMTP id k8mr2900173pjp.64.1621482566576;
        Wed, 19 May 2021 20:49:26 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id f14sm753415pjq.50.2021.05.19.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 20:49:25 -0700 (PDT)
Date: Thu, 20 May 2021 09:19:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Philippe Dixon <philippesdixon@gmail.com>
Cc: vireshk@kernel.org, rmfrfs@gmail.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: spi: add blank line after variable
 declaration
Message-ID: <20210520034923.ddp4sxq5vfajhojz@vireshk-i7>
References: <20210519193938.GA7131@ubuntu>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519193938.GA7131@ubuntu>
User-Agent: NeoMutt/20180716-391-311a52

On 19-05-21, 12:39, Philippe Dixon wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
> ---
>  drivers/staging/greybus/spilib.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 30655153df6a..ad0700a0bb81 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -246,6 +246,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
>  	xfer = spi->first_xfer;
>  	while (msg->state != GB_SPI_STATE_OP_DONE) {
>  		int xfer_delay;
> +
>  		if (xfer == spi->last_xfer)
>  			xfer_len = spi->last_xfer_size;
>  		else

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
