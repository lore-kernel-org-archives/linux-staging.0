Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14FC427FBB
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764981; cv=none; b=lgX40YPjS7aq6Ic1b0hsHnT9g6XILKoiyIAhD3/4TbT2GO8zqkCHuLQmXVVMyq8u+ycbFFNDkIM306quZSs5csOpAABe/vobB5BqGGOHFwdJiRRNHOhKv9QkbRquaRxoNXpCY7yg+elo1yIzyNhm1QA0/NqmWvRZ74+SKou8njk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764981; c=relaxed/simple;
	bh=0sVuVy30zvai5kKbo3WJN7Jypck4UVRGwg/D/OjuGTc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVVSETMadbhGlnBMY5J4yMW1w8BPGFLFPh5FdGYtMHr0+QWtRLRsahDHhNU8SCLs46zArW7615osMA4uByIAzEW6BOecq04pyfxKWob7pgRqnahYqHFPxspGroPeN6QE8YmgAt801Awxr8XaiMzfQfDqlNARmt5Rez8Nd6bkUXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqVMrzHQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqVMrzHQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so21845035e9.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785764978; x=1786369778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vtm/qhV7r620+a36+fltihLUGsMjtPQRBYKm3XNynmU=;
        b=hqVMrzHQ5jfDECer2tF5TipULmR18JDpKgeZmoaW+/72HvcnIWi2we8NtZP4cR+Oib
         ExkaQbIdRJAG0PsSr43c3SnkHfpcUVrNM8EsdQwJtg56VQTfK7pOoSqNq21lJtpslVk0
         e4seBRqbI04bseon0NQn1lR9r61WyybzpppeDvYi2U7tu6/j2nkvUyURfvdtSVzErZOp
         wQmhtYM5i8jXxO45V8xWKG7a7YU50zupB60+idNQEPuj06VaT0SXO4QSKUVyQdUGEoqN
         RoXU3dSIJkQMQbF/l9R3Pjt40PZ4wuvzIIKsJulO5D/S1BIjdaY2A1cdvSaJcA/h7Paw
         uZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764978; x=1786369778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vtm/qhV7r620+a36+fltihLUGsMjtPQRBYKm3XNynmU=;
        b=JKgaNHD4Gx/Nnhd5AkJKwiPL3tjiPCjkBJu5NwvxK/lCzYoqpn1CmU7QKI/mqrJlth
         A5bieof1C92/Q/949KNGY+i7X17no5y2gx8aKASVJt2Kr5IP4u1hIkqjdi5Dm86lUcV9
         bzUUIza1V3cYPqytd6Z5awTo+H9EF5QcOPwzkpRv+frXbUg5Sg4vBHU2+ISe4U+obiBr
         QtpG4FXZA1Kri2qoDojAuE2jXV8GnwvR22AsvgjgHWXt7Z++TkGnPt3S+LXd9q1Y5kla
         N3arxKqoROqTJGTWoDkw8XYFU2uNvKnzCqY9hnGSLtgHoJeuFidhiSJ8GJF+Cn2SwTua
         LWzA==
X-Forwarded-Encrypted: i=1; AHgh+RovcryUjRKOXxrJrDXmwyuWaBK76M1atkfS7wX52wa11wLIVX8sI51LAtdu4xffGkFyhpHTADYQFCEpBoti@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6URkgUbGa/idtp1rQuhWNGrOX/qyDVx5kPJCq+HQa0baxvdWO
	QZ7h/WUVMLNuR4UOAOiqVZCJzQIJkmrbLVatIHoDQhjeGNsXrxdN5WCn
