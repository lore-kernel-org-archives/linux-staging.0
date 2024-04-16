Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B228664B
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713262214; cv=none; b=j8mky7qKElvPpVzdfmZe1jKDfTiCAE9tJGPKSc5Fdj90RlyrZ0Iex7a8onRB2eTQb6v4T/BTVF2uPzfQJV42erSs57BaGtJju0R52UHIsraG9Zr5TP1vu1ZztW81ns2jQTskzaMLJwrznQgbbSm3MqKszQSfBmUrpYxqTolqENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713262214; c=relaxed/simple;
	bh=zgNyQhZ0NZqNb624DOhNVPrg3MWtvbHvOdq2lkk8n/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQSSiHGnhgx/2JLKABhCRur4cC4EALxRK7YD3OJy7S/rQs80vyHLEDRPOUfuHMlTEqVjNfZj4oMpbEppJItUVBUpqpN6jVDUcuvFa324jrk3Tdued7DjJC0Nx0wDdgZMeVVPIUHI+U4lHLbZ1vj60Hs0ya4VSnyF0QOeG85idF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XY6sR3gu; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XY6sR3gu"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so6644835a12.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713262210; x=1713867010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPkV0sNugJ6qgQtdOYjt79FX134OLt8EXh0nbMQL+rg=;
        b=XY6sR3guJaGU3tGsSIFKjzLrBNlWk0uoQLWdWQTUuhZ16RqwZnpepmZP0TFbLnP1eX
         2eskr9FoBxrfr0vqku6+1oY5yOLPN02zutxFnAR7q+7D5I20BXuxLdANn3zGMgumXaGw
         xTCcahcDQtRSjYYrme4a6jN2ft4QU7dGptz867i/2W1pB9bB3yHAJ05S6bm3wQ0JImC/
         8lM6PePElirv6VF3OGnqgo1VuyY6Lkh2/kt6nQyJdsBfnyHVELbokUcKsnpg/JEWbl3H
         cjCLqIyZAxQqeS25408nk00ZxujMIFeKhiEKTilnW6cIFGWWxBR7alEdbg6fbM36QXR7
         I1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713262210; x=1713867010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPkV0sNugJ6qgQtdOYjt79FX134OLt8EXh0nbMQL+rg=;
        b=hn4KrnNQMR1Sx6DZ0U3IWPkBCNn2nrYzAIzDuL95Bk0nP8aBvR/PTUpPqMCWuXkb4U
         FA5FMPahHLBrXgbSMpNSDlo9QK2g/axMBhUnX1sg4NpVDyI+3PAaUeu9rs88LMmOYZ2Y
         XIh0KML295FEIqjJOwhG/ECFEO+BOZ4uZHT2azTbyLk+pgUH4TSLihApQTlRcrRxbLkL
         yVX1Hob7GHeTln/wb8Zf7pFABT9hdSqkLOSrhBZ87/301i2BB0qq55ZKHm+L3b6cKB8r
         7ZOrxcypnVTb82uUdYlDVg7D1D4vJpfiQaWT8GEpGbYdd38LSuT8ZBEOfsaXCluQWeq3
         A5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXVKbQg5bq2V4lBvkGP1ZleC2rUnwsOjKWPuRUciIxvqlC56REKb8T3Z/Li9vSFnFcuFcD+Feqk4FTdUcLROSTxbQN7jpizK30Q4xzBTA==
X-Gm-Message-State: AOJu0Yx5yfRwk5Yoh0WMZ8BXrmlbWJARG6cFuFdHLQnsTuTKOmY7WGkC
	lIL/41VhTzA7W9+oiaU8aX5IFU/ODMGadlP/cZIavtdRKQ5h5FSB7CnvCKyX7rc=
X-Google-Smtp-Source: AGHT+IFhSr3NXd446nyUjvnWQSCi0io0wiES4XmD0wl9oB47DE6g/h+2O4fAwSx4U05cyhNdrYyvxA==
X-Received: by 2002:a50:d605:0:b0:56d:fc9f:cca0 with SMTP id x5-20020a50d605000000b0056dfc9fcca0mr8578449edi.41.1713262209754;
        Tue, 16 Apr 2024 03:10:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a15-20020a50ff0f000000b0056fc72bb490sm5823291edu.61.2024.04.16.03.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:10:09 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:10:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:40PM +0000, Ricardo Ribalda wrote:
> z does not fit in 32 bits.
> 

z has to fit in 32 bits otherwise there is a different bug.

> Found by cocci:
> drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/tda10048.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> index 5d5e4e9e4422..b176e7803e5b 100644
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -342,8 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>  	t *= (2048 * 1024);
>  	t *= 1024;
>  	z = 7 * sample_freq_hz;

sample_freq_hz is a u32 so z can't be more than U32_MAX.  Perhaps there
is an integer overflow bug on this line.

The sample frequency is set in tda10048_set_if().

	state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);

->xtal_hz is set earlier in tda10048_set_if() and it goes up to
16,000,000.  So if ->pll_mfactor is non-zero this line will have an
integer overflow.  16million * 46 > U32_MAX.  Maybe when .clk_freq_khz
is TDA10048_CLK_16000 then ->pll_mfactor is zero?  Ugh...

> -	do_div(t, z);
> -	t += 5;
> +	t = div64_u64(t, z) + 5;
>  	do_div(t, 10);

regards,
dan carpenter

