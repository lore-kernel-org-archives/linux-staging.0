Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B36316DECB
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724317954; cv=none; b=jY+wQVyexWdZI3J1ypHDgTNyzXZlHaG3GfCUJJQ4jTaQ4iBOTiBhOeZdPJiqQc2eAsaAo5I2fEugdDS9v+gddSbyXujvLXtMH9AlZ0AWUcZ0XbmPV6CkVD+4oWZ7CCsjsu7z+shZiT7/Zuw0muczqZh5xMsamh1dUcThRhmTvzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724317954; c=relaxed/simple;
	bh=fFAvq+LiOUScZdK+iHMqO5f6qYOsvJSM5jiQ1E+GQK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIWpXSGPGoPRBIugTT7P6+dXvEkeLQ/Ga3VOOFK9PfGOzzVAoum5B+cNnUqmRRHrB8PcOkprvKI0yn2I4s2rfJdIDf95WJ/+WZnA1kM0E42Uzf05AUXj9e2w3Piqt099Xifisnxz5EZ+qAv/sLxGJw09qUyclQVFx0uEwNsnhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KswLjmQq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KswLjmQq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso668829e87.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724317949; x=1724922749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUuSMzV2vIHp0C9+1vn9JoGjag8c0vylXc1L0rYzmIw=;
        b=KswLjmQqWynDDsooIzseFBfte7gqEScwaTdN8Ie5KOSTQI85krNYm+HuS69qNhCuKn
         w98Co+HYIb6dW0vqx1cI5cxfSyO8Um1BJWcA1WBaWkVLow8IG9KgZmE1mFUzHqhjTSuX
         OGosvILGS//9CLuCJaEM3jbz/ngNIPLwtPsJYncNOXFpdMPqrOrqiUZCQj0VecYyf1lZ
         /WK2hxSZesGpTImZ1yREMno4fw4RGw0c/e3hlEiQ9elLfBC6ukf3eq0gOrjav9jkyfes
         oif3nL2AUdvMb4kufTuklxgpDszS9dPin1aEAeUK2SGL5yfjJM38GkcbaDGakFANHxe3
         xq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724317949; x=1724922749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUuSMzV2vIHp0C9+1vn9JoGjag8c0vylXc1L0rYzmIw=;
        b=MQPwnPJMuSrNIbZJYMXreGXJr0xdLDw20a1zJ1p5QUthYycuHQeUmanEzEj5N2cEz5
         gY9K1bnikp6MwuYV2+CnAZ+xaSO8ZWWwbpaNKNBufOCu8k7xcPVby2FIZXlf8bdnB2ip
         eavAzOe2RNwDlcNVbFPmhu1oDB4EwSMEa4ZxosQghwvV9IdpP8VbfiSVlLlfZ3bVzEkQ
         61QSOcQlbBQqZf7trSdearu2guBNeoSxvUc1Et53zMBsy4C/mCkXU4Eio4uoPCVrqTU/
         a+I6x+Xh48d5p4hPaQzXJLhtiQkjYrZb8yRiIyILz0H6CD1se3dDds97IUEgjo0kpCrn
         IZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt80oyfBw0IeSpto4JMM5NOAHSnG+bLWW/ByTpMTA76ZgkPd7k8PZhlu+MXuBa3OCaaZANiL04pOHLIktm@lists.linux.dev
X-Gm-Message-State: AOJu0Yy086c34UKsmEfVfGtiZSqNY7HOkalcY5AJGz3N9VNvuEea828H
	iL4FhPdiIt24OXV6KShfOzOj/NZfoet7e6T3UN0QyBCPBcKwWedh8p8vzebbH74=
X-Google-Smtp-Source: AGHT+IGkixQ062iVw3SWBM3aPJAQvXobN0pXR0RX1oG3yd+dxTAgYJ187hfxrMqr4WvC9E7Fs9PkxA==
X-Received: by 2002:a05:6512:b16:b0:52b:c27c:ea1f with SMTP id 2adb3069b0e04-5334fd59032mr775625e87.55.1724317949009;
        Thu, 22 Aug 2024 02:12:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2205e1sm91732266b.12.2024.08.22.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:12:28 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:12:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Montenari Pechta <mrpechta@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: rtl8192e: Fix camel case
Message-ID: <6fc7a4ef-7a24-451e-8138-6cc4af033fc6@stanley.mountain>
References: <20240822002733.27609-1-mrpechta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822002733.27609-1-mrpechta@gmail.com>

On Wed, Aug 21, 2024 at 09:27:30PM -0300, Gustavo Montenari Pechta wrote:
> Fix camel case on variable name to match style convention
> 
> Signed-off-by: Gustavo Montenari Pechta <mrpechta@gmail.com>
> ---
>  .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index 6ef38f4ca17c..14e50acb40b5 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -240,7 +240,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
>  	const u8 bMac_Tmp_Addr[ETH_ALEN] = {0x00, 0xe0, 0x4c, 0x00, 0x00, 0x01};
>  	u8 tempval;
>  	u8 ICVer8192, ICVer8256;
> -	u16 i, usValue, IC_Version;
> +	u16 i, us_value, IC_Version;

The "us" stands for unsigned short.  We don't really want that kind of variable
naming scheme in the kernel.  Just call it "value" or think of a better name.

regards,
dan carpenter