X-Gm-Gg: AR+sD1217TNgZTFTQmh5It1sXo8Ty4M9YFkVt9djVJz8swab6o7C8HNtncu+AncWvGg
	nHtWcTO+/AE1/pAtxKMQroli5RZcta3XS/5tzigRagBI9o9jn10lLwFbIBGyyLkz45Zq3f9XQyV
	Z7yulkDGx6XBE7+iAz/AqX8yy8GbfvURvziaMH0L7+kvvLnLmIhdVCq5EwhoizvKDlbqfoEAIcj
	dl5vZABvGqOcNKCUSy0ARRjNx6YMsZoGoUzJtKWMbs9TrQfPtpsLLJ3PpgpO4IkD6v6BGZczVZ6
	2VUg5DcWGx0gzw0QRXouZJUrteU3+6r4NNuL6XQM8Jxbl80nSIzFJpZj1Whfnf2s/03Ig7OZhtd
	gvi2EIyggnL500KsCpWGvEXQeJktUOyBu7+2IBH0qOMKWKD1ZnjixZYT6kaboWgtI8yFe4i1ezG
	+ZpXTInmvnGuEiyyCUqNHoqHHPk8ReghLh3wVuHjPlntofu75Z/WpW10VRD4jUmCXEnequlF1ZR
	eG2ih8NTFucd+VtNi75hW8+0lGsRkE+TcH1bMlHrTTiRaW8nfH8PiO4WnGJ0aVWCQcMJKHfLnUO
	kJ6SJVfwMo5NoBmtOiRitEE/Kp8udI8l58gDRALH/zIu78ONgcD7Qq5QGmZC0YVRMLYye67JPaP
	TDGZsFg8QZOJO6tJjlxFxS8Xto/7ZmS1+I39gZ0Xg9sng0X9VlbJp+Lzdfmmn1+lYQV10bZQ=
X-Received: by 2002:a05:600c:3507:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-4980c6747fdmr140518405e9.15.1785764977771;
        Mon, 03 Aug 2026 06:49:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b917efsm367415595e9.11.2026.08.03.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:49:37 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:49:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: iio: ad7816: serialize
 ad7816_spi_read() with a mutex
Message-ID: <20260803154935.000014b5@gmail.com>
In-Reply-To: <20260803121520.6274-2-abdelnasserhussein11@gmail.com>
References: <0bde2343-8a70-44d4-9b27-8ce42c099309@baylibre.com>
	<20260803121520.6274-1-abdelnasserhussein11@gmail.com>
	<20260803121520.6274-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 15:15:19 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> The ad7816_spi_read() path performs a sequence of SPI transfers and GPIO
> state changes that must not be interleaved with another read operation.
> 
> Without serialization, concurrent callers can interfere with each other,
> leading to inconsistent device state and incorrect data being returned.
> 
> Add a mutex to struct ad7816_chip_info and hold it across the entire read
> sequence to ensure exclusive access to the device.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 0e32a2295990..b5a0c2871e00 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -50,6 +50,7 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	struct mutex lock; /* protect device state during SPI transfers */
>  };
>  
>  enum ad7816_type {
> @@ -67,11 +68,14 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  	int ret;
>  	__be16 buf;
>  
> +	mutex_lock(&chip->lock);

This patch would benefit from using guard(mutex) from the <linux/cleanup.h>
header. 
> +
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
>  	if (ret < 0) {
>  		dev_err(&spi_dev->dev, "SPI channel setting error\n");
> +		mutex_unlock(&chip->lock);
>  		return ret;
>  	}
>  	gpiod_set_value(chip->rdwr_pin, 1);
> @@ -94,11 +98,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  	ret = spi_read(spi_dev, &buf, sizeof(*data));
>  	if (ret < 0) {
>  		dev_err(&spi_dev->dev, "SPI data read error\n");
> +		mutex_unlock(&chip->lock);
> +
>  		return ret;
>  	}
>  
>  	*data = be16_to_cpu(buf);
> -
> +	mutex_unlock(&chip->lock);
>  	return ret;
>  }
>  
> @@ -359,7 +365,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  	if (!indio_dev)
>  		return -ENOMEM;
>  	chip = iio_priv(indio_dev);
> -
> +	mutex_init(&chip->lock);

devm_mutex_init() since the driver uses managed resources. Additionally,
please check the return value of the function and just return on failure.

>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;



-- 
Kind regards,
Joshua Crofts
