Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF44A95E
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187471; cv=none; b=YPaoeqeyad79Iflizx/6p0OaSwk0tBgzqRVGw+LwWSQRLgAVWzi6q/cebfQUkCMZtHWRPhSt67xpcfrS6nr3SFqwuRi5RVDOfbiOiuto6wDSu/IvCTXukJ4L5ohU54H2+EGkQquJWJ+nYk2PfPdO3+QuGU0a6IGqZCwiAt+8/kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187471; c=relaxed/simple;
	bh=+43BOdwo7VXiTUsgxdy44JLwgVIf885ihZJy1GIB76E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqAKoQ9kZteulWO7aUKnF6FH8SvQ0fGmnX6WiW5BuCXWHsy08sYZ7/D1YVRGlZA6vRtShvHbhgkVOCjGVrV7IQY/Q5JUzOx+JpSt+1QR2D5Kgml9KH5Ngx6GsTaWqrM8g3B/egJc/Ac/uFI5xTNQ35rtPE2t6R3ULKKuFbEDHaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bT0lDmDM; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bT0lDmDM"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-463f00cda04so8112246b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773187468; x=1773792268; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=bT0lDmDMZEA4Eux2o8G61U/cO9A1U1LHWPAMJfKRAp9sTW34RcGe4VTf3i9fmACvRh
         ipq7rZtdoka2p2I9o2xYimivwpNfUxn4vPG8ScwrK/azPMkVuIChXvbz7xyB6399sT0c
         91luqV0/dvZJcZIXAlNmuGdwd4yzX00/Zrpo6CZXJknHQ9QeZlVhknf3l5xXC6sERZoe
         MZ7fMczSUkw67mOboZVqZps8z2gmDdf3es0AuQl6jwUQTmjMjemHIWFu9WZuYhzt1D7v
         9ZB+7IEMbHahmbYsMRVhiCfoCVYbm7wx32Jv+8EzHUV3bd/i1QgA34LPQMGB4tkJmg2f
         QBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187468; x=1773792268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=QMfgvHaouww0mprksd616QfpZ30XwjrC+2Cb0iHYPEYnmahc/y8p3iPXFCPFOvTDV4
         ssmV6l3XXjUHXFn2ZJDSurkzCi7gw7rHwLeFY4hOZ3EFFyIin47iYUYGMubBssV8/Gfu
         gB4AoSXnro48DZyFudgaI5Fqb635cN/knSl7qBSVD3ktcHr/63Z8+syXxGf0xp69RGGa
         TWqKPLUL+0RkzzSG8adWqUyNh+pts16GM5WA375kmDj9b1YuE+Ca4ZLU2Z0b1sWUsqXg
         rtBVGn26pJRN5wqFy63Zz5EH88MHosA9wLv+1wheTyNjdu680HEU5KJ2mLgCibMgWXTU
         PyQw==
X-Forwarded-Encrypted: i=1; AJvYcCUGRQ6Sq/8xpuE79e2Bt46dof347VibeQWmvKIjzrgXPXZE2RDCeW7JZR5gkNsFrOCyUL8IWPimj9Kg+uCY@lists.linux.dev
X-Gm-Message-State: AOJu0YyzFIaCwgpZGmbCknbhcXbSBTHpN/g+WRHi+A1xe9pDGzo4HO0v
	YRSf2ZUFFd2Xl9uL/ER+nO3RKFM9hjb6+5XUkS1HjZyX0yiBiBciRgHKv9RMYceru/A=
X-Gm-Gg: ATEYQzw/MltBVfVvEI8jOIUgiI+xa1ShVTchbqAZaxO4phqZqy/1m8j/lbupGC7KFN7
	Y0JIwMEiJjH8HGNAW5KSTtxvaSAnhmBIw6quLU3eawgTdiZHn5yZCXxUhRmT0Qm4dnxJMt91IT/
	84O9LePfkCDrHHWB70NBK/5q8xWj476tt9qrSRgacMgGgnRgcR8sBJlHY+fNlZn1Cj9EpHzd5j5
	frCFGkcTEVfE5Bu2eOxqJru1Jx7SMz6wAKSd0rcNBXeiBhTx6EbMInWOz9ap5IZbuBsrE+2BFan
	5P9E18+n0P0Mjo0sdkjQWbtZRbai5x1c4/D5xPy9SAnuxmgzXKZH2fkt/u+ejJ9u8VG+MZ28uEx
	6mawnU35j68anjUq84PJdENmof5ANxPDwNRsTZYeWVP/cparg/04HJ+0a9gJLKnu1vJQO3WBE62
	qx7LfCybVk0te4wLjbG4nLfDhaTU2m3rQ6/jlFWqukpmDIm5l/621PzszUjLbyXGumJD79ZJWa5
	Q==
X-Received: by 2002:a05:6808:14c8:b0:450:b249:718c with SMTP id 5614622812f47-46733547c85mr330873b6e.31.1773187468063;
        Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03? ([2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm233690b6e.7.2026.03.10.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:04:26 -0700 (PDT)
Message-ID: <04ffc988-f4ce-47f8-a998-66d2553d88af@baylibre.com>
Date: Tue, 10 Mar 2026 19:04:24 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
> index dac593be5695..f641b62e692b 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  
>  	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
>  					ch->scan_type.shift, 8);
> -	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
> +	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);

Even better would be to not alloc new memory at all.

We could probably reuse buffer_data from struct st_sensor_data for this.

>  	if (!outdata)
>  		return -ENOMEM;
>  
>  	err = regmap_bulk_read(sdata->regmap, ch->address,
>  			       outdata, byte_for_channel);
>  	if (err < 0)
> -		goto st_sensors_free_memory;
> +		return err;
>  
>  	if (byte_for_channel == 1)
>  		*data = (s8)*outdata;
> @@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  	else if (byte_for_channel == 3)
>  		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
>  
> -st_sensors_free_memory:
> -	kfree(outdata);
> -
>  	return err;

Should be able to change this to `return 0;` now.

>  }
>  

