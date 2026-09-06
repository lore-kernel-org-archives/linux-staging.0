Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F1154425
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703873; cv=none; b=qbkJt/1EfE9OwO6nLkoxphrelLVgRy4MKh/9bfFh6ts1SDn00zGky/v9Sc4mly6tyB/6WtH9KIC98V1VSPE3tDptA992MUr8Xc8QDSafjHcAl+VYqMEU+desX3G76KPv1vavsYYJ+Pi0hn1Fx4Nn1fbybefUcXrzqWy3fogfMw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703873; c=relaxed/simple;
	bh=nvcJJRSUOa2J+QR8VtuE7j7k9G8B5Cpno8sTQYkYEPU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcryPwQHHlNUhhMHshA2Dm63nB8zUzOnHWpiPq1C9Le2ny/Qce9FXprM0WemsoBdVKx8XZ5OVrK3ytT4TT0AjI5MlXcUB+/ktDO8b416E31nDrbjLLMWGxQkRYchfRJAnPXqPcKCmgolfwkhxKj7qzOhXmsq8FydNOPftr+u4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJJGlMPI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJJGlMPI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so31960935e9.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788703870; x=1789308670; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9p7U9U8tA55nei6POZ9glY9rrUZkZ5+MlV33iQ8GuQ=;
        b=sJJGlMPIU8bofqFxyYnmgRimqTW5Q9Ft6eSzMGXKxISECwpjpTmgFQ0qBgtIdc0k52
         A5qaOcxEZRs6Rt20gy4TWoIYjDRsDYVWZwprO0Q4kPQLlcGvXfd/NbeiHgcixsMAXZny
         5i4YALocGLWAgk26zssn9tdDambh9nDp17gGhaHEJtKNHivNudJ0eGgl8CFVhYmT5Q2R
         hoh45ulRoDxOgFANZ6Pi/+pTtarXYhzy+HRU8Il+71Dq6eaQMI23ALhVT38Ta1bfetCZ
         VUZ1Or5sZwUyA0AztGGXK/YplfHi1M78jLuQELmgwXWQdPTXLodm+9uyTEw0gyADRO2a
         zh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788703870; x=1789308670;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9p7U9U8tA55nei6POZ9glY9rrUZkZ5+MlV33iQ8GuQ=;
        b=GPRxo/t0yaD9+Fuwz6JtuAZL+qb4I5XVI3Gr39Guq4LFx6TnW5IJIg4krwoR5S9Gxa
         icyh2Ui67jH2uUvjhmYEWbev7v7an2AeTjClHztwCrWTNdgCiRZMPz3wO0kPQZ1GwDSg
         mu+vRfxX/X6KemHX/AVE1md/Zo2NZZgZogcl76hpGdELOy4XNwn2mRIFfuGmOoUf6FWJ
         ZOpVO2r4Q2kSlTbJhI4e7ni7oIsUCMcA2ukd2hQ1lNR/dqnwISAIoIfGv5AacUjv9HfZ
         7LrsLOa+YlR3wrQWm7IDZL4y1eBEMsAyVIa822Pv1hm/H1lMVUa3IBBjFFF/SPFsp5Ke
         XwyA==
X-Forwarded-Encrypted: i=1; AKwUvBz8LMmn/GM1dPrD8OzMuGASZwecpag0XcccswfTUvjJuDzJshry+xE5ZTK+BleJJVSRPh4Ah6ZBMy//Oe2+@lists.linux.dev
X-Gm-Message-State: AFuF++kiffeuOBRnidI2YJ931rbhDh5W1/niFSwIxBOxYRf5of2j9D0g
	7QApEDsj1KUvowF6BS+Ji5H/ji94XoEskkaR6O066K1NWCo7xsIc0SH/
X-Gm-Gg: AYBFou3nzaicvm619rUnDAmsfDuu3bgh+r9+Qwlds2sMRZijeSZaatx2yyeCQvkc5c7
	QxECB1ZDr/Wsoq0EBVdAIt6CzX+9n+ixTG6I7ggn11uzDW05zeM3c6ux1uL5p8vx3O1Pn16b5u/
	h1ZYNZUle7ePGQPEXGFUIzoF4MzqOz5zb8RnHsEJfaodgrv567C6OKuzj49fNthbFRyb5nqfbrf
	+CXPgRpyFb3Jn+d2s0LRU1k0lPLlJ9cq7EZHiWIJ7kTFiRmFerGAucswvT6xvWc1P0y2XNaS54t
	h8NxFb5HL32bocV3gkv/nCwwz+2BQl+rm5ZIeMG3i+1Hb2YQYtY66pFgtgf3xEd3KkHY7I5YI3J
	7cLLku79cyHWd7OTnO9MtJR0XG6j/sbbJ2pKeI37ged/mRdKNocktpjYp3OC7RDbZNpIZq+V8s5
	0qRrsoTasibFYz3aAErVHOOwezewtQW4zUtCZxAtS/fQJTkFiEvnXLKu/NdQOd7qHB2dw/clUUR
	xLdbWSOVxMhZzkJiPv4f5TnKZs4y72PVcDK+JZOYVM7oUWMEWKjreuLVHcRLHQYuuVnEDvA2AVE
	aHcNz1fknSVMrxvVkTIFPSCBbyFMX+mUiP9UsWX1kEY4UdtE+eoKl+zdJvq4SkghT/6N6LIOhCI
	lD7MtR98fPQ7nso/szJuSdNoOz6ULlY4mgERyziRQ+bXp1C6NdQ7+z0/lbsSi0wblVIH6LfjnOR
	iEiDg=
X-Received: by 2002:a05:600c:19d1:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49cfc6e8e05mr171160915e9.31.1788703869883;
        Sun, 06 Sep 2026 07:11:09 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm330420775e9.1.2026.09.06.07.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:11:09 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:11:05 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] staging: iio: adc: ad7816: Serialize SPI read
 operations
Message-ID: <20260906161105.61ac32b7@systembl0wer>
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
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -65,7 +67,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  {
>  	struct spi_device *spi_dev = chip->spi_dev;
>  	int ret;
> -	__be16 buf;
> +
> +	guard(mutex)(&chip->lock);

Actually, I thought I was going crazy when this compiled, only to realize
you added the mutex in patch 2. Compiling with only this patch applied yields
10+ errors. Each patch must be atomic and cannot break the build, even if the
entire applied series compiles correctly.

Please revisit this.

-- 
Kind regards,
Joshua Crofts
