Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5DB7E0F2
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719135215; cv=none; b=lFYC2egdTC7rmm3LX+Oeh96hm8LAkTLo0ZIZrW4X28gPfaEbxenQbMVeqal2t0CKGscRXuXCMjsO3MJyUMpCMFtvUWg0vsfissxVoLBQr0bnxfHtH2FGo1G1qJRpCV9yD6DxBiRxWF3QD4rmhHy2r4ndjBS/xVbDLgdTkjhieeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719135215; c=relaxed/simple;
	bh=JdGQjQ8ugHuD7lfotcDPVss8wiDxrM/eB79Z6QArE3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIF+x97zbW3ov9LYUVvKUFVQ/dVlDCUXeTNlgEo01LcRG1RCTdLmaV/GBCMqvwuXR6szQ3U4JRwbX4n5rTdAYaV7MeRb7Bbh6KqpCVzaeWh46i6/gdScaVsEwpuSWLB3ebpUojyxNdsMy9XmHE+bzt2YlCOnsiajC0SCzKzcUss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8oTAvt+; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8oTAvt+"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso48275841fa.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719135210; x=1719740010; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AjZoaS2Am0A8j/9rhUaTOpBI3VQYzkae19fmYTVfhu4=;
        b=h8oTAvt+D0itF6GpbPkGBwupNVlxgl7qxZNs2d4biKTXJ5wxsnj+L60rhogUrxXVDn
         TNFwNjIdxl5mUR73dPLWufy/xf8lqT9YLtH95EN+8BcUQJL3xixtXbtrsh/5Uo+cyVbR
         OmSTEIgYrhC8hRDS9N80Ta1RVTCaofVExkHcrcXEpXlqY+Y7Wf8u6Tw885ngcSg6/IdO
         ce/3Pze1NMrkiIW+LWnTuyfWR7/R0MM94d7A8r5aCZzh75rgGamfuGTHVr72scdf/bjy
         LnFvIpU4xSV7dtmEr2JZ//iLYO2XMfey2rHT7uRtnWCTsctaOG+eAoqDWbwQ4dsIGy4O
         bCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719135210; x=1719740010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjZoaS2Am0A8j/9rhUaTOpBI3VQYzkae19fmYTVfhu4=;
        b=LSj5vva6npjU+c0K9mUfIoaGuG7LZjvmbpfifj2PZWWKrI7gg0o1so9Cjv3rGo6CsD
         UPLBtcZ9JSWbR11VW2yvg4AfIzoPLH3d9P00xZtTE0XzlOxX1wrWZWVwAZMIbFw8VuG8
         4MyP6aUbLPYZ2HF+0TWMyW0ZgdJT8Und/tZbT8phEk9bQ+WPfEOjHJqzXKATioG1HGSM
         5BhFsMbqX9yfRKQzd3ZRhUB5G/BTTwTqETBdK7N4LtizV6DwnJoru9SGWo7ko2YlpX/z
         Zwri5kumM5C4xE66UBkva+zknbH++VT5eFLE5Y1KgZFQhBpCzRTe12xtF8IL5P+ytnDI
         c6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWK4cHV3jsuz5zSI4wXoXu37suxL8wfY6g5cL90s1NRe4nA9q15DorSMaqICXe/b8Pi9YnLTXNsJVpzzF0C3Ka1aTLXwKjvOD090CQ8Kg==
X-Gm-Message-State: AOJu0Yz20MZ1SAG51ulRA9mtcEPbhrqbSYRec84/oYEGdwfEqVHx0SQc
	QNestFdgw+cbsRbNDCksFaNU3wXC2UfZAh1VQZEmVeJ7Kalh2fc=
