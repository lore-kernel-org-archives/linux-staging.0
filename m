Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189393B14C1
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704157; cv=none; b=A7q0FPlvQzfCsVuvR1tDzZDRog5DWtMs65FkZxVAGfapXZpT073Sc7iMrov7U2QihUv3Ph4HVyP1mIppnLYq3qUwPT8ZdcUmEUQHN3hR/xwOGalhVglHP4V1Ka1v+wE5mrUOT5mckYBF2CH6/EMVHjz47wiYdMTFcOLuqbTW2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704157; c=relaxed/simple;
	bh=5z1XyfZy9X2PAxK1/9Yh2cUeXP9XgPJuFrK5ZQ96h4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUZFuSAy7pDH0LCH3oz5GukjoHGlcsHlcM/IH836Fg4PCD8J+gbkw9zz+NmoO34GuzwZ8pKkGlaGeOFleYxiAWbkO+ZS1HqE2Aib62MIUec0tIRUk0BgtdQgDzaGp7VbvwNZ9O1XE8BYyM1OZLI/pyq+NB8wlhMCJ80NlHF1XFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfsBMBeN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfsBMBeN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485850cf499so1515187f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788704154; x=1789308954; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kWMuuXK4yTjCPbPm2zu6KDXy0eIRwL1Ztz5775GY5k=;
        b=MfsBMBeNR5/2AnoPD+T8rL4oGvehf6hQK5uyiX7Hf7SAWJMd4M3GdHqwB1F2rYllZ1
         etwBKqng7wrTb4tqmEKn/3KTycG0ET6pIuvf5VuGoNf3BcAgeLtLnBovfKtPj6VC9mLT
         Tn63eE/U2XfoXGT4UFM9zOXS8vps4AOoA1Vz7FtgO7/Oiw3GCtz+4mkFPMt3Efy/InMb
         qCg230+Q1tEUQp8LnV49lRqnB3zTI6pmCtHd/TVS7wP0NcXuDh9s/jU8DEOOk2AkoCpk
         UswqRH92Rt5BhOOtDIhZF4g4rbYAlBWbliSzGYJzsb5GEyJ15CDhfl1oscpHnOrzfPOK
         ssHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704154; x=1789308954;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kWMuuXK4yTjCPbPm2zu6KDXy0eIRwL1Ztz5775GY5k=;
        b=NDKCEdXnD4s7rODLWXGBsHUqtjPLekg2mnsabIMX1xeA8vx0h8RiONw0fnDgUSNrMv
         SH2a9ltkoF76g/jM8wmi7e0Rvc/Te2Joq/TL8O+14MOGfGLTgyQUYOZYVvgcvrxO+4Pc
         Srfw+qowHBuZX2/znaO53ZmE56ry/HKnFQ5/uWy4AGoVUCiFXoT0kUBIp85DJhh0qvtU
         iU83ur09DdsSh7oAz63e3LFLY6iZ/0OAGlkqB/KdoWiHhV3DZaxhFZuh8KayJuCiqA+f
         DhPo+PFlMS8D9EIT1nc8IR/Bv3rtBpkukc5Yp0JrnoA3xc262ptPH2v+fukguY6cHIrI
         QW5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4CDFaqCVth5qlwrnA3ZQSuj2HznwS8hPwOgvR1lwTdIsfGBz3Qru2UQvw64473yST2JhbGC9b/4dBIr7@lists.linux.dev
X-Gm-Message-State: AFuF++lXIiTzLpEVyGmQoSxc6RzklckZp1VvTDbHn5GpFyprfICZ8Plz
	GgWJWugcv/VBvDCkcLv4ZKmKiKDfE3pj3GtFU9tC4D78ylndNvtZ5fXW
X-Gm-Gg: AYBFou3lnvzbpDLcYnPVuHA9ww650r0bZATjg2OL3XiaE1vi9R6/18eCl4Y2o9PhYUx
	PUPP9gBUS/2c1MmOQBA+of4zvZ3fSErx0PAbmuNUPt4+AVZyp5v290gytPtRv9CjgMmsuP+Bisj
	l5jitJmi0t1jiyH34k2lcVbrcyXDHIu362RnCbDaZ8zxPlPXirqJjaiZBM8XhjQWZbFj0NFrrms
	GQwU30zCQYnk/+9ak+UCOpts3DEnIzgZ5Z6cWSvjQinA5+XyXOy1/A7OQdCMRqLjx1xV23lz/Po
	IJZ4ME9NtEL2fQoXDBCSbBoGOR+MFMMh3uuyPTfX1tSWz/2G9JE6dig/2r3JJxf4mVfF9H/kJTd
	Pu7TpIcUVmd9KN0wD6lSoGehlpnh+STZ4iv9YktPctY3WcAeA5VBSZw/xi38Xkpi+7Brx0uAvXU
	NGK/m1B/S6Yy9nveS/4siogMY3Ol4iiYPyc6+XHrity5m217ANFV7vrDTTkbyiCJKjIurAX81nP
	AYl760OXRqR5vWHSovhHjxTIfeWbqbWaFT6/S7mwHZpAsepKPgImv/+Te3hINhmyc5lMKNUc4lY
	GZA0zIaEL5inxCrz5xLycvEYcMdj3H/V7Nwh6Pvpn/96mXc35TY5CKTUL0ODvkB+lUdC+w4a14J
	G29xWGmXhzLwdgmlep30Q8bK0FhKaAKwJqUTxXsdHp7piKxctslFX7Srz5VqIQeSJUTHYZHxy86
	KdY1w=
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr141792295e9.29.1788704153980;
        Sun, 06 Sep 2026 07:15:53 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm534138115e9.15.2026.09.06.07.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:15:53 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:15:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer
 for SPI read
Message-ID: <20260906161529.5d2c874e@systembl0wer>
In-Reply-To: <20260906114049.32912-3-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
	<20260906114049.32912-3-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:49 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index ab80b3a889bb..e14ae805f076 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -52,6 +52,8 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	struct mutex lock; /* protect device state during SPI transfers */

See my 2 replies to the previous patch. This change shouldn't be here.

> +	__be16 rx_buf __aligned(IIO_DMA_MINALIGN);
>  };
>  
>  enum ad7816_type {
> @@ -94,13 +96,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
> -	ret = spi_read(spi_dev, &buf, sizeof(*data));

As well as the fact you removed buf in the first patch, causing build
errors.

-- 
Kind regards,
Joshua Crofts
