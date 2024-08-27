Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E319D8A4
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751616; cv=none; b=CaLZEekyFB22YFk5IEWkwUd1soHH7o/FBc7Nhz5I+B9HffKVIJ0brjvv6zYPuFEPqGqC/qgY42ySBkjX6QUTxXt51seCLdh+Easfgv/UZmVAvReFU2NEvtiGTvy1GwShB5/LdLV4DzpTblGKqzva+cMgUZiIfPgjnmFa/Ofs3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751616; c=relaxed/simple;
	bh=rrhP1PJhRFNbPZg86UtXjsM1GS5cNc+09BMtm6+FURE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNSQFqWxl6Y9Y5TBMgXXGj5IkEQhP3yhIeuvbwD9t17lCuk3pmQTUiLAWgcFsauQ8f1BLmtuUQM0nwi3bllACdUYIDDCJWHDbDU5F/hZkJHVNeGDeqO9ckgnd20qAaaL+4zPy5i1Z2Inkv77nLXXBaNdGIuk8bWXHLY5GliHHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3xHWmr5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3xHWmr5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a86e9db75b9so57885166b.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724751613; x=1725356413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldndHumggBrbQJSDmdgBSMjYlY2eQp+iUiifjPouSHE=;
        b=l3xHWmr5hjuALzaj+HxwPA6wTZoQk5iYE8DfN5hLGOMAl+vUsnyU7mqVWpEKoJhPKu
         tz5C3nOa2gylVGD2NUY3NSP6uMneTzNncoITelIZF8E5UfljqckRhEKHCEyqY5tGUEia
         gSNKcFBShzff8Iluh0TdW5svK2kTON7ciNcmtsg36v/YK3ZSkqSeRnash1RFTcDtTAMq
         Ip3mcqDCY746E4kjuL+6ZiMR7J4ZtD7PsG6ZlxRA7GY9DzvJRGNxgaaAksWxaRU+CJZ0
         O1Iv9olbQd1A1HdfSLmYUen8n8Q8q+m1XYdhnmiSI3Fr0tiBNuZGu/XIwT2SSRDsdVV0
         VcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724751613; x=1725356413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldndHumggBrbQJSDmdgBSMjYlY2eQp+iUiifjPouSHE=;
        b=UU+JSpwlVswNhdhLtsVcKho1Lvge8u3AKjy4PGYDgricicuYvEslIhrWGME0jn1uYI
         wCNABELU7sbZODyE/FXu9akIFNUvvvROFDcZeRFX/ViSnwsWHTyDOLkiivw5nqzNBqs7
         pG4zA3T5iptXFpKfMFKOprOSElc+2DrNREmJ/KDCY5PSnZ8k68ojvFAryaRL4swuOZfq
         joDpMjMqQGgUDn42e/sgPD+YLCf5Z5bKOq0gwIMaMYE6/D7emO/tdT9gKmonNv2TNi5i
         UV1wu6ogKZahwgNAAY8CJNHxYNd+74TkgdHTgqAzzJ6CRIsr/XYhyFS4WX+8+KWenHHE
         JECA==
X-Forwarded-Encrypted: i=1; AJvYcCVDuHMzcgqff6b6rfnLqnNVVNDIYxJgYQT5/aggbbw/S01akSMHNbkRUTOnLDXaR4aSiJkjrRxbNQQ4OpJ5@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm2AAHR+hBtqk+5JiBSV9OkVWUMLPrt4Z5Tzca9OI78W+6RzOm
	5do3yIP54xfh4g7mDYytEcUm28ecOCauzYP5WuyxxzOFw4cHWaz0TkQ+A1QgGEg=
X-Google-Smtp-Source: AGHT+IG+v1ID4ZFZEz2+wjMGRYJdpV7LXyoi0ftk+VTr/ru0isRlQcH8e4PR+lFzE8yLPyP1L00MNQ==
X-Received: by 2002:a17:907:f786:b0:a86:6e5e:620d with SMTP id a640c23a62f3a-a86a5198ab9mr955145866b.27.1724751612977;
        Tue, 27 Aug 2024 02:40:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549cb8esm87762166b.67.2024.08.27.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:40:12 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:40:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: added bound check to geoid
Message-ID: <473fe1f7-33c5-43ca-94c6-b874a1a60f59@stanley.mountain>
References: <20240827090955.49339-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827090955.49339-1-riyandhiman14@gmail.com>

You need to put v2 (v3 now) into the subject.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

On Tue, Aug 27, 2024 at 02:39:55PM +0530, Riyan Dhiman wrote:
> Added bound check for geoid in probe function because geoid will
> always be positive and less than VME_MAX_SLOT

Add a period to the end of the sentence.

But also add that "The geoid variable is a module parameter which lets people
hard code the slot number."  It's important to mention that it's a module
parameter so people know that it's root only.  Maybe mention that explicitly.
"The geoid variable is a module parameter so it can only be controlled by the
root user.  Only values between 0 and VME_MAX_SLOT make sense.  Invalid values
don't seem to cause a serious issue except for perhaps some weird error codes."

> 
> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c   | 7 +++++++
>  drivers/staging/vme_user/vme_tsi148.c | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 7f84d1c86f29..d8f4ba29da0e 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1059,6 +1059,13 @@ static int __init fake_init(void)
>  	struct vme_slave_resource *slave_image;
>  	struct vme_lm_resource *lm;
>  
> +	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */

This comment is obvoius.  Just leave it out.

regards,
dan carpener

