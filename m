Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5153C3456
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810286; cv=none; b=ln2fNPQUZIs9WDDIDkFxo6bBDiIsZBiYOdBJYrWGMWtBDxfAB+iwHA2zQAspCvSuXpfzC5QmbGQ8lksKU5EWUXcLhxEUTNYTwz36H5jjcWjaLRHSlli9rxAipxTBcgoGVQzVzd3WMQ6aUnaCubaNlukuE3/sTQZTYhyp68IbvIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810286; c=relaxed/simple;
	bh=SNfprDKeEAk5wYlgA1hVVVIHsXt+aVLRxcUxr1jrF80=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pq6kH9aYtlzOUkSn0Ab2m4nh72MvPirl4L0edsQrZ+H8jBmHZF+IahrYVyrqrqeBdo6CPNOpmduiNghrJIWfsXwyU6JuqRrkYZrcHs+y8dnw9XJNejzm8y8Gh7N2il1wb1S/KL/khFVuOXrqLP+nOtR8rJWvee2KBWSnj6lxkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkArSiz7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkArSiz7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so12848165e9.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789810281; x=1790415081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+PkC9L5fOjPL6sBbulqfAvEH4cZDiVNQRsYYaLvTHWM=;
        b=YkArSiz7VsLuiCcQXmzQpMsBY2NzStCV0VKoUYL8IXaGnI46ReeLWTglDo37zNIGR0
         2PM6xQNu1oVQOZHOZF9XL+muytC5rTaYlSjp2m25O9qoJPz3xVm7PWcddBR+SgUSnuDx
         rLvVNRvnp1DXPRL0dN15BX2gbY3Iu4mUHCm8kOOFc1PjkZNWfX49+v4YjosRB9gMphJf
         AHr8JNiTl1kHsm+JmbvP87lpwdGaogaadpNlkufmAcLd3gFgtsBYO0XafqaJHUlsVdwO
         8MPZYwHPaPuSsR4MGGgRTwlELpxnr32/P0ApnyYq+jlsKo63F2k94746qpRfi3s9S+Hc
         f4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789810281; x=1790415081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PkC9L5fOjPL6sBbulqfAvEH4cZDiVNQRsYYaLvTHWM=;
        b=KwhqhHsr62+uDaNZlVWqrQqcwHwoeDZodPbDbjp8t9JMX96Jekd4CzPxvl1+6NLr3P
         kQAd0thZT64bMCZ8eBmnpR4p3tvtQ6ojV1Nn/nNp/Kxgq7wlxZGfOtaKRvDOl5irDPAw
         UjdtTtWTTN8X90N9ulN1tyCJcgr1TfjYg5YBzjqbdjsI9acnkjcJHeyREv97k+RnY0y/
         rGbKnjh6q7b5Hyb0TPfmOe8+8ZC7KSD+Q+V6RoxxsKh1YgX5O05zr7NJhSiSYsyBUyd6
         fX8jc34P6z2JtBrxJ12JRfK8IFIcfQhRD57HAjWHk27DL45fTyt3QTiuKOmr2J0Ak0L3
         CbxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDpFY7nJeqWhvjzJZyOPZfimFTbuSSQZhbGyy8JaG3UEMddCaP7RJPhxoKptBRgHRQPzDsHfqKluqE/KL5@lists.linux.dev
X-Gm-Message-State: AFuF++n56tpwUCJ01kQRsXo78ea7a8kIDesLAkJF6vKDTfcjS1fbgA5X
	0b2afhBKLXoj28VLIFYAqeRKF9miP2gFqCLKbtJCAy7W7XNIjvbobeAt
X-Gm-Gg: AYBFou3WIbM9Rh7iYJChrwSIvbE1pi15BcpFd2SZCjdjGjnckJSoYRM9K/q2aPOsj2j
	ue3bsQHAMoGUggbdlITZfFFndQ0M6cEuUsvWQtjYPnkmI4V4S32LDRqM7XdKeC+jn6SbE7tVTtf
	JWVogItisxRAKdX0U+e7J4b/ncY5Ok5vsJC9MyCuF2E1Xat1M9Hewig/conWp2DHpH00ESIPuOH
	4LQN7JUvvdAotY+82q2fvCEBbBMW/CM/+BDXUVYw/6WyMZZXL64KAl57h8hteJPDgMpS0mKi0se
	/B97JuLETVihCM2aa3JSYR4c0wYf/2jfk5cR0wXx9cXbC/Q1pX0R0H3TaZAU+w9HJw9ixpN5qdL
	2X0hHz8FUDcfeV8lNOtske6pnsTqxoUFRSRguUmYb/+SW/2Z99aCcVQbOuMfGHdN4YmO3fqMWw2
	PTkVbZlvzy5Z2mb7B5V/n6IzBRYSlrYI5cRGVzCVU4m93YJeWkpPIwKg/N+hQSg9Wp1YwngyFRy
	eL315aW91X0e/d+FBgvVEp2wQyqmb+Os+7riwVm2T5S3Cr1cBOrxElExEeOpVzec6jw6Xqa5SZH
	EAu7V2BBQHMKbbens028FPXWd+h1mMp5ym/Z/Y8icm9J+MZ8iGGTOedjEbvh5YJvjRGNXTGZQfq
	wdM0k9ziESGVQj1I8taUEWoYLhtUlH0o=
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr79130785e9.31.1789810281330;
        Sat, 19 Sep 2026 02:31:21 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd086ce9sm85591855e9.12.2026.09.19.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:31:21 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:31:18 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adc: ad7816: Protect sysfs attributes
 with mutex
Message-ID: <20260919113118.51036850@systembl0wer>
In-Reply-To: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
References: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 11:55:13 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

...

> @@ -143,6 +143,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct ad7816_chip_info *chip = iio_priv(indio_dev);
>  
> +	guard(mutex)(&chip->lock);

+ Blank line.

>  	if (strcmp(buf, "full") == 0) {
>  		gpiod_set_value(chip->rdwr_pin, 1);
>  		chip->mode = AD7816_FULL;
> @@ -207,6 +208,7 @@ static ssize_t ad7816_store_channel(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> +	guard(mutex)(&chip->lock);

+ Blank line.

>  	chip->channel_id = data;

With these issues addressed,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
