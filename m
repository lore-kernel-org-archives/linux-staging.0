Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E030BF52
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476199; cv=none; b=BpSFWEWJ2BG+FVgxiN5BgQXUDMF1Oh2f5RyNHfG/kTSgyO4Dq1s3doUlNhFn4dSgGpWC0ID7A4jATHREf4aXaFT9SG87sP/nUpXdydeyOWGtk8m9jmJIDhIB5b0r/pkNCipUDyTBSGNOqFPaMgdiQwdSxmlArogGQZnRXGSvRUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476199; c=relaxed/simple;
	bh=FEscob/e+90GaHE2E4U+4fd6PQekvU5FL8BnBdihcrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7lQhiFH2uUvRSTzf789qNBCCQWqVymYzl8WOaEwg/Ov+98E0NZE8hMotZU5ZCdNaagpDodg6ELKJ7MAS/UQekCMXTiTRlNXjosgXBnrEiyO4ZllskYuFRTw+bzV37BsxNiG5+gcqowwPuWRVZg+scCklsfnm6yLsmANTw3Ob6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orNflSJz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orNflSJz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso245117f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476194; x=1761080994; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=orNflSJzbHtw1M470U5qO1uIFPPuUqZOABJnBqweA4CMnEj1k/mNtHDqpe0tVygCfN
         llBSfHrvgXgNWCy4uSoBHs8bYF9NofSSEvtGctOpENby5yJoeS5+5p/y32uH43pFYZMR
         LH8e9AwQtzqM9RpwOj3H4DHKbgZEwj6AbwAcKNtiNpnE6rFDHOgnnBtriU67l70H4jvL
         6aZj9tljb4e2wVtEN39yvay7dyjlJkUNKTTArqsRp09nnx7Ww78G31L5tRTq3iGBz1zV
         K1SvQkXFU0ZfdiwFpbbb7wsqVmTDPCP7bNv9cLvYSgzXglXpXB8+jgqwx/woKFqvquHQ
         xKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476194; x=1761080994;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=WCv612ulc9xbrQSfwRLhPDby3SJ/h6a2wE9ZsT5m68plnNzKujUqQjx9X8haoGIx5Y
         pkDigsyrfPJzWNrgWqf1nAAcW58V2PBipR2aqsLdIE5L7ZTsVBLPd1ePeNaqTNSJS/11
         MaaInwbU5gVZX1OiwE3MX8EdoTuFlgclVI2kTdl/9nv10SICXvDbfsK+h9pbv/WaTKhb
         LyeroerFvsiBKY6auq3UQ+7IBraxCw68vmBwCK1ur+FkShl2BhsuBowKJr7HqoSetxEg
         +dOapMc3B8MyJoYHfgQGqz4hwMHGJdVWAIVpgHlJIIAUYO2eXIzRSvn1NtrR2C0rw75u
         e3OA==
X-Forwarded-Encrypted: i=1; AJvYcCUWYLxGYiuUNA/k0Hc9JhVG82vblNTitDOUAnfdmZyloD1umaeNVPIioidnpd2dhLP+4G1pY9O4js0Hs7mU@lists.linux.dev
X-Gm-Message-State: AOJu0YxGSGyBvoafz7eT8Zz+YIdBMCsm52yj+zkT7ri0x/M8ERpjMtKD
	3bgDHI1cIzsA6/tarbWqt7lXpk63UEYPREOvBal2YnJiGrD2tO1vzggzxIBvQoSRNuY=
X-Gm-Gg: ASbGncsQ8D7l16LjZbHg0zb3njJhFIJQ/Wlr5GXACZKUbJCiF/yXplH0hcR+dE/GWP0
	q62b9YC9Q5NSo/CERgnDuHFl7jAk626Q/ek9dIWVVZUWLmF2hTQPNfpRJZDEMVdoE0HfSH59YbY
	OY+O7PHPcXSE5te+XBVZATD2+PuOgjLNYE0opQhegf7u7201gelwMvOWVTKjPgfyiWShUWqddtO
	CjGi3hxJXwXCfR+yGEE6QQGHhdZWys9Z8I08/p1EIzpFG/W1eF3KzjBaqqLnUwAsbaMeuSIEHNP
	AXrepjN3QHuoUN5ATZaM2AgoyYoBQe3syeD8b9JgWiQd8kA2WiD1lVJoAAMfsFw2gPp+Z540gG2
	SUjvBbIFzNFpmtG7b6w1DumQ+W53XAT4RowyczNiWkwQdY3O9ekbTQ7jcehBxWU73DXN6NtQanc
	+i4l/AEBmKc4YXEkGwlkL3tQ==
X-Google-Smtp-Source: AGHT+IHMLDEl/2OUqyd6dsVKt1UGXh3BaRNNfQRox5yRqmlsYRCZeNTg0aqnPOJfK+LSUdRcw9kJiQ==
X-Received: by 2002:a05:6000:2389:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-4266e7c7b2fmr20416940f8f.21.1760476194354;
        Tue, 14 Oct 2025 14:09:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm25169444f8f.15.2025.10.14.14.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:09:53 -0700 (PDT)
Message-ID: <ebc5be79-7184-4a91-92fc-8a181ba096b5@linaro.org>
Date: Tue, 14 Oct 2025 22:09:51 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <U1BUWm68sWNPUXHr6NOsnc48bb6eXIL5tcAzrNijItgutDvPaBTmCI0qf2ERLQB_2BFYEBVNvWTQdmx5z_UU-g==@protonmail.internalid>
 <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/imx412.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>   	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(imx412->reset_gpio)) {
> -		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
> -			PTR_ERR(imx412->reset_gpio));
> +		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
> +			imx412->reset_gpio);
>   		return PTR_ERR(imx412->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
