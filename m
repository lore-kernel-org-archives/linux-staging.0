Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A374DA16
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653258; cv=none; b=NZhdvgFwaFSpd+ouRsCIy621lE9c90cJfjydsdKyN7FLk+rJWAuy8hZT2KSeg7LfHfd3cC3hj3E/Esuhd+60EybriAyQ32L/t6cctWMRDTByKN9CHURiYUTOr7qrAZDf4c1Nge3cX6jM+N3DXCYkxZ3J2/PxdBDEfJPidMt2PG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653258; c=relaxed/simple;
	bh=7BKUeJX9aV7FK0wwM/ed4hU8pUFUg4zU4KPvLHQ6pXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozZlUMZMRM6MCYn8zUav254K5q4i2B/TjSaqzHeBdn5VYJf10r1854ZUbDIm3giMrLYQRW3qMJ6XoBT1WqLxbPpJjdOWZBf3F7FmwRYOmi6rtSp9JDsa9hRcIZCxNaxWADDY92weHdk9syMmnjGGnK2hr12bq5BWehQnPoFgB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2LSHVlr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2LSHVlr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41a225fc1f2so989935e9.2
        for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713653255; x=1714258055; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=k2LSHVlrKRPotgjN2WWgWjvLgMvFA9WDWeTmAhi6IwH5khCKrX3zKSuNgRe3Hp4mSN
         Zf88xYETD3dQORXtV1GLpLWEa7GjNm0U24TfXiD56VcmbAI3xwB2smiZIYDQGUcmba4T
         6EsTMhf61XvMqnvnjTcgmGcOGziZ5utrmx4HKQL06jDHxzEew1x6X4CpOmsFNIAuXxA7
         0P9YKBJ8HS9nF75cc1RZKGI1z25VdHasA0twlUz0CsXea3JShN5JBH7SC4nqZml/xvyw
         yKuuZtN9fMuLEAa9Abbdq6o5TA/pwFdCIxzQBkgoVBxDabCikrOv7Pr9rXobfWNdUWki
         Ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653255; x=1714258055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=i82tRaAUj1qIhePWXryMmPIne+x1qTxQmBnjMNUmKn8cTFqFFPIdbYathVSjRGb8AJ
         /fuEL545G/JlhQZwhKiJO9UDDUxMXFQ2zgrGcdEzPugF/cT3BZDvW4AaHFpPgNfyIkBR
         yUhEjsFSZ+6XopAHf2BPDXaLA636z2WPRwarEPeXp2Il780MAVVx3ujHApyzKkP5m/rw
         R5Q+BZaQSSNK4/UuQO2asrvCQqvBvqYEnC/NpjX/TghkOWN+ihhZpjMuVhLyfRtrXv0w
         O+7zanarAX+MTmQagXYcZT7fbJOBO/NgasQiQOymFJZZwgQ/xdvVplDJN36fXkwKeqHf
         pINQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKBRldyFPp6UVTwwP4HH+Ej8a+IAdUwo3y/bZva7dGtvwQokgS75IeWaROWJxN35tEE2lwY6AvrGuRf+u3UT3OQvMoRoYs9H7I0aGlmg==
X-Gm-Message-State: AOJu0Yw2P7bC+I7d4Lh6KFbcxIRYa0xtPlHQ6jB5ug48SoBCkZGgSnnn
	1jDzz+3sxvQ5tms851NKoKU2MxGhi/k623Du8dtobLZBI+WPffI0xclAjRQ5E2s=
X-Google-Smtp-Source: AGHT+IFbaKQ0tPQEJ9I/RpZX+4qvxduHp5ktCxUofqd2WifblrkCYfYKIpU2lWpeintNmr/h6rZQlQ==
X-Received: by 2002:a05:600c:4e88:b0:419:87ab:f6da with SMTP id f8-20020a05600c4e8800b0041987abf6damr3268421wmq.3.1713653255313;
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b00417f65f148esm15283322wmo.31.2024.04.20.15.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Message-ID: <6b1627ff-5135-4685-be35-adf74a456469@linaro.org>
Date: Sat, 20 Apr 2024 23:47:33 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:48, Ricardo Ribalda wrote:
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
> 
> Found with cocci:
> drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..f87e33a34610 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_outputparm *out = &a->parm.output;
>   	struct v4l2_fract *timeperframe = &out->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
> -	inst->fps = fps;
>   
>   	return 0;
>   }
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
