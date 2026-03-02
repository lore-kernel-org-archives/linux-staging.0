Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454E38D005
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442590; cv=none; b=FrHYOWRh2W+ONiqWT8tIGok+DNZolr0Wvj1m2KzxavM+rLZWDTo411LUrmLe27lm+DEEcBAds3UQ+uQjGuF0Pd9TSLtjGL+Frm1UQpKfGYDeQmQHxYayLRyARPcwMqmo979W0QRkfceCq6UN7sn0sP/gQ9AuBgUyWAscjXxYdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442590; c=relaxed/simple;
	bh=qjkP/1+k5cq3RnMIRwB1RFWNDwXgn5pOPZDVEw8Wa/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ6kxQfAManZyiUxKdPx4fApzkcRPSZjYC6eME9lgMdtC9IPBmcTEUcD8H1s2qmHMTjTrAUT6ZBpbEWrMTZ0mVhyer4hbZ6tqucKX0pnB9dYnNZVilfDSAvtYkXH3+bVfJMecpJg/uCHsdjTdS6+GSeRl6WNCxXp1YTW9l1kQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdKOxXDF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdKOxXDF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b94a19fdso521838f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 01:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442587; x=1773047387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7hSkAEy5QMDiomw3PMMxDywDx0o6+q0SZ4BtDXuEqI=;
        b=TdKOxXDFS7MjDGylCVrWRa6XUcYNxamiAhoaFcr8U9h9MhHFAuhMINyYSILiGzbCym
         OtCDxHGq9UeqcppBXudNrPOYECyvHaZNEgJ3qO4AiEEZo1cpaT61oPLa+PpY3Jd5wqyh
         zrQDMjxG99ZeT5rCec6gSVRpqJdT2eByS7k9odYk+zHmY7SxdCBDMjzcUThszrohXZdc
         vGoUztt/Yl+yDlBpDjXv0F9IkcLoOaDKV9VOUxCU0gWE5OiwXLDzNHlDovfG1KgxgWKC
         GMluyjw08LNXn8MNncFoYgQM8d2xkZ5LWQW45SqSYeVH3aSQ6YcXTpZOFTciQVN+8YiY
         e/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442587; x=1773047387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7hSkAEy5QMDiomw3PMMxDywDx0o6+q0SZ4BtDXuEqI=;
        b=l9cximA3ZlrhGVSLddOaRw3jp7XbHOuPdRRu3+gARMH7ttCZ3waBCday7I5HBUTMlx
         c8GXt0HxxvyqDJkxUdKLkFnmY0Tt4+uP4mTNWW5VAEx6PyFPJd1OwjS1HJwqLgdMUMQx
         D8hMG3QAQTw8/YVfBoVa4Ds71ON3EOqHfyaWows8Z++U+29U6IwUYKEIZe8xW90ZB+Jn
         u4LSjXYSYGobi+rTsc59UynJG0kiGDgo13VfWV0eXRloH+iu7gZ2xpfTZOBL1CFOSic0
         g2bW75WUIRupXhsYQHYcy256AN7jffRqEbR6E13Ujm8Xt3mwj6Pj6l7VxSdizz2m4spa
         mzMA==
X-Forwarded-Encrypted: i=1; AJvYcCX75CayMcB2l2Tg6jvXRKA0z6nJNorWfArLc+yg0Xp6PcY7gIJ3bF94z0XCBS88bCWnQX0LcJi9eJ5B4aat@lists.linux.dev
X-Gm-Message-State: AOJu0YxUR30pEY7SZZ0aqH1xmS6G8zHFcrhfUZrioVq8ogi3ENTn5I4/
	swHim91k9IkxidaG0w+YmbBwNtxcmJuK3CVUHyQRym2txJcO+A9uIHBScQ18R5iIG3k=
X-Gm-Gg: ATEYQzyBzgJgiWaoUXmjiRSrASGmBgxeCp+vWYDm3TzoVjednrw7+pEaiR3C//D69Z1
	xm+Nv7h++IhQ7MPm5s4kaYC8RkJ1WxytV97uHahtSugdWyjsPjV1JHFJtqkoubMaTxxJ9+2KNmK
	roPgg4DzfK7TrHhZGaHNvXQsq9veOKSu/tgBZ89BT7s/GvMVuY4SvItM74qiAB/2TTm3FVU8Mee
	R/s3x+jZ5RNiy2KGn8HrGMavO/ftO/GuFeK68kO3wysR2WgnPi3AXpCf3GC0oeuWclL6gbStfHu
	7kHy6C+45az9jgsPiY5xBl1w0zm4ckenDSb6tD6uYPlBygPnCiRz/DnWj9vh0zIUntlnHCgkguY
	ZHj1FkT9XfbYUMgID3lxgNwxkHzqRS65pd2mNIePHsoO51PMuzvkJwb7MiL7Ao6rPH+RppcJs+U
	l3ZLVEE8UkLmx0w5aD+VSvPXV/a2LW5faKxNlq9Eo=
X-Received: by 2002:a05:600c:8106:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-483c9bbbdfamr201030975e9.18.1772442587203;
        Mon, 02 Mar 2026 01:09:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfeca99asm123479625e9.31.2026.03.02.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:09:46 -0800 (PST)
Date: Mon, 2 Mar 2026 12:09:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: use proper error codes instead of -1
Message-ID: <aaVT1mSeKrSSlrha@stanley.mountain>
References: <20260301051434.28187-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301051434.28187-1-officialsohamkute@gmail.com>

On Sun, Mar 01, 2026 at 10:44:34AM +0530, Soham Kute wrote:
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index 0ef8d4ff2ef9..d90a93ab8fdc 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -294,7 +294,7 @@ static long sw_i2c_write_byte(unsigned char data)
>  	if (i < 0xff)
>  		return 0;
>  	else
> -		return -1;
> +		return -ETIMEDOUT;

The comment still says this returns -1.

Actually could you do this one function at a time, and in each commit
message please say "The callers propogate the error code back" or "
None of the callers check the error code" or "The callers treat all
non-zero error codes as failure and return -EINVAL" or whatever.


> @@ -264,7 +264,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
>  		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
>  
>  	if (accel->de_wait() != 0)

Did you consider propagating the error code from accel->de_wait()
instead?  That feels like a better solution but I haven't looked at
it at all.

regards,
dan carpenter

