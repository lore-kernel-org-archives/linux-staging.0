Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30231FE44A
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271891; cv=none; b=lCftOWwXCZyaBKHl8TfihuWJv4egBTseJHy0haaCuB79KVprXeeZmJMkYfXN8jUw38ViCfpTHS8/q1kIDdEjna2pgYKED/mVdJWdz9Dho2sv1rHKwAnTpY9ElUni9fIbyMUt9SJ+R2ZZ9huSkLO/Pbi8XribOgGX9aFbHnYd1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271891; c=relaxed/simple;
	bh=WTc1bsLGXSiZektMWAXMrNEISq1ztjcmpUgGfApGu5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP0GlmkWRxgDiTjbJR/0ap8zuHtb9sGoxMayykiH5TCyVj4dNIjNNh3/J4Lz73Dlk1IUhqyF4mHKxn3IhILDqFHO58616m4x67MGOuLjbbfUza2IBUeB8gkNcPy4NLv9cRgMUHRy5slTVbIK4eQ+RRhaeDgXyAGsEixlHj2ryVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nvslkVGO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nvslkVGO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso1085485e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774271888; x=1774876688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7/zCsfa6JPvW8FuHtrrROxnJKdhhrcvUQ8XhWVGxEU=;
        b=nvslkVGOfy4dP/9JCCfan9SI+W9J1vEDG2E+WLoWOhEiJ0cQudlCTMZkD4/SKKEdr4
         7Nsejhftns52JM1AX+cW8XRPXec/L1V0Na4i94emdJaPZlhb4To9jKc2sa2V49ZmMjx1
         K6/JtfpkNTZsUdcN9fxGiFJSvV+hgbo5RWr6U9bxY7C+XSAF8zwv7SaC7SkdKF+avDjp
         ZpwkMqZPCeQ9+U7HPd2Yx8IX7iZU4Zg6VTlljdPbJFjCgYFy81w0qKinaPEtjisERvlF
         ai2sM4Ti82PbZaN/UGCpw0/C5ThjebI/vFT/GMhUpbLU/5Duvj2tPmB/wZL2sdO7Qe3n
         Z+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271888; x=1774876688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7/zCsfa6JPvW8FuHtrrROxnJKdhhrcvUQ8XhWVGxEU=;
        b=S7JoWIpAz+0MrcztYYvndzaVNgjiP9pejA9yqdrJmLC/D4xLcZfURXtdCBrnK0DH/A
         ve0YRWwtF0AkG/RsylX3yhuOaDb2n5QyudPEEl1+evg5HUf3gnmfBq3/stU89dkwjJ/n
         vZhLwjEGVay/d7dyjAqc6BfzILWo+5T5zzkimFMBmHYvMHHM1kEtO8aeo4K6kt7rjrNi
         er/MeB0AaXUFoWQzFt4EYLlE337fcNwYV8Svq+7Mk+gVQAVYAb9/74d9291GaHUSb93B
         qeEkwSajwQOqfEfA8fetPwuWQiyp2e5M21jKi1bvkd/LEl1Plf++2uQc/G+UspmHs9iy
         5Z+g==
X-Forwarded-Encrypted: i=1; AJvYcCUdTPh1BMtsFaGvtcsaEIhHVzdaJolnpQSgVlElX69BJa3H3lg/toXCECInln5xHoaXt8Nl8y3JH7Dzgfkm@lists.linux.dev
X-Gm-Message-State: AOJu0YwpoBxrgWMw6/VSznEitEbynSn40O+OHoUpSJwdyWAVdgtgHj2P
	btfd2yK9vZOa4XjVws8YLTP+nCLaBKxkwLhWpqJzQI3cL3X3aWEXn01XHNMhw1+Cr4U=
X-Gm-Gg: ATEYQzzfEOlLDV+d2nOcv1cj88rjrLPvcsdC3GFKHZwU5+qUN7WfMrY3efeaqcku1n0
	nq/PLIMKgGo/t4UywrApJMGCXGHv924pTkcQGEGp/IpUfhHamTskANtQtVkcdp4ImK1VO11bIWq
	GWrthOeUQt5dZ+3mhE6dgC7W7ftWTMkcALh88Ui41/Y/ABD1NSj/Znp3oMMFjdusjSn9WzQ3G/5
	wgxNExIM6UBOx5beOH3zTR3FoNMEctxlfM5JNsO9NC3fhALl+dUo9rNQGTcTN8tsF4Nc9Q/F+sf
	U2i5edixmA1EW4shItzEmrbfydrZTs+LibPbpyWlX+kaz/s8x1gL0p/0YoHsj+O7/5+ZYVZ3mR0
	X1a0hXA6Uyzu/O1NbV5QtEAY+XH3zvNFpo8yhAtPSsL7LqIk2pccjphkIoPotMBE8F74qZMkbDp
	kcSUmYklmxZ9n9S3eVSaDHQk9nDazY
X-Received: by 2002:a05:600c:4ed1:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-486fede7230mr180611445e9.7.1774271888163;
        Mon, 23 Mar 2026 06:18:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm28159777f8f.16.2026.03.23.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:18:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:18:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: ov2722: flush buffered writes before
 they overflow
Message-ID: <acE9jOa5wTvFy3GX@stanley.mountain>
References: <20260323121730.75257-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323121730.75257-1-pengpeng@iscas.ac.cn>

On Mon, Mar 23, 2026 at 08:17:30PM +0800, Pengpeng Hou wrote:
> __ov2722_buf_reg_array() appends 8-bit or 16-bit values to the buffered
> register-write payload and only checks whether it should flush after the
> new value has already been written. When ctrl->index points at the last
> byte of the fixed 30-byte data buffer and the next register is 16-bit,
> the helper writes one byte past the end of the local buffer before the
> flush threshold check runs.
> 
> Check whether the next value fits before writing it. If not, flush the
> current buffered write first and then append the new value.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

The patch is wrong and just adds dead code.

The function is called in a loop.  The buffer has 30 bytes.  We
write either 1 or 2 bytes.  When the index reaches 28 at the end
of the function then we write the buffer and reset the ctrl->index to
zero.  So the new check for if ctrl->index is larger than 28 or 29
at the start of the function will never trigger.

We never actually write to the last two bytes in the array.  So the
original code is off by one in that sense, I suppose?  The >= should
be > as you wrote your code.  Not a huge deal?

This patch has no information about how the bug was identified or how
the patch tested.  If you put a note to say that "This was found
via static analysis" it changes how we review the code.  Or a note to
say that "this has not been tested" then that also is good information
for reviewers.

There is also no Fixes tag.  Adding a Fixes tag helps you figure out
how the bug was introduced or what the original author may have been
thinking.  It's also necessary for the review process and the stable
process.

regards,
dan carpenter
