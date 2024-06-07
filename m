Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3B1953AA
	for <linux-staging@lists.linux.dev>; Fri,  7 Jun 2024 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717776297; cv=none; b=nzS8pss59Mng2XCloauHLp2I5xo6zsPRiZSTilGPcu3BIB3PiYnzXwTZ+W9faR0idmbtQp2J6bOiGLKV2sOHXeVhBAHpIK6r7SJ/nUchn8wS5JtiWkfOKEDhUxzsD/OGXFQkjDuojjtg2DAPR7sbMzm19OsEH4HnL7TOuQ+bDaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717776297; c=relaxed/simple;
	bh=XF3f6iDBLjVh6WynPeig0UvGb0DigkwMdfgbk338+B4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=FMeqhzPXBpWnYc7c7Xh2Z8ldwomKs0uwPSidu28VonTcqTBljBFY3twbyYpNDKmRi3L+/ksIbzUVEyw+3L2rBuBmCEJfabdEyfIPOCYfva78LdPG6XMB/T1MmY6RJNJwwUSsDs/P+ghu1WacD/PheKuEHK8hbuh+xO2MwwMPS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmcjKoea; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmcjKoea"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso2625161f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Jun 2024 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717776294; x=1718381094; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MijIgA09q0PdO32nGZaoZGyK+T1ltd9jm7YiJqErqN4=;
        b=GmcjKoeaMKUFxW+D73nvKksfbvGoa/yQ3iX1B4DCTXq3zDkt9xRruyhdDaAC9wOVcu
         D0ID1+4p7j/tsy1cvlKWQM+slXfPMwJY+g+3t/4ylJpUNmai64FGWAC/X396VFy6w4uK
         arRVJ4XU2q6nBt3ZI6XuRGKy/X7uUjFwsVb9GtwXt47pTq6iBFfuk4f0/Jz43AzFp6vp
         sJhQWSFVe5sxBxDT12i/kY+bYqtLeMHgKinC1BXZMl5gMdGZMDFGjCr0f7Bs5z3NddR4
         HtZBKx5dsniBqJqmPOTy7TT65WP0s4mI5GWkEMcZffC6bWVHFhEAEkQTCrIS9tc834Uq
         k0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717776294; x=1718381094;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MijIgA09q0PdO32nGZaoZGyK+T1ltd9jm7YiJqErqN4=;
        b=nt2GMhn5Bs/tI7fss4HS8JPFm5R9DkJqD0/mBAHfLR83WiHE7eHuUF4N5+c5oLr/XT
         kZ70O1MpzKcNffagFRl8fOWy2HcZDc4NXpyvBZgjoujfIUcG0edsAkxszk/rWHXLTevQ
         EXvW7P3WswlByTQUbFVNpHn85F2HVJvpZtYTLaBwMv5ZkY++9iJppAY3VjyKjr/vH0Xe
         I+hITrIDcUpubtgZiA2+aHug156AE2l6Vqs5tHl870QzTvM/oEyfAE/LIrMPeUZB9vbs
         vgSgGm0vODq4YtFO3K708fxpTy+KvsNxVmxwicbFfXiH6p9njmcnw4qgJDyqWZV7l5I/
         K5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo1hkIZFrs3V0VtSBDNLAc34dIW8mT7/oeIOLsAml5hiLe3j6YCpDL/rgXILUFpq4SRSp1BSIdH8RGEBcfRPOI6C0W8Ib0puNzQMXIpg==
X-Gm-Message-State: AOJu0YyXHIq07T1xH/S9wSipWYHHFAm5IspAucEp4B7+yNjiYJ1Omkz8
	Y4UDMSVYKeJqpJLD009r6wnkAgUIfeUz/bNoo/sLj1nqjIrKhvwc/Ux4fkobSsE=
