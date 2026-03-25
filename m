Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A58366565
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424182; cv=none; b=kYzO5uBV2X6VpscZUVCP6NchM+2kQJK1WZnFohWzOUWPr26L6fPV0eGCy3fo438bEnNJbwozuDjbzZDV5gqNtGkoW+VPq8G+erhmmBamJrW7Ns9mdiMx3O7Arb/2Q+4wa9dh2hTbd1Bvd5v+UhfzWsbrq51gp1nIS5LyCbFcoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424182; c=relaxed/simple;
	bh=9Qx9fXrwvfFtOiQNsZPuCVh9uGVzjllSDkxpTYUJPqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9H9C2rKFSQLeU131L+MI8yMFGie9LIlGEoZCkfh5IKwR/T+cv2N6YvJAl22oKdk0uuEw3JSbMBmyvEtvwkYJsNPmaHBsNxgX+oW28AYZzTG3/pHRbLuptUTz7Zaa5qztqAe0qOW39KQHyseL972hB27af3L34P1g3/dzLx0VKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WwbA0aFc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WwbA0aFc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso3352180f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774424179; x=1775028979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SX5kqQxDgfMliTGpdl9tH5D0+JbWrgoc3ihk1JizxOw=;
        b=WwbA0aFcncp3I9WlU6odODXX8jKClAmq6xSROGbgKqbZ9Ey+nk7+ATu0fUN+cEg0Pl
         SQbmQlG5qZOLncTmLR8gKSaZ8nZWOCOSkSdqnrCdDTEVdEaP9MiwgeZk1ZTqEs6ZeiHa
         mjj/x+zWQWMIjbUht6lFny/8GWaZvzEzSMXJbTbopUKlz5HqQcgpAAuZRSyHxwJf65Jw
         D/dyrtsh2sOs5rRFeddp08xXxz9yhB35TIs9xesZ4cnAyY4I7CRPOXfXGMPe1a4wnCGE
         a25CdaK8kAuSrdi3ouiV6tZ4jvknSCyzDRkP7J7i1HkM+q8ITnkqY7pkYY5T3AIhSyUu
         EmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424179; x=1775028979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX5kqQxDgfMliTGpdl9tH5D0+JbWrgoc3ihk1JizxOw=;
        b=WOMfN7579XlbKCKCkpSr2H+OnZjaoa30pFybAEM2SzPmbAar+HkgdBfF/cH2FFPRnW
         TlvY1r1DICpBHsp4vuO3qBomu6w/DuzJ52iP9wozBxsxffikwAHOl1MGPLbvL3dRP+qG
         Xl718HBhPBsvCknT2Yaz4ihrywy7kWRcIH0kmdUDkAjRXmVnNLNQKyRzL/KAmXqMPOzr
         2836TQIO4Q1QWVKtAcghIOZbBf/pBBeSGj1ztQPI95kPWHzcuY8SdD54PTUnMJq6TFnm
         0EaB3P4IIIILv17x7WQq4IZt7IoEjcSaDxx0R5jSMKc5TxLhKCGPOqk89HJsqjbO+/vG
         ApRA==
X-Forwarded-Encrypted: i=1; AJvYcCUtoszUq8wPPk9dIwcEBVd7VjPEA+FRXlUYIx14JqEI/z/vl37mXGakHpyyMwVvIK0c6WQGRcxMsDhEVXlp@lists.linux.dev
X-Gm-Message-State: AOJu0YzjHRJQG/H6xHwVTnHt88ITTjAR5Bl1OZlJykiBmaMLdirpfVNx
	mR00to9+DIvpbxlmTxslxiCCwEODSQOVm4g6xp7ra7OB+TF3twXhvqFaRN9LLVuYOfg=
X-Gm-Gg: ATEYQzwGrHRp3GAwF3a+xQUt1J4hNIZwqgcKDHINhFKekApgNElEVT03YqtdKWVEzOn
	wH/VSQuweWKfzYQpKYU5KLt7hj7GRnzRNx0jTrVVZLIxfYDtgtc2dqaD0LV9GfCI1lJp5VxKlbE
	rifnGliwJR8cu/RWyPBXbCZLHcr6gjVVkiUtAVv6k0xnq6lXH61kQXf/rmIimexUs9tL465sDok
	CR5z3RP6KWV7OoTGjiHnQf1ZGqOp64HXIFzdy7kXtGCbOUsuP/dUrjfKOAZr1dTG/VEzUP9SIsW
	rMcOhJrSqC03tLec3v6kHlJPaw5oWd+2eVunjSG+XjyLfzc7AZD0ikIHFvnQQRBVMzcd/Cp9V+C
	VUXp3uXwEsufY7QH3xB1LidzvbLJPlcy1mNKTyy1dh9T62oY4B37ew9ZDjRHCteuZYbIi3z05ug
	A+5Ri3z9Chj+fLr/55OLEnWHzsxXDj
X-Received: by 2002:a05:6000:230f:b0:43b:410d:c4b2 with SMTP id ffacd0b85a97d-43b88a0506bmr3287885f8f.29.1774424179038;
        Wed, 25 Mar 2026 00:36:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm4558831f8f.36.2026.03.25.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:36:18 -0700 (PDT)
Date: Wed, 25 Mar 2026 10:36:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: cleanup return in sdio_init()
Message-ID: <acOQbjNdDwLAGduo@stanley.mountain>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260324220453.47406-3-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324220453.47406-3-omer.e.idrissi@gmail.com>

On Tue, Mar 24, 2026 at 11:04:53PM +0100, Omer El Idrissi wrote:
> Make sdio_init() return errno from sdio_enable_func or
> sdio_set_block_size instead of _SUCCESS/_FAIL vendor-defined
> macros.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---

You're going to need to start labeling your patches as v2 etc.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 358eac0837cf..01b5d8a70072 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
>  release:
>  	sdio_release_host(func);
>  
> -	if (err)
> -		return _FAIL;
> -	return _SUCCESS;
> +	return err;

This patch isn't wrong, per se, but I'd really like for you to update
the callers as well like how you did in the earlier patch.  Right now,
they're still testing for _SUCCESS.

Make sdio_dvobj_init() propagate the error code back instead of -1.

Change rtw_resume_process_normal() to:

	ret = sdio_init();
	if (ret)
		goto whatever_and_return_NULL;

It will make the commit message a little bit more complicated.

    Make sdio_init() propagate standard kernel error codes instead
    of returning _SUCCESS/_FAIL.  There are two callers for this
    function.  sdio_dvobj_init() already returns negative values
    but the caller doesn't check for errors so changing this doesn't
    affect anything.  rtw_resume_process_normal() returns NULL on
    error so leave that as-is.

Sorry, for being a bit nit-picky on this but you might end up potentially
sending a lot of these patches.

regards,
dan carpenter