X-Google-Smtp-Source: AGHT+IH6KUI2bioFkoMZdiCXVbMS6OWNo1xhcCBiJkbNjUI36kuWQR3a8SDuPSHNgleWUhg85nvxmA==
X-Received: by 2002:a2e:3518:0:b0:2ec:57b4:1c6f with SMTP id 38308e7fff4ca-2ec5b31d1a2mr12159971fa.34.1719135210188;
        Sun, 23 Jun 2024 02:33:30 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:ffa8:3dda:1e1c:17ff? ([2a02:810b:f40:4600:ffa8:3dda:1e1c:17ff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724adc5dd4sm48127666b.129.2024.06.23.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 02:33:29 -0700 (PDT)
Message-ID: <c7882f94-e2cb-4023-a53e-87ebc8fa3460@gmail.com>
Date: Sun, 23 Jun 2024 11:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: rockchip: Introduce the rkvdec2 driver
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20240620142532.406564-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Detlev,

Am 20.06.24 um 16:19 schrieb Detlev Casanova:
> This driver supports the second generation of the Rockchip Video
> decoder, also known as vdpu34x.
> It is currently only used on the RK3588(s) SoC.
>
> There are 2 decoders on the RK3588 SoC that can work in pair to decode
> 8K video at 30 FPS but currently, only using one core at a time is
> supported.
>
> Scheduling requests between the two cores will be implemented later.
>
> The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> currently only supports H264.
>
> The driver is based on rkvdec and they may share some code in the
> future.
> The decision to make a different driver is mainly because rkvdec2 has
> more features and can work with multiple cores.
>
> The registers are mapped in a struct in RAM using bitfields. It is IO
> copied to the HW when all values are configured.
> The decision to use such a struct instead of writing buffers one by one
> is based on the following reasons:
>   - Rockchip cores are known to misbehave when registers are not written
>     in address order,
>   - Those cores also need the software to write all registers, even if
>     they are written their default values or are not related to the task
>     (this core will not start decoding some H264 frames if some VP9
>     registers are not written to 0)
>   - In the future, to support multiple cores, the scheduler could be
>     optimized by storing the precomputed registers values and copy them
>     to the HW as soos as a core becomes available.
>
> This makes the code more readable and may bring performance improvements
> in future features.
>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   drivers/staging/media/Kconfig                |    1 +
>   drivers/staging/media/Makefile               |    1 +
>   drivers/staging/media/rkvdec2/Kconfig        |   15 +
>   drivers/staging/media/rkvdec2/Makefile       |    3 +
>   drivers/staging/media/rkvdec2/TODO           |    9 +
>   drivers/staging/media/rkvdec2/rkvdec2-h264.c |  739 +++++++++++
>   drivers/staging/media/rkvdec2/rkvdec2-regs.h |  345 +++++
>   drivers/staging/media/rkvdec2/rkvdec2.c      | 1253 ++++++++++++++++++
>   drivers/staging/media/rkvdec2/rkvdec2.h      |  130 ++
>   9 files changed, 2496 insertions(+)
>   create mode 100644 drivers/staging/media/rkvdec2/Kconfig
>   create mode 100644 drivers/staging/media/rkvdec2/Makefile
>   create mode 100644 drivers/staging/media/rkvdec2/TODO
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h
...
> +static inline void rkvdec2_memcpy_toio(void __iomem *dst, void *src, size_t len)
> +{
> +#ifdef CONFIG_ARM64
> +	__iowrite32_copy(dst, src, len);
> +#elif defined(CONFIG_ARM)
I guess that can get an "#else" since memcpy_toio exists for all archs.
> +	memcpy_toio(dst, src, len);
> +#endif
> +}
> +
...
> +	/* Set timeout threshold */
> +	if (pixels < RKVDEC2_1080P_PIXELS)
> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_1080p;
> +	else if (pixels < RKVDEC2_4K_PIXELS)
> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_4K;
> +	else if (pixels < RKVDEC2_8K_PIXELS)
> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;
> +

Did you test if it works with anything > 8K? If so, you propably want to 
make the check above

+	else
+		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;

Otherwise the timeout may not be set/contain invalid values from any former stream.

...

> +
> +static const struct rkvdec2_coded_fmt_desc rkvdec2_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 16,
> +			.max_width =  65520,
> +			.step_width = 16,
> +			.min_height = 16,
> +			.max_height =  65520,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec2_h264_ctrls,
> +		.ops = &rkvdec2_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec2_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec2_h264_decoded_fmts,
> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
Note, that this is also given to userspace (VIDIOC_ENUM_FRAMESIZES) and 
this is already incorrect in the old rkvdec driver (and hantro): From 
userspace perspective we do not have a restriction in 
step_width/step_width, as we are aligning any given width/height to HW 
requirements in the driver - what we should give to userspace is 
fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS; fsize->stepwise.min_height = 
1; fsize->stepwise.min_width = 1; fsize->stepwise.max_height = 65520; 
fsize->stepwise.max_width = 65520; I guess this new driver should be an 
opportunity to fix that and distinguish between internal and external 
frame size requirements and the .vidioc_enum_framesizes callback should 
adapted accordingly. Regards, Alex

