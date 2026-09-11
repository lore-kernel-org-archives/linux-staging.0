Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8546982A
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125530; cv=none; b=DoeKjrGlJHpRfADVsihTgqXVgYE1/ydx/te1ptBD8COAlbKVpc9plRjihkBMSCQAA2xblt8PSETlOIuTnToodUEc+SxkefFoLc7+xos/823eFHNa4WSk5vJfzvztGpSchhpf90Xdust1LM131zWBEpzHXzB+vyFtBwPdqdXl+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125530; c=relaxed/simple;
	bh=wV3pBxQrqLKd1wlVew6gdqs8o3bVNN2kXSEU1dTZDR8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y9prRqO5xqVCYfm4zf/gKaaKGtInrITX+5emfmAVo9spUIYk+zhcl/R4qlYr2pVNvda4+T/0/JxVD6b4sNPRb9KsUwyUMiuLQkths583TzK4VoSDrQl6YJiGw9DDvcaqZv4Ij8Kt2DXLp2z/GVa+k2k/jp7KhGJE+TGtZDbuUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6D0QjDd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6D0QjDd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso12088375e9.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125516; x=1789730316; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHdOC9EWQWOJTpdYs0NFS1/xOzQRIwZJ+gUTthcv/kY=;
        b=R6D0QjDdgJ14HABb4Z6Uiz8zDbNhkzo1PyDnZcuiKD9v0wb3yaEI7olamhNC4pZSx4
         E0CMbajiAs0HAUTLn1neNdNpaymR0AIRWUoUG51L/OU2iKpBs4poCTl4GXy7yQlaJsG+
         xjqxM+45dg/ydH9WHkoKBu8KaoL/KAE7I1hFtHChboWX6OLw/fQk/71ZvJhF6f0p4omX
         4aQ3CK3kQkbpgrfkRxF1KaN+P0vUUSHSZ7AolPMxsGoj59XfvtC0B3HXXr8cJlJRclw5
         oVdabaQrsDIO7pmkSxLKlkI7/VHye/H396TZNEWvC1yosjApuyEegOXUtpFRhJCsDhAY
         wQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125516; x=1789730316;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHdOC9EWQWOJTpdYs0NFS1/xOzQRIwZJ+gUTthcv/kY=;
        b=aViIjcXCHkp+IZiOc9JJCZbykjLtP/Xwd6/Hv4zj2CAtuKRR1racQEwv2bD0dcUnup
         N/fWf5VId4Xjb0l696PlsVScwvb7ReRnrSn0pEV9fdM9dwGMTqwAsg34/W+iFNnIRYOB
         e8joxxRc2828q1PmBSR6bruZsQ6bhEEUT5ky0ZLIyk9HzlgiRubDiB54IeituyNL2qRp
         zscRJUgHN9TBzdJZ0fZYYAVM+hH6Ive3Os5FUVi0fPbKRfW0Ad42jLPl/7D6hOwKL2qH
         rvx0+6QlJcJ9GYL40S86WuyP/9Pr6ZOdyWJ846JvnaQHp7edgENFKRAEktjE3fuXTKBd
         FePg==
X-Forwarded-Encrypted: i=1; AKwUvBx97Sihn2LkAB4GZA+Qq4OUsJ+SWQVAnJSTJnE9+oJtxk1ramjknSu4I4FtCZz8wCox5rAC36xZH3obwJ9M@lists.linux.dev
X-Gm-Message-State: AFuF++mQSn9rUmKkfDq/+Gd94xy8thrlcd/6m/1VjN0TY+aHiUKelDeU
	zo0j76goKNSUZ8ZWgfcFLnkViUgiqFVbfAHN94CbJgqaYrTrjtu2PX7R
X-Gm-Gg: AYBFou2y//z7FmNJ/1aGGzwJSRoJGLa0P6B6Vm11cK8IeICnBl2txPTR4KOx53GVf4k
	sx+rmiHvu5H50LApd4IFDQ/w3RMWqBAb9JdhLyibVmx7Rj8hPGrBzRKoqSkInU7MIb7ivBPBQ5y
	ep5t/s4NvaHJ4Bp8gP4Vohbl7E9Ebs+2jktbkXWCSHLHNFEDuDKPsHzK87b1MrdFhmGJWSYF2GO
	ex4jVl1sRZyvisGTzEUWSemzq6SiV8ur3cGsPN8YeQIszA0CzlzBa5t6wuJwqsTrNHCjAcz/+rH
	5rQhLCGPuyGETGfXpdJPYsO/n/kVlFqacH7E4iDUWWE9fZ8QWh41yx8TTuu2v/z+zlIBXICIrap
	Gxa12mVjv8YIsUqztx3jUUjbf8pRSO4Qi1vs2C3+F+9omQSBqJX6MI+DHZcebiPcsbsxIBA4yBR
	TOzgS8ITS6PIragg0aNfx2ExVMvaVPLmXt5yUj7yo8c+s/cRg97/9qwCvotOgZGSu3Eq3ifnVzN
	o3CVbtjuxvH7qqpXkeorjvMkJAwA7BfeFEf4ixDQFvzjnba2qJbUUwZuIRoZTgklT+M9hnlsmyz
	c9KQglNjR95NwYBjtEkFlAqpvkLyQeD/PU4UCFabFLIKXdhktctsAci0cxR93yjInu8+/yDwDYs
	omLPXdrGsRS+mVS0wt502ZX/CTvvt11li8PJnjvinWr6oYVVBtGbwbjh6uq/FQmsiaCANRz47oZ
	YcwSrQ
X-Received: by 2002:a05:600c:3f0d:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49e619cee90mr36362105e9.27.1789125515648;
        Fri, 11 Sep 2026 04:18:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm5335426f8f.19.2026.09.11.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:18:35 -0700 (PDT)
Date: Fri, 11 Sep 2026 13:18:34 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] staging: iio: adc: ad7816: Serialize SPI read
 operations
Message-ID: <20260911131834.0000514b@gmail.com>
In-Reply-To: <20260911110456.24873-2-abdelnasserhussein11@gmail.com>
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
	<20260911110456.24873-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 14:04:55 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

...

> -#include <linux/interrupt.h>
> -#include <linux/gpio/consumer.h>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
>  #include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/sysfs.h>
>  #include <linux/list.h>
> -#include <linux/spi/spi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/spi/spi.h>
> +#include <linux/sysfs.h>
>  

Ideally the addition of new headers should go in a separate precursor patch.
(excluding cleanup.h and mutex.h, you'd add those in this patch).

>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -50,6 +52,7 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	struct mutex lock; /* protect device state during SPI transfers */
>  };
>  
>  enum ad7816_type {
> @@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  	int ret;
>  	__be16 buf;
>  
> +	guard(mutex)(&chip->lock);
> +
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
> @@ -91,7 +96,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
> -	ret = spi_read(spi_dev, &buf, sizeof(*data));
> +	ret = spi_read(spi_dev, &buf, sizeof(buf));

No, you're mixing changes again.

-- 
Kind regards,
Joshua Crofts
