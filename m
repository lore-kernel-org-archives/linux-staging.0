Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22CB150981
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675485; cv=none; b=C86gwnbl4iU6da+OCMztKBXTS+lA0UG1zj9cwCrN9vJ9c6SDasET8zHS/PQ6PS4eP9SYh2pdRkkq8Jxh7R1lgGXSi4J721DUWcQA+b9iKtaGyTqHPNoV20Nv83lcU8CzDwMCE5sxlK3BE2np3ib6CZ5jLlMcZb7gm6LsLubrr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675485; c=relaxed/simple;
	bh=7VmbSA9BQ5Cg3vBjj2lP8CLaKDj5AmDkYaDy2sgx/+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWfnbl3sDpxr63tosac4qlRby1rW8ncY54zWus/T+9Lxh9YX38FkKUVW+Vw6B6+PRddgKG3tXpVWjcsF6sJahBvNfXGfhNi0nflpBWxAnOcaSYuNcBsV3qxpXQHR3BoWezGaHBcPpxlSGqtj4Kg99HJiYcPxmBKbB2Ox4FIhtbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWEzoMWW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWEzoMWW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8682bb5e79so555619166b.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724675482; x=1725280282; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wejgIUhOad6H+tsVw/4i6tuHGA9fJib/IK/aR/qRKMg=;
        b=SWEzoMWWRyD5fiZWJrcUgp8BUgRyBTMgTiyG3skssDtOmZOoqKeLudrJz+YwqoPLkc
         fiwS6LJfnSE5OldnVIZWKGOJURmbTAhoEH4cAJeNz8TmkDYi7u+yXUgGSTVitMT6HMvI
         fhbfw3GQj787ImleMwvpdlQQ+y3SPxVTZrnqwqu7qjTfSHtWxdhDy2kS8JOi9adLMxAV
         T+Jpjbk3hhkIXqru63bMn0rljPjQAziHj4y175qCaVF5ZZtEfKOIRwjJHE4PBwmXx/qA
         GwA4B1YvuyW3Igc35+3mv5INvXAVCNnRKr0YyP09KY5DILbz7Eh84Z0Gt3q+Jc9/89vd
         5+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724675482; x=1725280282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wejgIUhOad6H+tsVw/4i6tuHGA9fJib/IK/aR/qRKMg=;
        b=mBXT2vb9n8lHacJWXXqs1SCx0BeQb5gF2zytZNP+cFSKrD8WMGxWP0PVx9yqHhK/6E
         5sL192rQAEfMqc3Ha9+iR3ST7VtNI95ApmgrB/c1KqjdUdOwwS9OocTHeKqXEefneowb
         xYB2/c1vpA3Yme/KJG86HXeYLmD899nKtf7AbZbkZ7GZfQXzw12JQM0MV8bCCVCMZppR
         8uXT3duy3jYUsj8QPDd92OTYTsOM7Uwx07fE8U1QqEeLREwIvFeurpAMlX3LxOzR00Bh
         KSyRAfFQTHjNFr1HcGP8/Dhy4mZluCeCiWpscBfMO8AxGMa8xVWeY9giIzl28Hj+M+ZL
         Xihw==
X-Forwarded-Encrypted: i=1; AJvYcCWVOtVmLZwl5sSRpwimD+ctqZBHIH8b3fVikwWsDJffwUmHl5wGkV+W9AePz9NB+qyHsBSkkwvlnaFHixFn@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ5o8EMlkGRTD7mlcjvQTEDU/FI/ISg+om2ROwC02xtBnvBk3V
	NRnmH7L5DObpzAG8Y/VVnnVX+OsbmlQILieQlmOGFfgfiu/QxWxjQnhVTwZarQc=
X-Google-Smtp-Source: AGHT+IGY2X52ALROQjsflCObpv/1qCEB42cXIalRxExLB16O8GieTsfHBeN+ow88Yl9xS3ISqQHk5Q==
X-Received: by 2002:a17:907:e646:b0:a86:89ea:ee6c with SMTP id a640c23a62f3a-a86a52de5d5mr747313066b.30.1724675481798;
        Mon, 26 Aug 2024 05:31:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f5d5asm655984766b.217.2024.08.26.05.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 05:31:21 -0700 (PDT)
Date: Mon, 26 Aug 2024 15:31:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Change slot number type from int to
 u32
Message-ID: <6ba02745-0a55-4f5e-a75a-a7dfbd7070a8@stanley.mountain>
References: <20240825072955.120884-1-riyandhiman14@gmail.com>
 <0289149f-3880-4e20-a22b-8540f212f1b0@stanley.mountain>
 <CAAjz0QaWLcP=VGDd_1DzJiTZe3aX12spr_a4jWfo1pUTeZUtWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjz0QaWLcP=VGDd_1DzJiTZe3aX12spr_a4jWfo1pUTeZUtWQ@mail.gmail.com>

On Mon, Aug 26, 2024 at 05:13:25PM +0530, Riyan Dhiman wrote:
> >
> >
> > Of course, there is a place for unsigned types in C but it's so subtle and
> > complicated to explain.  I think people wish that there was a way to make C
> > safer when there really isn't.  There is no easy answer like just declare
> > everything as u32.  It's a false hope.
> >
> 
> The reason I changed int to u32 is that the slot function was declared this
> way.
> 
> static int tsi148_slot_get(struct vme_bridge *tsi148_bridge)
> {
> u32 slot = 0;
> struct tsi148_driver *bridge;
> 
> bridge = tsi148_bridge->driver_priv;
> 
> if (!geoid) {
> slot = ioread32be(bridge->base + TSI148_LCSR_VSTAT);
> slot = slot & TSI148_LCSR_VSTAT_GA_M;
> } else {
> slot = geoid;
> }
> 
> return (int)slot;
> }
> 
> The slot is taken from the ioread32be function, which returns a u32.
> However, it gets cast to an int on return.
> If the value exceeds the int range, it could result in a strange large
> value. I didn't realize the potential bugs
> this could cause. How should cases like this be handled? Should we include
> an if condition to check if the
> slot is within the int range, something like this?
> 
> if (slot > INT_MAX) {
>     return -ERANGE;
> }
> return (int)slot;
> 
> Also, since slot will always return u32 isn't it better to declare it as
> u32 rather than int?
> 

slot is "slot = slot & TSI148_LCSR_VSTAT_GA_M;" which means it is in the 0-31
range.  The "geoid" variable is a module parameter.  These days we frown on
module parameters, and say it should be configured via sysfs instead.
It doesn't make sense for geiod to be negative or >= VME_MAX_SLOTS.  We should
check that in the probe() function.

I would declare geoid as u32, to communicate that negatives are not allowed.

Remove the cast from tsi148_slot_get() but leave the function as returning int.
No need to over engineer it.  Plus that way it matches the type of
vme_slot_num() which returns negative error codes so int is the correct type.

regards,
dan carpenter


