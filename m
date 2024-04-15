Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2195685925;
	Mon, 15 Apr 2024 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713213840; cv=none; b=jCFeelK/x4HWEVklBvhqEpm1RmPHit78gRFHETyMkv74P0c6OqemSAiyqlneEwByhzctplFqgFyU6HH3dnekHnB8PPRv7aNdX6WSaFpPl9TvT9TRLiiJ5GB1cBWfYMKGLmEUjTY7Jpl6xZpgI/EflveBtZyBFV5ROhSDXlMASfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713213840; c=relaxed/simple;
	bh=8dKuQacnGwje5yJMb2wAv3rYTCPMQu0D4XlkBWR3Ilg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2uZWlMW+Hc0XqZBGgcPY78L6QIVNBnloHNr5AJ6JfUgl9lbbKBUOgSgmzw9/nA+vhCejvV87eQc9+NzJOGcFXVxHOz0P7efM9yuZwiY/DjeBHJbrYvvGiiMCDY1fxlZ+89Tg3Knl7m3bI7Gjcfeq/JKJECen79VQnTdD93xGKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6jWlDyo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6jWlDyo"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518a56cdc03so2512752e87.1;
        Mon, 15 Apr 2024 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713213837; x=1713818637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=;
        b=Y6jWlDyo0EXpagXkbdR8LIbuyaTIoiGjwWSSQHUJaj6CknmYzLZUGEml2GBvv2FAtK
         t2OD6DE06F2VwsbXxDHAXf3if3CW04J9nMuJ5A+0q1RB8CRNna8u0FZEFgkBKoPa0Ii0
         utfOjQo5AGB1gD9ilsaS/ndKv68DeLH+WBN1jrWvVELLIG0aKG+CfwIQkDDTjvhJJvkJ
         6TYrt+7zv8MCLfwzSnIBXAiZkrT+9MFJmTalaFpZ21QDQ1RrqMKhyc9UYVkSqiXSnnZE
         CT5mM/37nJEacOKujslWYW4jsM7J6Yq24vbuZpNEb/FgtzVkn7Q/RNyC6szaJvverAT2
         UrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713213837; x=1713818637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=;
        b=m6vrL/sQhUFRsVlnQv4m1ivCGRMZEYZbU//QkvMrSO4PxCSA2Z+YsJMHhpr/ZprHEo
         c37mmg3239PiPj+jda438fBi18pmWedEERgIKNnz88BjWRJvpfq0Rypcv/JDbwSDWON9
         0ImP6OOod+vwcJylCZ3LAkxu0nn3dSxes+SKDncG4gUD1lbauk8tX0h8g1+8s9SA8rWJ
         2/Fgvco+yeaOpICdICtUl2Se16N+Z5OItm7JgSWRjS+32M5ud4OcQgzXXxsPX7v1NHLN
         NXTpEV1IbZ3e8cO34i1ptUm08y8q/1Mu69h1pooEB4/lGExeye5NTmM8uTgO50UCDfhu
         SXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUTVcIy/N6rjZS6mlw4cQgkEJaZdhprJEVmh9KdtrPuJrKcsZD50BHOu3zTtyl+DPI6l7qUFzNIyY5JQwl/yP7nvzzMSM0RMWStx6pQDECr/lW0uO9F/1Z4FacA6yMC6Gum789/UpcGHas0
X-Gm-Message-State: AOJu0YyYncabUNwZ61h/6u/EkrjvRovy9Te6HqE8mybXeq4koWyw+VVU
	zhZhkHdOwN894QPuX4fSBykN1lkVgTSQh8ghGsUEzQj7O+ovUgsu
X-Google-Smtp-Source: AGHT+IHuk+bIjnHF/M32DBBym4XM02bSBQeXa2Xi9niRXZxUmLjNJbCmeAfQcyqxYAWLBytnQmudbw==
X-Received: by 2002:a2e:bc09:0:b0:2d8:97f:451e with SMTP id b9-20020a2ebc09000000b002d8097f451emr8116687ljf.37.1713213836997;
        Mon, 15 Apr 2024 13:43:56 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d630b000000b0034659d971a6sm12976964wru.26.2024.04.15.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:43:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
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
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Date: Mon, 15 Apr 2024 22:43:54 +0200
Message-ID: <4910185.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
References:
 <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 15. april 2024 ob 21:34:24 GMT +2 je Ricardo Ribalda napisal(a):
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 5c0a45394cba..a6424fe7023b 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
>  
>  	irq = platform_get_irq(platform_dev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get interrupt\n");
>  		ret = -ENXIO;
>  		goto error_clock_rate_exclusive;
>  	}
> 
> 




