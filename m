Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8BF47A889
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108773; cv=none; b=jzqWTY+KIe2nDZMbAV/DiB68FTxU/g0vRebVnLP5RXxAlSMVu6lUD6NCU1SfB7w7Q7Ds261kluxNyHCCZ+1BflpxSWLXSPvnRPPwxJ1Qdv31mvOeKPcG5X8RKO7/tNf1WouJVSXYYv4za8m+bIaCBToZLb0BHm2w4t1tgUshVuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108773; c=relaxed/simple;
	bh=drKag+Yi6J9cG0jE45K4+DzvsO2DUqWU8Uv2K1Ncz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfs4SpBgYDVvd+5bITizKNiRIRmWr1+FRxxWZRNOqqjUTMsdmu8Ci7fEwACb9IFNb0rLCTVXGKsjJq5jXhNjeAKBIDu8uHucfrkSU+i9fqRznfnR4gH4nhcMjN6izpFLmbAd3QFNDtaeemsCz3pxx4x1BMPEuc+sRC+j4dFGcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJVU7RI6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJVU7RI6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49558ce01afso24339325e9.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108764; x=1786713564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXS7YhwOsOt78ycthpj7rPL7k4j0Yf/nXb07Mye1llo=;
        b=iJVU7RI6xsm+13DBfLHDTSXgVh0s/tOGTM/xtgankRuJzvcmwiQkElez/S7rpXo2SU
         XAGMUZtBx4/ZxHzGXeJdONeHFjarskbJ2sYDI+0TZYzS1YTVUIpB1GM03fXMdHMSiH4y
         f0WD+c9XI8Qi+CM3nycDsGNIs7TTZYWFfzT5agfbrptF5vf0u9Odg7UtvJqZ4RMR3Kud
         xYqkSeAUFwWZr9DUuzOZYg5lGmq1iMERpqMfqsIcNP1lw/OIrKHp0CQOt3hBw146uKee
         /65PxWLt3Xroil7eHprygvrj6eBHcnwy04//zZg9EcUPEWA/y3svAh2A3NTPrGVWlun+
         pypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108764; x=1786713564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXS7YhwOsOt78ycthpj7rPL7k4j0Yf/nXb07Mye1llo=;
        b=ZiIxWFAAIM/rC99gkPEIjIuPnaZB7bDiIq/ZWvXTRMWlsjfoih/S1QFyNITi33Kozx
         e7DRBozPGkmVp7vmy+d7l5JkA9vXiaAZdbrZBREI0HPFZZo6Rh/cPC9Oh115s+7ZZkta
         Ck3ctetPJ3nYRRF1FEGiQTfLB4IxQk6n9i6MHdkpDaQSyp77ELUckFlM0ymLFyrVwYeY
         i9F4jsYZ81lNd/Gp9PXdkp710G8+aTk/IH6R5Q6P7AKyoDabkqGEcAEYquEThQfsX+pi
         5Tai/RZm46rXK+r3K3/YvaUYaatPUUbn4UYJtXubukPPZCkseH4FQVwUs5KHbrELPNzN
         Y6yw==
X-Forwarded-Encrypted: i=1; AHgh+RqNoWXyJjbuqIvu9ccSLGMAdZPP2g0cJlaqaaguW0ewLPjLgRP2aLiANUEjNoEgj7j3L3rDMAYPwbXwqG7S@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2+LTTBj3hTdu8d2k5mIukxbM1jbjNCiNkZUjM7sXzy2njtj5Z
	+PC412JH0JTPRWK+H8IIInmqMzWLWh68+Z3X92DE4WMN2VHP7luLH2m2
X-Gm-Gg: AR+sD12GwOjsirSYhemk8uSghCzMv8bBBy31GuQVF3lqoNU6fQTCbwFpYxu1WZZ2MTB
	fTOyvbZ8IPPHA4qxkwvYP6e+jlZIyM8Sq2wirXWOKK0QKuv+b80y+RDfdtQ0zxIGxaw+wzr1Aou
	I0L1yuh4xKcADv0CcNSnTa3b1GS/wxz7pYUtdQljO/zbYWgCWXFTcccp7ux37jjsxZIb8HUYld6
	JbBfDPaSI9VTzgO+KfFZWKFe6TFavhXqyalY38Vjld2wn0cmHFoy7WqHSipGHJXwfNckGFbW7uk
	MkfWqvC+ppHc/Gs1YYGjE187sgMqJjoPL/Bdoo4TaE9EN2QA6UrtagDWIL1ss6ixosDAfV9VkaD
	f1o2z8htDj64KYqi8Umh4MfnUs3rbpkXN4ciGJyy9Mv/dJC6my20HTA1vNUI/kHi8jWcM0rThVJ
	VWjcpIfquKtImy3dEyK8Yw9tmRdFrrdbcSfU8JdntfxOdln/B2kRNyu9z4
X-Received: by 2002:a05:600c:310f:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4994e73cc33mr221333245e9.5.1786108763889;
        Fri, 07 Aug 2026 06:19:23 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm6283482f8f.14.2026.08.07.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:22 -0700 (PDT)
Date: Fri, 7 Aug 2026 16:19:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandros Xanthakis <xanthakis.alexandre@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array pointers
 const;prevent accidental modification of entries.
Message-ID: <anXbV19U41zYXOBS@stanley.mountain>
References: <20260806004325.3253-1-xanthakis.alexandre@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806004325.3253-1-xanthakis.alexandre@gmail.com>

On Thu, Aug 06, 2026 at 03:43:25AM +0300, Alexandros Xanthakis wrote:
> Signed-off-by: Alexandros Xanthakis <xanthakis.alexandre@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e0806c..8f533f3b1b42 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -21,7 +21,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel __ro_after_init;
>  static int g_nomtrr __ro_after_init;
> -static const char *g_fbmode[] = {NULL, NULL};

You're working against a wrong tree because this can't compile.

regards,
dan carpenter

> +static const char * const g_fbmode[] = {NULL, NULL};
>  static const char *g_def_fbmode = "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview __ro_after_init;
> -- 
> 2.55.0
> 
