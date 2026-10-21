Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556419;
	b=Omm8gqVmjTpvluc+nBaoCcBdKOjnsxoz0SdqE3vaH59JwX/ZShGM36OyaZEGpJj74MLD
	 /vkJZnU/oici0XaI2/a/QLIn//u6W9VTcZwr1OVR3SzUfEjPo2oB/1hHLyP26eUY6ziWY
	 QnjqXQ/DQ+eL3aYAPRuEiN21aMpwAIujpR9AAp8B6Ww5TxTmNehwtaxSrcELQ8AOJ1zix
	 ah4BJv/I1qiH+YP4XJvtTeLjeL7GHGw2agoJN4g48C3hkJNailcPKmAOlPQymuJ/YYxnv
	 lWJI/WB0CosDO1b+ZpX1vfukQJ12Zqmfb9WWIXfk8R3IVHrA0L3ZRVaZigYlkWUphBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=F6nqS7mcyLguqD1PJrlyheTLjJilKtOGHy8lXcshPXw=;
	b=Jl+bP4w0Mj/au3VUh96h77pImCnFSGVE5P+HLc4UqKlOrGSYwygkOxrwEy2wA8UvFc4g
	 snOTVAzNdj+X1gCtiGWeJ9/QvTPTQukJbsDeozdWhImy+J/YaSEg9hR8o1u+vVvtWW58y
	 i0rDRXrAiIXxprSwCGo24ZhVune0DDqSLwwRFwLD3CcKrPBxbmz7icS4kmvtsLwS/9lBS
	 /CKstWIlbfjAKwACC2NWfsR5qRFXDepi6BMQhtNOkTYiRWHffcFMvA/9NovPomf4IJSwS
	 zhQ3Qbh7kFmJk7tgtUA7qDsh/KTrzBGQbS9BRruEEatTRCC5gSzGWr1hsomOVVzzJmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYUMFB4I;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE2606A31B
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 04:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBE2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYUMFB4I
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so358885eec.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 21:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792556417; x=1793161217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6nqS7mcyLguqD1PJrlyheTLjJilKtOGHy8lXcshPXw=;
        b=JYUMFB4ID9zEdHOwXmDIXu69mFaxLBRP9aT7AsgIxvyg2gFKASoovSDIgS8LPAM8HR
         RCxulgC23yAYOvBVT549fL4Z/Snm1h+2MWa0omclb4sbxVxuz/8+fnJZMdq21KicFrpf
         vl1Ydvn5H17V0jzRrM36Z+DTEa1xFEUaCCEq9brrevohwhH6jVohF6G85cW2oATx4cCM
         3dw2VX8dXVGtqVW4jZVjR4pbNnXGwigLgH+r5roZGWM8PjniD71648C/cmxaRTSXzA+7
         aa7cicmpwBXahHhGl7eXvuLCBoxl+CCPG5J6LWO9/UjNyS4jnGnYGzhss2M0jlZaNPGp
         we+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792556417; x=1793161217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6nqS7mcyLguqD1PJrlyheTLjJilKtOGHy8lXcshPXw=;
        b=HGhKLW5eLGV7jCIh4wCPWX2zMfL6GkdOe9hhWpcIqdtMPaNX6rlF9QMRVqgqFf2m+z
         UywaJ6IEYoiIh1IYbm+Tk50hoWtfFWwP3kDO40MbkZ4gdosM3tcpB3nvdPKwfdD2V7rx
         HzaLl21lJxB2BvUy9JVY8tXWtphObIJrPBcmXpDKU6LToq/+FdkRw9YtNOy5LAB06OYJ
         RQ49Nr6jPhHq4+HYKWXR9tpvewc0ZXtLVAodgFdfBdUJnTRGSA9rIPhItJnFbmvQw5E+
         ps17NGIvJBot8NCIJAU+Wx0cr/3plTiRi8SxMTgLhfry6xHYe3Jw6f1brZG8zEKOOqVk
         0MuA==
X-Forwarded-Encrypted: i=1; AKwUvBwVENC51FoIyjELhOSfAltMvTTIdBzZEObVmCFKSKuivqmdtRhbAtvhsdY6iKjOwqOLqRjeEIWEZ0L3ZiD3@lists.linux.dev
X-Gm-Message-State: AFq9FYI2SkCRyHu+eeDMEMd3Q+kgJwzAusNEtoP/54PQ7Bu/kLTL+5xJ
	6eR6uz3zB8UqF0O9/dWrnqHCR+d2HcT5OowtJjT51J1aWsphSzKnhxRU
