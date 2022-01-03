Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF72CA0
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 10:00:08 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id bm14so133896978edb.5
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 02:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rzyDUUFUuzJu7fjqsCBQnCkElzR31cmF3qAtFZ/CTkQ=;
        b=G/dSeks6bFBU00bcMvgZyae7B/zka+YysAJfC8gjAOGlG1Rdjf6GtH2LSHhvHk2e/2
         pjEpUD2WjGHACLiFPXxLsSrdTqZHJ+BHUmQdveibyKgKOM69uAdGvxReZkPfcZE2eFck
         CZISPMnG5PjkoF6n8LwNzHY1BAWQtilh7PmhiqBAm5ZSP0+OhNSI7w5T4AMMb8+2R1zL
         lkV0z3gkPWm21RXmNWDYv/PeN/TorTVjunb2XliIcI4IIBcOaKVr6EbVwBUNQs+/zU3h
         4QGQ5AqUlCUgF3ui0ET8zd9HVmRapP4JUbqyDKMLdNKhau/UeA57lZTmvj7Ur5H6aL1s
         0G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rzyDUUFUuzJu7fjqsCBQnCkElzR31cmF3qAtFZ/CTkQ=;
        b=d82wKSSBPSo3WMsyaGqVXrorKCBdpJtsX7E5w8Y3pl+yYgF55A9DZ6bLXsAWx64Gnw
         581aIfJH97XNficN1RGrmqwZNXDffQqfOI0EJt8yqGZ78cCy/s0RVoVYw+VsbNW4kwe7
         3BQ2A7Jo4qXZrBB1Es46hDdX23+1AMUQf44gXG86yW2xDsP/F+kroB9CuFOZIzLO+R/I
         rL9cjeB46EWiGAIIIPkTLyv9upY/p0ZQeQLdgzHo/T01FoNl9H37HOu1U2eJBoWqjVnY
         8RAVkruGOW+4uKL6yhnZeDBX7HBAyCApXs1/O5NLdpFIoT4oqvIQejFvk0WirFG5VohB
         Maqw==
X-Gm-Message-State: AOAM5300GMOnPrZ9k+Inj/fwWgb7fwb8Z3GylcYbHUjelVHp4WCdogXX
	QB4PMQCWfNkxesoQeREiWyA=
X-Google-Smtp-Source: ABdhPJzwtpEgepJ7j6hYnw16nurFJlAFm1fTf0svjiqu6E+0GL7Nai1dy2DBEZk9kKYicAZqyoFDng==
X-Received: by 2002:a17:906:ff14:: with SMTP id zn20mr36536626ejb.649.1641204006906;
        Mon, 03 Jan 2022 02:00:06 -0800 (PST)
Received: from agape.jhs (77-32-51-202.dyn.eolo.it. [77.32.51.202])
        by smtp.gmail.com with ESMTPSA id t20sm13326329edv.81.2022.01.03.02.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 02:00:06 -0800 (PST)
Date: Mon, 3 Jan 2022 11:00:04 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: fix frequency deviation check
Message-ID: <YdLJJIrVizjnqzsd@agape.jhs>
References: <20220103081135.GA11642@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103081135.GA11642@mail.google.com>

Hello Paulo,

thanks for your patch.

On Mon, Jan 03, 2022 at 09:11:35PM +1300, Paulo Miguel Almeida wrote:
> rf69 datasheet states that frequency deviation must exceed 600 Hz but
> also that frequency deviation + (bitrate / 2) should be less than equal
> to 500 kHz to ensure proper modulation.
> 
> This patch validates that both conditions are met so RF intersymbol
> interference is "avoided" where possible.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>  drivers/staging/pi433/rf69.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index e62e61ef4d27..cc22915fd489 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -255,17 +255,29 @@ int rf69_set_deviation(struct spi_device *spi, u32 deviation)
>  	int retval;
>  	u64 f_reg;
>  	u64 f_step;
> +	u32 bit_rate_reg;
> +	u32 bit_rate;
>  	u8 msb;
>  	u8 lsb;
>  	u64 factor = 1000000; // to improve precision of calculation
>  
> -	// TODO: Dependency to bitrate
> -	if (deviation < 600 || deviation > 500000) {
> -		dev_dbg(&spi->dev, "set_deviation: illegal input param");
> +	// calculate bit rate
> +	bit_rate_reg = rf69_read_reg(spi, REG_BITRATE_MSB) << 8;
> +	bit_rate_reg |= rf69_read_reg(spi, REG_BITRATE_LSB);
> +	bit_rate = F_OSC / bit_rate_reg;
> +
> +	/*
> +	 * frequency deviation must exceed 600 Hz and but not exceed
> +	 * 500kHz when taking bitrate dependency into consideration
> +	 * to ensure proper modulation
> +	 */
> +	if (deviation < 600 || (deviation + (bit_rate / 2)) > 500000) {
> +		dev_dbg(&spi->dev,
> +			"set_deviation: illegal input param: %u", deviation);
>  		return -EINVAL;
>  	}

this should go in a separate patch IMO

>  
> -	// calculat f step
> +	// calculate f step
>  	f_step = F_OSC * factor;
>  	do_div(f_step, 524288); //  524288 = 2^19
>  
> -- 
> 2.25.4
> 
> 

thank you,

fabio
