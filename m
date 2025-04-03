Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE724C66B
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682253; cv=none; b=YjefhExeWkAZVnFAaqMU38bltQF0L9aeZY7rey2bO/+Fa/t58w1u+VULCU86OROIHiFJB3G97V0QL9m46ZnBLs4GUW29C9pPs748Ps/jjP6lukEaIGaObFIblzVh/6vHtx4zNVGcB7u6jCe5LLfgFXm7rmJjyPtjCGJAoXw3++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682253; c=relaxed/simple;
	bh=8H1wxqvoUYBXAOWDQLWnzTYlqjM75UklZhRniT6YwN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8ohmnWFzxmNUKatEdP4yuAzq+8pdsA0jWEzZMY4Xa+ZjO1lSptiojfO130BRKEVB9yfG3pg96trPl/hYSgoDmQfFV08a3VVIYCiqUIt1Dx49SBJUclYP2owW1aLvMbqREzkIMHyA1kdpNTC2hktFVPTm0ETeDjO/Wzrhv65CQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpHraV1y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpHraV1y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso531027f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682249; x=1744287049; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwxMSEW/tN8wEYS66Vdt23HSX/OccF6Zf//Rdf0Iufg=;
        b=KpHraV1yeW9nyHb9SI9MGShWAJXKcFzhputdpaguG0LWOEkXcarpSRyAiqYASy1ONq
         tEqniE0/aXs0Y6DQqHbYHXKhA+lz44/vfdZD4zgxUGHKff/Zy/dF1wCGPJojahFZUh0e
         yUoJI9c6uWRhs8qngY663IJg+A9lJ+kqi9S6TCUCpKZhSn8zyhb8pClTEHAB45gm6+Cm
         XDkDayMJ7mVTeo0oIRX5bFky5dIZnaQgFLmmluoffU1LZ+c5tKxweTwb0RoWj0MlnT+E
         /CeE8oZSEvG5bT9f2iaNrFBk+2+RTp0QBh7ifN8DbMOAiYu1+vY9Ab4bjpitGJnYXLRE
         ePxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682250; x=1744287050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwxMSEW/tN8wEYS66Vdt23HSX/OccF6Zf//Rdf0Iufg=;
        b=prd5TYZB+7xY4ZCH9GISK+g08Bt/X9tH2txfFSvnpQu4zwr1mhVYtZ925dIutnCPFk
         8g6u4AztfLZlx3rgDQ4haVh26J5soporoShAIz6t/M+/zLu4gPwynfP4THgYt3xIUkoC
         wMVdRyIkQOrS04TBOND6lZi42VtfpJY5E/OO+YNssTate83aMqZtcIBNZkPijcf+lluA
         +662DpxuGG1r0a8nP7RJYCX0HoWQvlZsSbUx23s7sNmac60NP31txwwhZ6FAXA95/0cU
         NmAbi0FGaJx202BYSREmhiCfJpph5V6wV2C4S0rw1CueqYKfPlM0eSjtP6MXhSiJEAiZ
         7MoA==
X-Forwarded-Encrypted: i=1; AJvYcCW7muM6Dwr3dHt28tRsfQ+vbDicTRrQQTQseIMHCk03wkYS2j1ctXYLhv8pxT2FcGIGD35WspHmSI9C5SW+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz2suaYUDKnZn8zaWWTiUecm/mmLsCqClp5AK8OBhz7Ecogbf6
	nFitvROY3FkdEeUcl7VaK556sTmkdiBSdsl+J8tZ61I1dn10LuZmA9paxS3HIs8=
X-Gm-Gg: ASbGncttZPSUqZMTq0vkfSIfymMYeqt8bq7nr6XK/8bPc8ImkE8J6UjseT1zB/rrW6w
	Dq/BTqn1CGtMxUaUfUTCBv8LZii5hpoRwZ2otY7/roBSLyxe+RseG8D3hReZ0LUNsKhijHhQ2RL
	BXg+fGaNJmr3AMOTJuTFkYoF/9UI/EJJNig7RgXSscH6FD+078ElXhe5KL65e+PK1PIN0PTZNaY
	guYtQKb8iQV4G2CBiamJLGbSHEyQg0pdBU10Eb5YDsdGU2yj4YTSjd6GJt0IpIj0gXAV9BAJlBC
	TXpqEE2CpVZaCVXLmNy6MNyGW8CVBX6PWDn+Ipk49zagG3fClA==
X-Google-Smtp-Source: AGHT+IFfR2jDNEYU6ohqxLA66D9x/EjRIkHi/OodfaTJS1RKh9tDGyJw4YLQMD+MxkX73+TzcFGd4Q==
X-Received: by 2002:a5d:6d8e:0:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-39c120dd0e0mr16300609f8f.19.1743682249611;
        Thu, 03 Apr 2025 05:10:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec17b3572sm20036615e9.39.2025.04.03.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:10:49 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:10:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <Z-56xSy2kNnBmpWA@stanley.mountain>
References: <20250403093741.2372-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403093741.2372-1-vulab@iscas.ac.cn>

On Thu, Apr 03, 2025 at 05:37:41PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 21e9f1858745..86776d924c15 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
>  			return SDIO_ERR_VAL32;
>  
>  		ftaddr &= ~(u16)0x3;
> -		sd_read(intfhdl, ftaddr, 8, tmpbuf);
> -		memcpy(&le_tmp, tmpbuf + shift, 4);
> -		val = le32_to_cpu(le_tmp);
> +		err = sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		if (!err) {
> +			memcpy(&le_tmp, tmpbuf + shift, 4);
> +			val = le32_to_cpu(le_tmp);

Now val isn't initialized on the error path.

regards,
dan carpenter


