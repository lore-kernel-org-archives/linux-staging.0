Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93B3ACA77
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240539; cv=none; b=SpFRZdX4nyXrQGSMKEpVEH6QnfsZvu6kI8rkerBLIz2A+cPdyYTmZV5va6Q17zDxF85tIJUqDUqGF+fkJfxO8FhgmOEGsJaQvje5rr62GBIws6CECvr+YVOuQdaV3tjtXNHbUFDpMSr6y8cuaqT6ZjJhGss6vG9SO/R1Z8k+7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240539; c=relaxed/simple;
	bh=VjTuVrNei2TqAitiUlEfhS/9ihnYTwEg9XLL8Y1VnFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihZRs99+DblJQrRqkbeNN3tnMRP9MNi6T9oIaaW67BoLnRwivX1rcJzCSvvM9Eo5SHUL0ic8dMXZ3dWc707p/NqVJcDQ7hf2I3Qw7flEUrWxyssbSd0Kh8IDH2pEl2ZU3nLZgrN5P9ae5p6XElmT+wmho+4FO3aTEOs072/F8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/Z9lSyx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/Z9lSyx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b78b638eso11620674f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773240537; x=1773845337; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4lgNy5yMCcnmCSkcJzhlt2CENGm8tHrdHSldEAqpwXg=;
        b=B/Z9lSyxhuO6zGp4Qf3xUT2C6ZvB8Wd7rPY5w9X4zKYT/y8DHJbxWK0jmEJjrp6a7R
         sWgCUwXyDLp3IPd/OkpYGgFSibuHZxeRDiI2DIKGX0NA0mkoAFWQCX7Z+0YpNXn0KOMF
         8Gyrvaj/kFAOdaZmzVNsExvbH05gFG2eILWOQp+5p0Q2Vg+suQDL88fXlEntW8RibRuj
         sU0ahd3pYq7o7Z2DYwl7/Hwg/TDK7hfEdxVtpoMw9MIA8fLwBYsgUFdAK6+RZ+AZ4cba
         7sHo+JETD0maRDXOPBuP/X1alswUdrmlp36x3EPyMnMmE7xjqmDe+on3K6vqpfAwRHqB
         ST3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240537; x=1773845337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lgNy5yMCcnmCSkcJzhlt2CENGm8tHrdHSldEAqpwXg=;
        b=CSgF0LNNkiFv/dhdl3zqj78YvPqDvc2SMgWsFyfMzweq0xXfZPcIRaOsDHD96pRzP3
         s4xr4ndw2R9o+9hOHIptFOsJdIV0rbYJ5fUkMgJFhvAvnfO+52abLFJmimvZfj9sfA0k
         yTt0FNAk/N5ywWGk6NmA98Q+9F5dVo9f5vr7ttFwEwAkc29FHUAYFniBC08HqHGpLO7J
         8B9DJchveHxe8oZzmPa9h64vhrqyWdVHd69ly2Sjl8/HR23I8xHnWwbiGuQ9Qr82tqlB
         MNbZU48jIGOrIao5J9swb5l3xQxiQyByHLUHxWAnaPHaYryP5gZNKJ18EnQUO4HptF8X
         mlCg==
X-Forwarded-Encrypted: i=1; AJvYcCWK6xfQ+T613rBhHBjVMIJZunSU0Nw1Pn72JBDwW3Y0KBRMIS3gnkgcbTh6isoqVfYSrTtgyLeCscy0sT1U@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa/gjx0M6Tp7DN1kmVpBruZLvv1n5Rjl49pJQLIgXtsE44jJuw
	bgWrC014PedagXYq1K65/Rq+XJNxzputHC96Jb2R5JPYyYOLWF51Hk2Mfq5snWUzDHY=
X-Gm-Gg: ATEYQzyD4Vc30sMYQOejE2IDWecym/N92MN1zb48X/Z8wQanRR8Nq+k56YYyG+LJGFs
	LkHNk+TDYzhZESMWkkzhMYpr4lKQTZJVvT5VIfpLVShP4dZk5/2KoLMzfbaSMmx9QKUZE29UJvE
	55tvmHwPMhqD0LIuyxRyFS2YhTM6rx/Bq2+xiabw5glNn1cVcvDktnWQNnXFQl2dXAQHBE6SBNd
	JIstX7UOL5oTXWFyt+z/YmnmFmjEdHJMJnfHq/R+dOBVkbQpd2H1pI0T456BtXArC6K72LZGxwj
	ppg8lcJe2SJ/qZhJhTThUnQ7UX5J4+E5p2Pvq+kxX5rEUUJx68kzv5lwUJA5P82vAYy7XI/ql35
	Dam6CRZqwNywhDRnR+J6QTFp+B6lGQHDLpUL0akm3MsOopa+Ahz4Ytwhr0ayybYyVzgUni5ZcBN
	FUwSbNlz1TOcP2LM1jWhGP1JCMw/Na
X-Received: by 2002:a05:6000:288c:b0:439:cf1f:22a7 with SMTP id ffacd0b85a97d-439f81e295amr5406937f8f.6.1773240536680;
        Wed, 11 Mar 2026 07:48:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81a0307sm7214870f8f.11.2026.03.11.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:48:56 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:48:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: replace udelay() with
 usleep_range()
Message-ID: <abGA1WOvzvV8fusw@stanley.mountain>
References: <20260311142407.35403-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311142407.35403-1-mohd.abd.6602@gmail.com>

On Wed, Mar 11, 2026 at 02:24:07PM +0000, Anas Iqbal wrote:
> Replace udelay() with usleep_range() for a 250 microsecond delay
> as recommended by checkpatch.pl. usleep_range() avoids busy
> waiting and allows the scheduler to schedule other tasks.
> 
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
> ---
>  drivers/staging/fbtft/fb_tinylcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> index 9469248f2c50..51e6493b050f 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,10 +38,10 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);

Don't do this.
1) It's unrelated.
2) The previous alignment was done deliberate to make it easier to read.
   Checkpatch is not perfect so don't always do what it says.

>  	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>  	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
> -	udelay(250);
> +	usleep_range(250, 500);

Do a search for init_display on lore

https://lore.kernel.org/all/?q=init_display

regards,
dan carpenter
