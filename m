Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA90502AD
	for <linux-staging@lists.linux.dev>; Mon, 24 Jun 2024 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719217009; cv=none; b=t0rqGem0PvbrSxYCxCuN71WpGSu1qGLrIEv5kmdbWgp6oSv13G/pvZGuMwF196vQAYnrXrA0f1T1SAZXVGKE4zPb7zflr7TdvNl7tkZ3IyqqnXg0olejnTE5WVYhlkck6cFQD2GyccOY0lceMCCpH1UPY2QEWIEbE5IiatJqCCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719217009; c=relaxed/simple;
	bh=hFRLAB3p7iRVqvgg60dGABp7FuRqhy6ia9zfd+8UKr0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=gFN8rCkhXZ1XKxIMOV/e1fr1BDEy2eD0A72mtLvuhYBhtXA/uOAYRMDnq1k7PqgeD1v4GTbdPdrrLi5k9zAC8FU0alELHRh3FIC7Joc3PN0vDKr5NQ50T6LEx/cw3GDQ+jHr+UW+6Kz/WNEsV5y10WEGUqnETZ9Bn5yHix1psPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwL4hVBz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwL4hVBz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42108856c33so29214945e9.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Jun 2024 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719217006; x=1719821806; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXrTSK6bVTTPMRrTWn1jiwS0BgSLK4DHIpn4IueFd94=;
        b=mwL4hVBzzKQPIbwbnWyBYjbCyUqLl2GIe6q6Ec2lInoj2yPow1/XX0YpLVve+XH5F8
         OPMcI4mUIF3Phyuz59vxESipR2PP5zQyh/ZwZvbtDHfmGII219c+ab0F4p6fNuD/qHES
         kRGlUCsZJdHaOwo3VyuQv2tXfiqK5LldIJAgY8LGmAM3wqso9By7L8EsYol++Ek+nsIs
         c41UMmjE2iV9iXn/iSfrRe3VxaFspEuwk8/cAnOlpHP+lcb3ChMCn/W8Iia5cZBmYVr2
         xTERF5+XgaPbH+rVwNquLCaR0tF26TpWKuR6yqMNDU3lcfVyE25ERpMqy2AjwORaTurH
         Q9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217006; x=1719821806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tXrTSK6bVTTPMRrTWn1jiwS0BgSLK4DHIpn4IueFd94=;
        b=biCRogXJGUprF87ORQoPaHz06fInr+Void3IfA5WALvQcPVsbkCaNqYhuoIQ4dlAFW
         btEFbDXLvgXb/f7MORsqzLMfWnoP8AGfZZyKFd+NZqpOS68Wq4VUJ2pg98a0whE1OJKL
         bcBusMe8xtVP7w8PcesKHQTh4Gyrm9YvpRd5+U3yv0sskCgWL6EehGNJJZ1Il0IAphay
         exctNSDFSWr5xvjYiywhmPM5hxtutZV695MzuXVfMOODDH/siYcmjWf/KSK0yppOGteS
         9fpwDLtSWpUu2pbMpTmx6D6fJKQZdzb4Xuf5Z1jdjeTLFUtQZfXjfYmSaDallrr8QReC
         x/zw==
X-Forwarded-Encrypted: i=1; AJvYcCX9JX9Sb1IuMZ7jvg1j4ncbKxHU+H+YO8aHEVVLKgwIZFzUPq9WBDvPukwk6L95O0YW+igFWarQjIUJqnS5H9rAA3LCabydKqH9cjvThw==
X-Gm-Message-State: AOJu0YzSeHZKLBx2G8zcrn414zvsBrH8TIuvRwFWOLe/OUa/yXO0H2ET
	MDFt21Q+ZzHAQ5slQ7rLF2auM7lJUfBHk2CvnN0Y4l91qbgHupaUFrnXZBt5dIWfIjK9MrTd8kw
	tstD5zw==
X-Google-Smtp-Source: AGHT+IEo+12j/9T1nVgqzN9xgRI7usrHUa83kh+pyoH5xJqWRauCSS3MRB/w6TAmFp7e97EFCmj/bw==
X-Received: by 2002:adf:eac8:0:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-366e325ba0cmr4438059f8f.1.1719217005218;
        Mon, 24 Jun 2024 01:16:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54e4sm167163005e9.23.2024.06.24.01.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 01:16:44 -0700 (PDT)
Message-ID: <344a7c55-fee2-482b-88dd-4827422f7ed0@linaro.org>
Date: Mon, 24 Jun 2024 10:16:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC
 family and update GXL
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
In-Reply-To: <20240604051533.3312944-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear media maintainers,

On 04/06/2024 07:15, Christian Hewitt wrote:
> The GXLX SoC is a GXL variant that omits VP9 codec support. Also add S905W
> and S905Y as GXL chips and sort the GXL comment.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> index 55930f6107c9..47dce75aeae6 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> @@ -31,7 +31,8 @@ properties:
>         - items:
>             - enum:
>                 - amlogic,gxbb-vdec # GXBB (S905)
> -              - amlogic,gxl-vdec # GXL (S905X, S905D)
> +              - amlogic,gxl-vdec # GXL (S905D, S905W, S905X, S905Y)
> +              - amlogic,gxlx-vdec # GXLX (S905L)
>                 - amlogic,gxm-vdec # GXM (S912)
>             - const: amlogic,gx-vdec
>         - enum:

Gentle ping, could this patchset be part of v6.11 ?

Thanks,
Neil
