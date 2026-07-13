Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720DC2641CA
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928569; cv=none; b=B7ffaeA98l576T3FpxpoT4LL0+Ae0+yvSZj1/gdP8S8M2v0+a5Eq8w72aHndeHKfQ1OiF/vqICINFaevdYuRt/zp/gnRLXPNQuIRIL2k+8Z/Mdtfz1zq+5EA4VF93A8EbHTO4gBSafI4sR0Sy/HFdfchPBXObtwY33CBzsrtYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928569; c=relaxed/simple;
	bh=B9cRuOJInzXjAr/gtsT/q0sOde7tM4O1FOxmfrydyjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8VfoUFHtQ/VPBAkvoKUQr6yRH6/+4fjApSoV5le1+RG/Vd9rskqhaC32VC4RocRTwaVwtiyT/veIcmgdSElI4tylvvY+8DH/p9PJ1pyUBNGapQUtoSYx/kAHF1zt4nq9nEWAaKSylifFiYJFmqVq5TCrKi4Sp4sUQvWKPda2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rY0Ybwdc; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rY0Ybwdc"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4877a7b451dso1702531b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928567; x=1784533367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35OANEN5n/JHrZGEEa6HAE0i5RpyFLJfFmXKL1lTnlU=;
        b=rY0YbwdcdDyc+z75SJSItkZEf2GG2LTdZV6fjDxQlIZYr4MEAwxdSD+qu+YLm30cKE
         x4ySdOkHt3YBPMDyJltAVSJVGLeR/q0lBEW4YZbIXefZMjxN7LsLmHtMP8A9OgaPduxU
         WPDfx/O5EQ+5Zu8M4ZjcaLmEQ/nuN8mylYhxpc/9b/IA5tVGUeWEqr9E56Bzgyq5yn4/
         4vK19Pz02E1bzJWs5qkbgfuC6JE9fXygBz4vaDURX5ZDptWcilH8KsDIsWmCkAJdi5Pd
         ikyEEtPPYFCzcsJA5YKmmXM6AjsanX76u55HGerHb1cIJ7wytiPBeQX+Eo3Q9nOjD0W7
         SbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928567; x=1784533367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35OANEN5n/JHrZGEEa6HAE0i5RpyFLJfFmXKL1lTnlU=;
        b=FhG+ytFjVSFfA/OaqcvpjLHLiGtB3cwhgV9gnr3uVUeqQTYViwsqgZjWW/S6ReQEUj
         UdN+pxI3dLdR2UI5GVH1do0i4pPM82NTNsq+CHw34ADKRNcuEVe/aBt+P14vVC2J6zfg
         mFPUSzvMsoiUQ7LGC/yMs10yT1mLz4SCsu4qrWZ+HeaPeC4kKhGzU9p5Gbrk2sum0vZO
         dGoOgGnoIG/9sDWttHoIuKu8qgLpWwTzxpJEG2QJGqyD9gwxO9D0iXrNT6Dce+lMNauL
         FqFEHKtjVaUZSNKsws2bqPRH8hdmLyA8nn+gBEbgKa5kO4YPVEc2PsGspoTWyGJkECXJ
         3qtw==
X-Forwarded-Encrypted: i=1; AFNElJ+6Cd8O4VL8pMkv0q+VFc32WMfu+1q3c09J15DZ/rpPt+hb4w2rTH4s26I2pv4mqnfUex1kzVA0z4TWgiCM@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3yzoGOwPevx6EtmAbrHdyE/LV1N7iXbP7NFqUXE3lGLwxqdrv
	+VAE2EJ4uARtprz4dUcb+R016tm2TgZUaRO9w8EEHMAU/UI9po+Zoopr
X-Gm-Gg: AfdE7cnBAc7l5l/pgn+zwUfutRB2hbPV3xjGRGVDNV0b5RZbnFeMg2nVfZHv+HYjg6I
	cDtNyz0Elor1mKPvU/l7TfTULwO2Qp0AtDpbLKG9hRXEOTvW5vHD4iIQ6nDxhm/kcsNRmnq5aQD
	C1JDQuaNgvzsTCtYE+e+OSWlrnZEK9al/DA69RiglEkWzUuN21p4vLFu+44ejaAvrmAt5aRpkIB
	Ait1xHSs+/DqBxEfINIiExtUJApf96F8MYuZ+bw5D9FbDKi95V29W5LjtQwRLottmFHQMEFjg65
	aSaBI3hynY7NL5GTC1l1gQ9qwtWox0r7JYhBn4xUqFvuLhlNKJ1h9xQ4zRZzBVHEELzOK1B8pyN
	B4dMyIPLwYHfiTFMvSwUX3iWZZK63PxY5S1k4WNduA3BgmdTh0HlrYydczQon8i1OqkTp+8PPpR
	nKXNuZ
X-Received: by 2002:a05:6808:300f:b0:49e:d43f:1b8d with SMTP id 5614622812f47-4a42ac4c42cmr4718484b6e.1.1783928567339;
        Mon, 13 Jul 2026 00:42:47 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b02e8e5asm12423999b6e.14.2026.07.13.00.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:42:45 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:42:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dylan Liu <pxyforeverlove1314@gmail.com>
Cc: Dylan Liu <dylanliu050903@protonmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux@analog.com,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Signed-off-by: Dylan Liu <dylanliu050903@protonmail.com>
Message-ID: <alSW7wR4XTKJqUU8@stanley.mountain>
References: <20260712141928.559844-1-dylanliu050903@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712141928.559844-1-dylanliu050903@protonmail.com>

On Sun, Jul 12, 2026 at 10:19:20PM +0800, Dylan Liu wrote:
> staging: iio: adt7316: Fix CamelCase naming for sysfs attributes
> 
> Fix multiple checkpatch.pl warnings complaining about CamelCase
> variable and function names.
> 
> In order to comply with standard Linux coding style and IIO ABI
> conventions, convert all uppercase abbreviations (AIN, DAC, Vref)
> in the adt7316 driver to lowercase snake_case.
> 
> Note that this patch changes the sysfs ABI for this driver, as
> the device attributes exposed to userspace are now lowercase
> (e.g., from 'AIN_internal_Vref' to 'ain_internal_vref'). This is
> necessary to bring the staging driver in line with the official
> IIO ABI.
> 
> Signed-off-by: Dylan Liu <dylanliu050903@protonmail.com>
> ---
>  drivers/staging/iio/addac/adt7316.c | 228 ++++++++++++++--------------
>  1 file changed, 114 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> index 59fb3bd26bc1..845d79591128 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -663,7 +663,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,
>  		adt7316_store_da_high_resolution,
>  		0);
>  
> -static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
> +static ssize_t adt7316_show_ain_internal_vref(struct device *dev,
>  					      struct device_attribute *attr,
>  					      char *buf)
>  {

These are scientific notation.  It's like making someone's
name lowercase to satisfy checkpatch.  The one rule is more important
than the other rule.

regards,
dan carpenter

