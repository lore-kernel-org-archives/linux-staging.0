Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DA325B2FA
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971883; cv=none; b=jfYU3Ce/TK2iyA6jXoXetD2U2+eYGEgZoIHFZDZ2mLO6F+6eiB0RSbsnUAchUHo/KX61ETPZiTAkyk0TvIfRSyKMqdCGLb2VEy3LSKYZOQdUNKzpN4G5R1lBu26UqxbkZ8F9GG+mvTf5doi452kozRehAVazn7ICtSpaQ1MKhjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971883; c=relaxed/simple;
	bh=9/LqXReNlV95W5678xuTfFv15mPigSgn0EjVuI47LSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFFYQT1xVVHwQhyYNIKjU04NHqF9oKVCkSwYm1C1EAKy3LdJ4edhgMALYb5V9U4s653IyPtsC5MdnkcdRJniE0iLL3Z0q5qb7hkL/0B61ZCeMJPIK9+xXb1LSTL748b20WJ40xinHrhK1K+cZo3eRNR2mrUcRyLlROXB34UlC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hg7pEGW5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hg7pEGW5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so37820745e9.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 00:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971880; x=1764576680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceucUvcluXPiH3tbk9LX3444wQr642ZjfxUzVwjoyBE=;
        b=Hg7pEGW5mdkGD0Vx6LLGFiBGPvmyTdP01sUEs80bGEdfysNu0N6db+zqJeq7e7VAMz
         OCQYGDKCgX/Q2TjkHxGjc9+42StdfyYlrXZQ47c6gKEOpMo/91ZiqPqAOVU2beOzwkQV
         zU12+dhU4FLleNv6iXwf8L85g9mgIOz30V7sa1hgKwnvBi2+Wv4Xd/oqo0B9qHu1PGOt
         2SlYgGut02zc7icMDz3BpCl1jYy8ubx9UmJbLGsImZabWvry/M+yBJFOFpU5XcyAa0HL
         bNKnQcNt+N1LBnspzvAcLCcGk+hpBujltzXCQtSHChI+OMZ7o+ScgebTl9ehKUTMcbpj
         pxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971880; x=1764576680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceucUvcluXPiH3tbk9LX3444wQr642ZjfxUzVwjoyBE=;
        b=vGcGn1t+5tcqsONOD82fnyiUYjjo0YeRTMNavZZXGNI+UT6Jvov6NYRfhyE7V5J2lk
         1k8+gRuc9vJkZFERrTmYS6UnMMvxx7GQsZXAlPuMCULyXowFOAO9xd9dt5OXGbHu0MHg
         HtWEPmv47VpOjqWEbez2nCC1kvcrwXPdNYJjXfu3t7KntubgDelNUFrzZCvPlsyV0kxC
         lAnYCWmycuQitEW+ZXpDiBuunwLPJOScQiZM5cMJvR+ACTIrOeSIRajcU62NuVWxp+zG
         3l5Z4WIK/2wvuZg3PgVTGgYRQ/F9A4G+E6eUAJ6AGyKsyzV2WTOUwNdfHmqoRj28002y
         y3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU8M0c5YbaiiAQ9Th0N6oNzx7j2xPSpts5KwdxUSUBW3Sg7PicK4hu7b5HFYnx1Y8+aOxDjTIXR1AZr8JwK@lists.linux.dev
X-Gm-Message-State: AOJu0YyFMKmPAdwvJLm0bUbNHkI4Audb9lojgv0msd0z6pAw869xn8qY
	6vM+BYEO+ZGuHB4qwAsr35JP2fx6nADbRt/y3f1zxaiNLzJiRekv3E08sbTFw1eFfuo=
X-Gm-Gg: ASbGncs+DKDRjbfkaDSHuBHY6JUHF729y+R/91bdI0Dik32o2McbzNSPRTc5Wp5Fm/8
	sdRNm4fH5gtmeCa8aMiPj5c0DgfHmeuawpHFBznmWJzo2cHcmqW7v9rjBIGBzg+vryTjLsOGsdY
	EOU9ikXQtQRB/i4Y/aJNR85orDEpJ8qGJijZ2csk70b33nkJa+xBc1DA2iJq+3F+YIDDRHNuuYP
	PrrZyzk6P91YPMXCh+7te/L5BHWZENWyaR90nc2JSWeUTYzwv6Wjw7yRfonc/pBrPTtezn4nIve
	rs0riVa/rThs/0qjtoFACluWxEaTMJC9cR5Li9xz5lwa9H4ydXpsulIwfO+y5eYEsB6k+7RrZJ1
	mf2lSLMqyje2/69zXEPVL68IDEpclPGDG7SJU/ZP7o1gVKpyJgIDBE9pkUSXjwKoWsN8J41Cj/C
	lOzBkfnBY1fjyUjFCcSqT6Thkkrq0=
X-Google-Smtp-Source: AGHT+IEGJ3uwtOrUxKMiXPJQOEGm9ePbcq1oMaWMyyFaHBwkZj5DGIECwzi4s0SUQ3084kYW3Zt2cg==
X-Received: by 2002:a05:600c:4ece:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-477c115db0cmr117110365e9.31.1763971879798;
        Mon, 24 Nov 2025 00:11:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba20esm27032200f8f.37.2025.11.24.00.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:11:19 -0800 (PST)
Date: Mon, 24 Nov 2025 11:11:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8723bs: remove dead code from odm.c
Message-ID: <aSQTJAY0WeQjLpMh@stanley.mountain>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
 <20251122174555.215109-5-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122174555.215109-5-knavaneeth786@gmail.com>

On Sat, Nov 22, 2025 at 05:45:54PM +0000, Navaneeth K wrote:
> Remove commented-out code references to RTL8723A and RTL8188E which
> are not supported by this driver. This cleans up the source file and
> improves readability.
> 
> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
> index 4b36af47f680..08ed38b2a563 100644
> --- a/drivers/staging/rtl8723bs/hal/odm.c
> +++ b/drivers/staging/rtl8723bs/hal/odm.c
> @@ -610,10 +610,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
>  	/* NeilChen--2012--08--24-- */
>  	/* Fix Leave LPS issue */
>  	if ((adapter_to_pwrctl(pDM_Odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) /*  in LPS mode */
> -		/*  */
> -		/* (pDM_Odm->SupportICType & (ODM_RTL8723A))|| */
> -		/* (pDM_Odm->SupportICType & (ODM_RTL8188E) &&(&&(((pDM_Odm->SupportInterface  == ODM_ITRF_SDIO))) */
> -		/*  */
>  	) {

When you're breaking things up into One Thing Per Patch, these bits
were part of the condition so it's allowed to move the ") {" to the
earlier line.  It's part of fixing the condition.

regards,
dan carpenter

>  			odm_DIGbyRSSI_LPS(pDM_Odm);
>  	} else
> -- 
> 2.43.0
> 