X-Gm-Gg: AYBFou0zpl982e/+KlQswQJyKj10QcBQVqilxdZ9Xrtm7CR3IyhDFpycmJJVg43/Q+P
	sxpk4+89D/J9YALt7ZR0lCGy0r+sahh9HZR0ad0A6EO8NVgvO9ry5KAdYB4POAg6hJs38dNth2X
	8OYVf8avbgQ2nALpbH+d8/SEKOC5EAvRxKzhqizH2zkWSPrr9x3faVJa7h7Pxb0K3CMJ4Uhdzb9
	9HocNFg6Da4iWjUFZbSXhMv3T0V5LQjKBzC049fylMwNjoQIpCk7Ve1oRAjCbQ/TpeIoEz8luth
	5zmJTIx9MNGfFhlER4AK6r5REKViLQJx9ibhmBmdSAcQ8ep6mL1EReRrJ16c8PEHrmAmvxKAHG9
	JXmhXoD+eCgf5w9sQeuztJZAjvcecX3QTXdUSzOWOZGhl3aldwyN2XOkcZBLE68gzeee8VkNJyy
	qfNVgYOlHbFR3ncbMGcXuAYw3nraqk329IAY43ygCRMLtFvm/n1nwDpKy8OmL86ftf/9KzN78lu
	fg03uDaTmLaEcAG/Mmasyyhf7/P1h5bNtgpe3PVXGIP4UrhQHJxUp/l40H7
X-Received: by 2002:a05:7301:db83:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-3674cb387admr1757579eec.16.1792556417222;
        Tue, 20 Oct 2026 21:20:17 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:2b85:4f59:7505:fbbf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm3682269eec.5.2026.10.20.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:20:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:49:51 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	rmfrfs@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com
Subject: Re: [PATCH v2] staging: greybus: Align function arguments
Message-ID: <atg9Zwie6-Dva-Xb@user>
References: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
 <7e71d57b-f3c7-48b7-bcdf-75254ee87cdd@ieee.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e71d57b-f3c7-48b7-bcdf-75254ee87cdd@ieee.org>

On Tue, Oct 20, 2026 at 09:00:03AM -0500, Alex Elder wrote:
> On 10/17/26 3:44 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Align the function arguments to follow the coding style and
> > improve readability, addressing the alignment warning reported by
> > checkpatch.pl
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> This patch is OK, and it's a good kind of thing to do for
> getting your feet wet with sending out patches for review.

Thank you for reviewing my patch.

> 
> But I encourage you to try to really *read* and understand
> the code, and see if you can find anything you think is wrong,
> or some bit of code or comments that you think could be more
> clear.
> 

I will try to understand the code better and look for ways to
improve it.

> I just scanned through "loopback.c" and one minor change (to
> *code*) you could try is using fsleep() in one place that
> uses other functions to delay.

I will look into this and work on it.

> 
> Another thing you could look for is printf-style format
> specifiers.  I see more than one place where an unsigned
> value uses %d (which, for large values, produce misleading
> results).

I will also check the format specifiers and make sure they
match the variable types.

> 
> These suggestions aren't especially complex, but my hope
> is they lead you further into understanding the code and
> not relying heavily on checkpatch.pl to find things.

I will keep these suggestions in mind when working on future
patches.

Thanks,
Pavan

> 
> Anyway, this change looks fine to me.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> > ---
> > v2:
> >   - Rebased onto staging-next.
> > v1: https://lore.kernel.org/outreachy/C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr/T/#t
> > 
> >   drivers/staging/greybus/loopback.c | 3 ++-
> >   drivers/staging/greybus/spilib.c   | 3 ++-
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index fe48a687377a..efc69c10cffe 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -652,7 +652,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
> >   		}
> >   		if (!gb_operation_response_alloc(operation,
> > -						 len + sizeof(*response), GFP_KERNEL)) {
> > +						 len + sizeof(*response),
> > +						 GFP_KERNEL)) {
> >   			dev_err(dev, "error allocating response\n");
> >   			return -ENOMEM;
> >   		}
> > diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> > index e4d1ae8308aa..c1982f3fb931 100644
> > --- a/drivers/staging/greybus/spilib.c
> > +++ b/drivers/staging/greybus/spilib.c
> > @@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
> >   /* Routines to transfer data */
> >   static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
> > -		struct gb_connection *connection, struct spi_message *msg)
> > +						    struct gb_connection *connection,
> > +						    struct spi_message *msg)
> >   {
> >   	struct gb_spi_transfer_request *request;
> >   	struct spi_device *dev = msg->spi;
> 
