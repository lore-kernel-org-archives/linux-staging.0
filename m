Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C338DC56
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703583; cv=none; b=keV6pR//mrkskqMXkuPVL3Jm/878q/U8C5TdRHezgzMvzhQwe72M1GCzr85OVqLqB6q460ogesaOVHmS5ONYkqTCpUGIGWWNquh73R9L8Hu14Smh193+f2gun1GJCGCnXJ1bTF/DhNhPtpOVEGxk4BGSMDlC+EJh1w6Jeax54wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703583; c=relaxed/simple;
	bh=tI9FVh3+xvu74Y2zPQNif4JKysfG1IXGu46QtIN+5WI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQ3KFoZYAWFUfYOtAKRx8biGYvPwZCXSZ/fojlLTLIkRo31KltKMQXJ/0+nD7HSW1Kvxt3N9gb5nQc28zgrn0nIItTAvJB601J4oJI/O9/1CN9wJt/hoYPF0DdUuxOMTV16CL21TRJ4gDFB4xcSVbIO3Z8jejY+H2vtyAfhw8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYJytnez; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYJytnez"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4858595f997so1463346f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788703581; x=1789308381; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gs6/YbhXKRDZGsRYZYKBM+a3pqzRoKUz45XvXh/D/hk=;
        b=AYJytnezeWTo4F0rpzm0wXHC3IFnQag33xYFHGXlecrMXsArkPcPtZg0977t5NvO7U
         OTfpdpUpF8Nb8q78kueF2hN0dbXbXU2Js5PKUffqYay/TVaEaNXpIK6Zp+HEgxRxTZz+
         vDtmy5eQwT91aGEmHzVKlGVWzw7oLizcIiW/kf+GPFyVjVEIspJoUp9Bk8RFfTNZhuwv
         +z+7iDOIxa2MK7NupV6ZthBbriY0WSsJWIBQVpmfScQMBrhFUbMGAfKbsIGJ/1DT3OPS
         IlGt3E3jAVWCRqYFsTAHnO4vQFL0zvS2zjodLGVuwsT84Hvytah2idOOSiWVu8v44vl6
         fb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788703581; x=1789308381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gs6/YbhXKRDZGsRYZYKBM+a3pqzRoKUz45XvXh/D/hk=;
        b=GMS51PgaFc34v1ptJCcwjGQMPRLxf+zjgYc/zaAlH6qN9MPEgvoOtNxKsApltQRw/7
         qveej6yP8xxCwUZZMP/dCcllBWCgVQh/JrvPevMpvbkFnFlDHDIMuWOrKOqG0Ni/mTCN
         PZhCROWtbbvsPFutxCxZymBMlvxCjN2w27IeDiwIvz33LMTfovye1gkxSt0zsUTtaQKU
         5JdSLvIoS3ZUhg9rNkuPCUaseWvmmX6eoJypc8C5GukibYP6Z8RGjoese/o+q8+qQkZ6
         WG7tux/JuOkhb7V+s/o1Pt7iK2bZy25m9whEFymPUpmLo8ZiaOejxTeLncV8oVMQSdvN
         0h8w==
X-Forwarded-Encrypted: i=1; AKwUvBygM8eQl4mzS1nSM9TWRqXrotTOata8+HgByw135HQ7NbuDG+lteAuY6NKKksrgCnN1evuLrhYYLs4VroD+@lists.linux.dev
X-Gm-Message-State: AFuF++kLBd6G4WOE6hDpSbiJmnOoDTPvC7E5sg+0COJkkl/ktuXPjwnq
	lRJShYvU/chj9xQpxjf+BNGbiKFABYUZOLjJPkeDv0nNQqBgKYkDaGO2
X-Gm-Gg: AYBFou2ANfKVcophZFRq7fF5DJo1AOl8YuRUNKENA7jDytJOi6uJ5APYh8J5MqfdwV+
	MWv/ECN0N3cFiEEhm9k6R9VDYCGl5Qr9aM5kBOwe8CC0yyfJRbGh30sYn0wkFTUekUHbrgY3hys
	8moXmrJMAdwfIbRL4l36bh+0wBaUeKgWLLt0L4QqcVHy8WI8vXoxgEvRUKuQO5OdXUQP1evHZ71
	VDk0pxa3zqpoRRmE9CdqyQFqBaELw9yw4kGPgbwS+XfbDlvbVr2EnFubaIZnDe8zPvP5x47F3/c
	V3hGFVUrW9ZHVgbg2YS05sPN/D6LvAT/a+Xm9sHtUHGP2nP05r1SJZf1OMBDat6TsrpOVUWaEpd
	R+lZpw5Xxiu6e/+iiyFAjUmBVlAD5GmJa+uvzgVn37UxXTL3iFgZPLuSl3Tscv3/c6IOpduYCiO
	m1gP+pqG3rCvgvVu0WFzlik+4VbuNCNtRx0ZoTNRXcCrQV3uQuYhUPhMXeUgyRn5HiOn/uyMbOZ
	ThY/DzWllcegbtXT/s1tdoTr7dG63bHbzvt0beQmjPld/ms0nFr4DkXEkL6qUkefcELHF4RO7mJ
	0GEMmQisO0dLc2aikjrddhd2ps8wLp8E2PvpWwPkzxhEngS1TLxGexK97d6zbUhlnbnduNj93hI
	Wf1kjiWuiKOFc4ehbojh3IyKonQowTeVDzn42w+Oo1lU7EEW/zeW+MqWsFDMgShSY0U6z
X-Received: by 2002:a05:6000:29d9:b0:484:3310:710f with SMTP id ffacd0b85a97d-485872934dcmr27595134f8f.27.1788703580544;
        Sun, 06 Sep 2026 07:06:20 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm16599300f8f.11.2026.09.06.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:06:20 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:06:15 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] staging: iio: adc: ad7816: Serialize SPI read
 operations
Message-ID: <20260906160615.2fb5555d@systembl0wer>
In-Reply-To: <20260906114049.32912-2-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
	<20260906114049.32912-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:48 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Add a mutex to serialize SPI read operations and prevent data corruption. Used guard(mutex) and devm_mutex_init() for safer and automatic cleanup.

Please wrap your commit message to ~75 characters per line.

> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 0e32a2295990..ab80b3a889bb 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -14,6 +14,8 @@
>  #include <linux/list.h>
>  #include <linux/spi/spi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/cleanup.h>

Even if the header list isn't sorted, try to add the headers
in the approximate location if the list were sorted. Better yet, 
you could send a patch that orders and cleans up the include list.

>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -65,7 +67,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  {
>  	struct spi_device *spi_dev = chip->spi_dev;
>  	int ret;
> -	__be16 buf;

Stray change? I believe this goes into patch 2.

> +
> +	guard(mutex)(&chip->lock);
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
> @@ -360,6 +363,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  		return -ENOMEM;
>  	chip = iio_priv(indio_dev);
>  
> +	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
> +	if (ret)
> +		return ret;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;



-- 
Kind regards,
Joshua Crofts
