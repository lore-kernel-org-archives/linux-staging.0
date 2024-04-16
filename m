Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE1678C68
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713252620; cv=none; b=TIP54qu1KCet6r5ljDVgsjcN6RKZpq25dsWq2NOvg/M+/suytcYIydRBi222WK7FxF+liyQ/KHR3vPJHEi3NIyPyaWjZmjrsyQa+XNCYrbU5QtpFbXupM78y7KmLTqMsUxz/cpZk3DnYFjmOWuNywgBu2eAKt2z0aKl4HUYFiOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713252620; c=relaxed/simple;
	bh=3EBKV7AoYCxlJECmklFzoEXRovNanxjXalvsVOT4m+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv4x+sMDO4kSiBxpWrmBX25m2Kd321mv9nIfYyCtt/0QDiy+BxWEVwk0fdLnzer6AaM8FDVbnRIiRefVkmOmcnSx8TpyAJNsx513bdnAF7pN45/Tl5ALjX5tDYyhXpDwKFRrGFkpN69u2qX6/zJ/V6nry1EkJHrs9pUEbe0xwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozWpR326; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozWpR326"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a44ad785a44so479275266b.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713252616; x=1713857416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQoXqxQGz5UdNS/uHt9iOu3c65OCBEQl1AjepevvRYw=;
        b=ozWpR326TIr9wOlEewlGPwuQBJ/CWrP75UHziHaIaLQo197E/bQmqR8pka0B9VkVjy
         OqQ5BuLfJzJHEhCwKT1BVoCI0PAnbSn+HgFZTd43hhnxbbK119Pi65cB5cfEEH6xi0sh
         o8z8S708BZ3Xdp+QE6QrZl1S1nAo+T+zstKak1XTzm+lUGi6gltowuLLRwhKs0MUJq1g
         qM2Eg9pmjeAs1krA9wYPi9Zs9AA1wxAe8Ly0RPqHl6H8RcFMAq724m0RAQ3fIO5j9Qv7
         6q7AtqWwKmzXxEFtcdDf5JSY1Dzf4XbpBIAamICWvf4FoMf1rktg2axCbR0XOhYcgQKi
         D6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713252616; x=1713857416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQoXqxQGz5UdNS/uHt9iOu3c65OCBEQl1AjepevvRYw=;
        b=aob7J17AOVC1TAnNp4Z2T62POA0NVb91R+W4VMz5NMdky2lBL7LlgecF7e5Hqoo8y8
         SrHvFSfhq3qnoiBAflXP5mzUcixNzWQ7Zw3LNISANGn/ZruUHB6b0JUhbtmVq0toql5g
         kUSClxaGy7thUtpRmsS4s5ABvuJ9kc2DL5tkxRqgtFYbb7y0Bg84Maed6h4CxL7uDx4i
         xSzNHhvcQ0HJcTvcORk95ePjhvxMd8uviGei+JrgebDGcZnzC71WQMZTfbpS84AywuBM
         VKsNNwHFubDncupA1FIVTBKbLklecNN3vuwFdvhTj/7oUkR8FlcKsXOV6TgQfNvzeh5X
         0YPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKSrdGoHl6H76/WKR7PCZlUCwT7dsbxFQ4VJW7PpsE7avfea/P0dPFws4DHMUZMrtGmcdyNhgcdSHY1+VSGRPzvDLNiAcAVB+IKbSmaA==
X-Gm-Message-State: AOJu0Ywe/OpkoJSMqhSmBgeHPfuZekPzaLl3wqpXRGV79OqZvnEoMG+1
	QHF79JFNeECLZt/VUvFsZTEVdPZjabGgKWF2IMqVQPPv3EERyysa6/VeXj5w7Rk=
X-Google-Smtp-Source: AGHT+IES0flyaPsDqcItqmrdcMlT/9HhmNC59nIBd1+qe6iKBoJLQjAdExVi7n8xHc0r8DPQuGmsnQ==
X-Received: by 2002:a17:906:fd89:b0:a52:24b7:b4fc with SMTP id xa9-20020a170906fd8900b00a5224b7b4fcmr9643955ejb.72.1713252616011;
        Tue, 16 Apr 2024 00:30:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h14-20020a1709070b0e00b00a518c69c4e3sm6421654ejl.23.2024.04.16.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:30:15 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:30:11 +0300
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
Subject: Re: [PATCH 06/35] media: stm32-dcmipp: Remove redundant printk
Message-ID: <cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:23PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error message.
> 
> Found by cocci:
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index bce821eb71ce..c25027b0ca32 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
>  				     "Could not get reset control\n");
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		if (irq != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get irq\n");
> +	if (irq <= 0)
>  		return irq ? irq : -ENXIO;

platform_get_irq() can never return zero so this should be written as:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return irq;

There is a comment next to platform_get_irq() which documents this.

regards,
dan carpenter

