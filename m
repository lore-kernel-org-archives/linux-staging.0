Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF175661
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725117299; cv=none; b=umvhe93HfJpkR9u9wWcc+KPFFdEPDVlSuXvcr1TnwKLSSvZ7ZAerZmef4vuAeCmmd2VTPjuVLR2/IvA05rCAvXiGKkkMRi7Or+bZQvpZolx7YZaZgWN5w4ZVkuuz/LJVg98d9s7PGtAQp0m622EBN3kkk85/toirwqJi2j+qikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725117299; c=relaxed/simple;
	bh=saKvXiognHN416c0tT5z+j8zjWYoZxcHW+xZ2aPmimY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKJuEzeqeIeeWKKW8JKBQsBraTg09pm3Mbe7t5HQuJWB5hnnWhj+5W6weYWGVpRyiASDLv0o8V+X7P6VpCVegEnMvPnRnP8UJ6Uw/PFuVftVwJwf7nN7wvfOVb1aLnelC8xYExzEeogJf9Ql7zLN0aDfjvZBQHMBvfYUqfzpjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dslecvrm; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dslecvrm"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5bef295a2b4so4760800a12.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725117295; x=1725722095; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi3kzU3YDe4nX5yvSDNe+Qy0wXh+WxwhX/ktLbD9mng=;
        b=dslecvrmWdlZcbWhmM04zKfLTfwa0CQqj18FhbVvHVSATYwMxMl3KAmS7GmGNicTJM
         9F8enkJZQfd0jAVjPzKmL9T4D5rKfHcpo1k0eIKEGKialaALV/aafCFtjeXFEWo+LXwC
         CqrSN+WKwrV7Rl43C67IxSEFNlt1uI9aT7aZeMsTP+zwJzX3NRDogEcBP50cbxp0M56D
         Q14hlzKGdwUgfNms/ki92yERyZ/ayFUbvSV7glJp2duTtHz6iY9tDU7SbYVP8PdiLZt/
         LW/rV9I45gvKI2WGFRxWkKsuWOc6Qsw0ijyN/Dsrj3PX4OCm6xiwj3OFYe4lPE1oLLDC
         U8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725117295; x=1725722095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi3kzU3YDe4nX5yvSDNe+Qy0wXh+WxwhX/ktLbD9mng=;
        b=WWeaeJxCeeg1WAC5+DpvcS+myxlGxbPanmEpSD/9IbH9DvJ/viiyt+0/eO0mip2OoL
         tm3t+f0rDYzU7t1rLly6pR9clYEAUbe0tW1ARUHu/iR24KFwQK9AHMvoT0SHr6wVX4XP
         9EXp3gRAAH3TfFk7PgbIUYZz5/CdIgCx35npVagDjjK+0ttQBzrLCDuD04l5Z6XEtOdE
         Tg9+V0TpEN8PUZWN+w5klqPpmi4XrJFg1mWK/h30SQao4RbLFO4vHOWEoEiIMqKgHzp0
         Ccj8S0y8PcE+PTTD8ZvIRa9jYOri1NgO88CqsvA/a38HMsstSBPmwmE3pP+d8EMtAvMJ
         pgbA==
X-Forwarded-Encrypted: i=1; AJvYcCWk2HRK4L56YHK0LIbg764cjugZ+9SsoFgL8EB2CorfJJUjmok0rvlfH01jvDnbqzJv4xfaaO9BSynsKF/8@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt9FtkhDBmFpxhQrVZjC7zn7CdUBZ682siitZ4OJAxlnggBEiV
	GGtrJEzxqbaEVG8zxGnad5tzdqBAirTDZ6/iAwZLPOxTZm42TB9zWZXzrNREshrRVXQpTTX2cVW
	p
X-Google-Smtp-Source: AGHT+IE1k1GBPOl6jSTP3xbPCfYXvG3LbzPFeKFTrR4LnNzsitM75p3HhU1SYkyXZEAlrF0d+w7EFw==
X-Received: by 2002:a05:6402:5290:b0:5bf:1974:2ba5 with SMTP id 4fb4d7f45d1cf-5c2201d25ecmr9220208a12.19.1725117295272;
        Sat, 31 Aug 2024 08:14:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c2455908eesm874070a12.55.2024.08.31.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 08:14:54 -0700 (PDT)
Date: Sat, 31 Aug 2024 18:14:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8192e: Rename variable eRFPath
Message-ID: <225c7675-3526-40a3-ae9d-877ff8e4f250@stanley.mountain>
References: <20240831145932.37744-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831145932.37744-1-riyandhiman14@gmail.com>

On Sat, Aug 31, 2024 at 08:29:32PM +0530, Riyan Dhiman wrote:
> Rename variable eRFPath to erf_path to fix checkpatch
> warning.
> 
> Issue reported in checkpatch:
> -CHECK: Avoid CamelCase: <eRFPath>
> 
> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
>  .../staging/rtl8192e/rtl8192e/r8190P_rtl8256.c   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
> index 7061f1cf4d3a..256c19739ad1 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
> @@ -12,7 +12,7 @@
>  void rtl92e_set_bandwidth(struct net_device *dev,
>  			  enum ht_channel_width bandwidth)
>  {
> -	u8	eRFPath;
> +	u8	erf_path;

e stands for enum.  We don't like this kind of name.  Just call it rf_path.

regards,
dan carpenter