X-Google-Smtp-Source: AGHT+IEU8HYa3hCTxSSYayUA1arnljkwYr7GSlFCw5TxepPqNeXLrtFb+yavJ0gq5yYhVjrRMVV3Lg==
X-Received: by 2002:a05:6000:50:b0:35f:d60:f183 with SMTP id ffacd0b85a97d-35f0d60f2c0mr1006174f8f.24.1717776293576;
        Fri, 07 Jun 2024 09:04:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f094fbf3esm1392894f8f.77.2024.06.07.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 09:04:52 -0700 (PDT)
Message-ID: <94773a91-a845-4821-a6ee-a0be93ea49d9@linaro.org>
Date: Fri, 7 Jun 2024 18:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] media: meson: vdec: add GXLX SoC platform
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
 <20240604051533.3312944-2-christianshewitt@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240604051533.3312944-2-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2024 07:15, Christian Hewitt wrote:
> Add the GXLX SoC platform which is based on GXL but omits the VP9 codec.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/staging/media/meson/vdec/vdec.c       |  2 +
>   .../staging/media/meson/vdec/vdec_platform.c  | 44 +++++++++++++++++++
>   .../staging/media/meson/vdec/vdec_platform.h  |  2 +
>   3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index de3e0345ab7c..5e5b296f93ba 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -982,6 +982,8 @@ static const struct of_device_id vdec_dt_match[] = {
>   	  .data = &vdec_platform_gxm },
>   	{ .compatible = "amlogic,gxl-vdec",
>   	  .data = &vdec_platform_gxl },
> +	{ .compatible = "amlogic,gxlx-vdec",
> +	  .data = &vdec_platform_gxlx },
>   	{ .compatible = "amlogic,g12a-vdec",
>   	  .data = &vdec_platform_g12a },
>   	{ .compatible = "amlogic,sm1-vdec",
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index 70c9fd7c8bc5..66bb307db85a 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -101,6 +101,44 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>   	},
>   };
>   
> +static const struct amvdec_format vdec_formats_gxlx[] = {
> +	{
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.min_buffers = 2,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_h264_ops,
> +		.firmware_path = "meson/vdec/gxl_h264.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_MPEG1,
> +		.min_buffers = 8,
> +		.max_buffers = 8,
> +		.max_width = 1920,
> +		.max_height = 1080,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_mpeg12_ops,
> +		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_MPEG2,
> +		.min_buffers = 8,
> +		.max_buffers = 8,
> +		.max_width = 1920,
> +		.max_height = 1080,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_mpeg12_ops,
> +		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED,
> +	},
> +};
> +
>   static const struct amvdec_format vdec_formats_gxm[] = {
>   	{
>   		.pixfmt = V4L2_PIX_FMT_VP9,
> @@ -263,6 +301,12 @@ const struct vdec_platform vdec_platform_gxl = {
>   	.revision = VDEC_REVISION_GXL,
>   };
>   
> +const struct vdec_platform vdec_platform_gxlx = {
> +	.formats = vdec_formats_gxlx,
> +	.num_formats = ARRAY_SIZE(vdec_formats_gxlx),
> +	.revision = VDEC_REVISION_GXLX,
> +};
> +
>   const struct vdec_platform vdec_platform_gxm = {
>   	.formats = vdec_formats_gxm,
>   	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
> index 731877a771f4..88ca4a9db8a8 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.h
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.h
> @@ -14,6 +14,7 @@ struct amvdec_format;
>   enum vdec_revision {
>   	VDEC_REVISION_GXBB,
>   	VDEC_REVISION_GXL,
> +	VDEC_REVISION_GXLX,
>   	VDEC_REVISION_GXM,
>   	VDEC_REVISION_G12A,
>   	VDEC_REVISION_SM1,
> @@ -28,6 +29,7 @@ struct vdec_platform {
>   extern const struct vdec_platform vdec_platform_gxbb;
>   extern const struct vdec_platform vdec_platform_gxm;
>   extern const struct vdec_platform vdec_platform_gxl;
> +extern const struct vdec_platform vdec_platform_gxlx;
>   extern const struct vdec_platform vdec_platform_g12a;
>   extern const struct vdec_platform vdec_platform_sm1;
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
