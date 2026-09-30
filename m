Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B5424642
	for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751413; cv=none; b=kZWHQqsVUUGUqZhcHsdx1qSnLg1zd5RHYyNwoNEsWFTzH9sMIWj+C98EjWDentajUMeUUF96jwV4qWQVediWJ07RcqOhkGqMtYVfPlkHjLO+nM2fpg8CWtJx8VymslAGENroioldyqL2i1Hb4nTbGxctP2JfMIvFaR7Hv6EfCTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751413; c=relaxed/simple;
	bh=+fxZlZKcmSzpMyXlmu9ij0waNERL2gFRxhZvKqLEvEM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvHrm32yN/WYkMpouUUUvAEawpIZM8X9X0BNxnUnT4IKUfKu3zk9OslCBNtJEvzifElcc6QgtM53FOqzkWfWbEXcDcu1NRPN/wZsjUwrYGpx7tOG15otojiXuAXUvIW7DlM8V/DoqNZxIqt+pRduROOy1Tgdl8Kxg7siOS5zbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvphWuLM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvphWuLM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so30280195e9.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751402; x=1791356202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yuHgAjHOVltJdZTQWjHDacQSlYBFWHEKS15iSGeBiRw=;
        b=gvphWuLMSSQKnTT8cnrg7g6/3XHrvHry3dvqDMMSmqjSgROIg3FQObpbf3L/ZQskyH
         rW8kkFW2FVZ3+UwqR8jEQO5jdAUqGzbnpcZp6yTV6xpCXNAcMrbQHYiLatuy6Lmf2TKY
         loMqWcC8+uO94oDIp2n0obtJMfadz+EohB6NL1AvVWrV/N2dvSQ4U+5JSzhtXgBFUACO
         U+O97qJYPrqWLA8SL3d1C/+5VbMg/zf58FAioxq36xGKAXUtOuPURV61v2XngbecALrW
         7NKxm41oMYODEKixaLws+MdHAtxHuhxPd1IYPuZcuGeVFB6NOBpTK36ZU31UKk0qkaCJ
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751402; x=1791356202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuHgAjHOVltJdZTQWjHDacQSlYBFWHEKS15iSGeBiRw=;
        b=CKSNEf7ky9NkFazrSHiB24LMFpzmJQJg0dWLhqzdZFpUyioAszszRizY+M5bO1J0ce
         aJMxZ4y91hWYYvPudXM839k8TazQyiJAlSqo+EEmGvUhpKxc2dSwQ1Y5ACTnPzlQdds2
         omzeO8Vw2gifOPGvOVcYRTwUv+jjATFYNoYf0/eSPU2X6eCmKXdpknz/v3EHnBZbeDPk
         Z0iHH3VX8nkkLSxCsOwvIkipyBPk04yBWdGRo9HGhUvlW9DdKRZCHKQRYsykWDdAWZ/J
         U2itMOZAqYVAKG+ysuLUHaD7WvG6Yuc/O7j17FKSmpR8zGt/KB5uHRht634mhjml8LVA
         HPww==
X-Forwarded-Encrypted: i=1; AKwUvBz9y/Gyveik8DnlMrFGKlBzFipFmUGQ+rbI4eCn0RF7kmBsUEPwSSpziiFnMcdJ3MAH2U4LB+nwu2+JB+SC@lists.linux.dev
X-Gm-Message-State: AFuF++mifwIFPouOGHwQIIbnR7VFZCpIDg9o9h/UfL0JAd9Ga3xTus3O
	/Bp8bi3B9A2dnOCJ67iMIGqeHVsZhck0Tc9ncjbybe5Pw8j+j4OridYk
X-Gm-Gg: AYBFou3grkOxb15Ej45R9df041pTKBIPXvYSV0J1BBfm3NDECwBC0U5utFxX/I00n10
	8h2msSCby1TcefwZ9tcaxI6jR9T8Dbn3WK+KUFAk7KwAi5l8oqLA4/YHVxhcbyTNSjcfDWWJDw4
	NF0aD7Ya7Sfn8wiM8nQwYOmcVBAgl24hNutNBmwDkAiK+x4/fB6UxokfbBo/IyPn288Dlde+xc+
	Rr0fACEWCGtxOm1mnRugKCuGbAVHX7dPUrKvxZ8lrSqLzfeLVxMkN2x/ILNVgcqgPXNHpBhOZRi
	POkhBvpZnjtfviK42uKweHZxXgyqwMnz3r/jCVucOOsw+/DpiUenQdAhpM5Hjz4c49x/pe+ZYG4
	OL1HGnHjQRDBnsa0mmRk3V52tBnsotfoSBl2MfPBGhwzFc/QDOJOXr7EAS+2z5fr6k4gpWu/k15
	8m8yvhjfkciy1TFxte6VMjQcsN8kwmVbAI/WzeggcvhLtCxP3LrjYVgxY5IYHD8zIY2JrhkpNYQ
	MLn/PswmKlT/Oe5rI7InKrcNihPGgOkWaWNFKFeMhPRCiIt1N35+kEDBb2/lK1hLesWJY9k4fJF
	aXhRJ2SQ9rnCH9uEqspTE3wt/rmRq2Y7niARjbwm1xwFeqeN9rOZIQI8soWXJ/u+X1cVZsgUgRG
	9PuT0a6XliWZj4IQN/ua0lwr841eoZr0FFoRv5YFnf3MW66+gF/bMS7sTHQO5B5LSVoH53suyu4
	fudXYrrwwT/1KlfsE=
X-Received: by 2002:a05:600c:1c01:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a01aff256fmr6408235e9.12.1790751401995;
        Tue, 29 Sep 2026 23:56:41 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174e165fsm34856325e9.6.2026.09.29.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:56:41 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:56:40 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, error27@gmail.com,
 narcisaanamaria12@gmail.com
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
Message-ID: <20260930085640.00000377@gmail.com>
In-Reply-To: <20260929184900.39515-3-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
	<20260929184900.39515-3-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 21:48:59 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> The driver currently relies on OF/DT matching but lacks an SPI device
> ID table. This prevents module auto-loading on systems without device
> tree support.
> 
> Add the spi_device_id table to resolve this and ensure the driver loads
> properly across all supported platforms.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/accel/adis16203.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
> index eddb786d4747..905485fd556f 100644
> --- a/drivers/staging/iio/accel/adis16203.c
> +++ b/drivers/staging/iio/accel/adis16203.c
> @@ -11,6 +11,7 @@
>  #include <linux/iio/imu/adis.h>
>  
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

No need for mod_devicetable.h, this is imported using spi.h

>  #include <linux/module.h>
>  #include <linux/spi/spi.h>
>  
> @@ -292,12 +293,19 @@ static const struct of_device_id adis16203_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, adis16203_of_match);
>  
> +static const struct spi_device_id adis16203_id[] = {
> +	{ "adis16203", 0 },

C99 initializers please.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, adis16203_id);
> +
>  static struct spi_driver adis16203_driver = {
>  	.driver = {
>  		.name = "adis16203",
>  		.of_match_table = adis16203_of_match,
>  	},
>  	.probe = adis16203_probe,
> +	.id_table = adis16203_id,
>  };
>  module_spi_driver(adis16203_driver);
>  

Additionally, you should delete the MODULE_ALIAS("spi:adis16203") line.

-- 
Kind regards,
Joshua Crofts
