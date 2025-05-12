Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CC1E32D7
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061943; cv=none; b=mEMztjQR78cTZBqJhls8Ccm3LdzzqLy8p90UvAHOoiAusAleQbsIAHgZ9Nz/7OcVRxxnrGrnutmKPgfqSmeDYd7m/gwqQ0K5eItbeBLaS3UuMvVmVFbTVJ1Wy1AOdHeqQ1y9SqDmVB+n8yRsrHcKtGjjABJFDNNdGQzEmOiwqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061943; c=relaxed/simple;
	bh=nX4mrCmrV7a8TXs8dMRqXfhV5Pu7RxOI1NSvV5NmIJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM80CY56Dck3STrFKIE5AcLgmwtuyQCDbaF6GICAQf4TnkPFlXGxF1RJ5c1vF1lBU6jvAlqVdfuw8h1PIMhm9RziQuUdLwUUL5YKeVVmWc/f70LA3WA2fgK39gi9D3SQQeW8tSW3o8F7MzhR81CJRIMIwoecZc8AtI8EQ/dIRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BTp8r5/q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BTp8r5/q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so3704725e9.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747061939; x=1747666739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DtZnGYGPMyogZRHWWFnmILYOBdf7NNPZ8lnkGuF8Wjs=;
        b=BTp8r5/qljsWhcUnx6+59vTytVjpEBmHcgR1SalvvgqrUtW5EteVNgDJr3kilfLPVd
         2M6XuYj7aOsyigS6hvRM8XQtLDpDZF0He3UAOMvQ0m7erChnuiSIkzYmmCHbIGAvV7I1
         qkgsxu6wk/OhuykTQYBEoleErfEoJLlatBYLG7K5wfV0HPPY/tcakwIqtqfdjBeIKAzG
         bIMX/RT3il0glDoKjhSl/dHeCC1L/uM6snIKnhFT2ccKI21M7qWKOvidwPJ2dWRKJn3R
         Gyf/pnstQEfmtqS9FuTixlY2BHe+/LRvaAjkccYJPJnZSGcxpuVOJW+uG129LysJLukU
         pJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061939; x=1747666739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtZnGYGPMyogZRHWWFnmILYOBdf7NNPZ8lnkGuF8Wjs=;
        b=heEmN/J3h9mjbcniR8kl6Q+FRTz5cv+vOxUyCDSTMD5jmVDSVsdZevoUnpQT7NEr0i
         9ZRqWCEKqnLEkxW+y8WQ81V08gg2ayrY9a7M6idDA4lZf4cdhua4OFRy8oquIELWtOoR
         Ba3UCxjkdzo3Ik0NyAd+bgu8oNHJS8qE2NXuVK+bXpQrXWBHC19cO91y/Ac2L/wSZdne
         5aT5b4fW63jE4jV/ZjRQaVXGkR62F2IERYhzdVnMo8Q7SbF8Q3EgBkGrfaDJ+m2kTmJR
         33lA06YdFjmpR5OXjfBa3x5oSVvT5I60hNOPU8fDZZVXIp7LTcLqnlPe12ETKpcij8KX
         4GJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuY2G7tgOZw5ytP/o4/92mfbB6ZG4TyAeQ0YzMoCmHCWAQXJbsYbhV6nTsNlxOKugMWA+rbgr+rXfa0TIu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0uaJo31Pho7VOx/0ILthsbB5NBTFMnt36rzPvJZhco8JYHLlg
	sVtdclEKi01/D3fyaS2hhp8NVQomoQF6HUOIhp+0yna7Uz79i8SBAAOEgXNSSP0=
X-Gm-Gg: ASbGncumPCG3qOZR0PbaIbgo0Gkrsjzv6k2VMkluqdKmvG5ZACIAr4na3u1ed7llAtM
	zVgBbSmq28QHl2GGdewixHF1dslYWJdPF8E9nMSp0IbWDKeGCnRo7eP96uhx9G9XabPmXURneP2
	ie66WwXvwhWQFBryX+TFySojUtWEvcXIBU8KrPXr4CnhVxdzN1QPx/y0mU1q9gcbjQZz988c8FR
	Guu/Sldeb4hK3HaVEyPRtCppnL1U3J5lTHKNoRuOH4G6OeYLjudkiTnmJLvgVGY84Ngz1fTN2Ja
	IQZJepS4yQfRYO9Num4c2Y2JFqg+eJlHus6D9tvddDCgUCahtNgvPo+verFWGG7W/kcmX2W56PK
	UtKGhlw==
X-Google-Smtp-Source: AGHT+IFK2Io9T0LoWMfGqVukVC0DwlRDYE+gJbyTdOM/SShFC3RaE97AQZzfdNXn4Tu00BPTMA461g==
X-Received: by 2002:a05:6000:1882:b0:39c:30c9:822 with SMTP id ffacd0b85a97d-3a1f6488d3dmr10395567f8f.30.1747061939570;
        Mon, 12 May 2025 07:58:59 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec8f1sm12519850f8f.26.2025.05.12.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:58:59 -0700 (PDT)
Date: Mon, 12 May 2025 17:58:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH] Staging: gpib: iblib: iboffline check if board is in use
Message-ID: <9632c958-9c35-4282-9e20-ce84d10a6b20@suswa.mountain>
References: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 07:24:20PM +0200, Thomas Andreatta wrote:
> Ensures that a board cannot be taken offline while it's still in use.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/gpib/common/iblib.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
> index 7a44517464ab..0ab5680457ac 100644
> --- a/drivers/staging/gpib/common/iblib.c
> +++ b/drivers/staging/gpib/common/iblib.c
> @@ -240,7 +240,6 @@ int ibonline(struct gpib_board *board)
>  	return 0;
>  }
>  
> -/* XXX need to make sure board is generally not in use (grab board lock?) */
>  int iboffline(struct gpib_board *board)
>  {
>  	int retval;
> @@ -250,6 +249,15 @@ int iboffline(struct gpib_board *board)
>  	if (!board->interface)
>  		return -ENODEV;
>  
> +	/* Ensure board is not in use */
> +	if (mutex_lock_interruptible(&board->user_mutex))
> +		return -ERESTARTSYS;
> +
> +	if (board->use_count > 0) {

We're not holding this mutex in ibopen() and not necessarily
in ibclose() either so this doesn't work.  It's racy.

You'd have to change the ioctl as well.

regards,
dan carpenter

