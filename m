Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5F2D1931
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247553; cv=none; b=GfT2coEigDZ2B7XPSD8DA0cDBfNcfwqymbWvp74b4GNdnhT5IdlGxWehwyv7hya2UI/OBhwEOqeYJT6VCJlsV+ZKf+d7+JZeBHekcEOta79QaYbwr8tv/zZoXCH0bPp4SmJpkZ8XzaFdX9mGeLmSvnhVuxLDK4P5pCNs/0TVLTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247553; c=relaxed/simple;
	bh=NDJ0bZGkP12D4112wksethGXWdmzMfeMV4LeDJwvJIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd/FByXqxfZLjribWa8ZeAQDrW7ANg+YwhN/fsHhuUh/KlHTQJ07JVfBWQ9I9t5JH8ZHaiVzTRhWhmoMMA/yUVp0k2vhBox/n566z8xMz8WgOcmEDFJG3wiDsItProcZOWnmTkd3SQufHQVdHxN2Rhk77emG0HWmZk6qQ7mh4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nz09AoJz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nz09AoJz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso61864205e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776247550; x=1776852350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPf/88OR1eh/7G09scCZwblzoYMeBue5GJQTUY482co=;
        b=Nz09AoJz3gXxPafJlwJwwCjRIAN09M78CVzFGtwSaXEk8I4DuK37znLQXblbrg1o8M
         5GaMaXosITXUuH/DebAfIFgmgdWHXSKEb/P74MUcL6xk1v2nQPpatFnIdvT55V8Bnp0D
         h/nzZurdmQ8n072ipwv7ljBXWTkQHqYxeF71xeCAPfqlcLkLFaBow3jA+e8IdzFCp7+t
         rHDcTcjIs6uQeyykH8qoOuLC6iazHV9ktXpZCn26iAVtfCS1XO4FN661ENAKwQm+3x8J
         T0cVGykO8obIId8xBbJvmwc+rB8QiLdsm3+ChQyZ9LPxk1pLo+yraYmr+9dO4A/ndNc3
         aBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247550; x=1776852350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPf/88OR1eh/7G09scCZwblzoYMeBue5GJQTUY482co=;
        b=FCAAqRNd8A8+4tcIgy05dvCDdFluRO1v0Qxg9tMw3OMLOG+lmCjzpXiQTDmosckHlw
         7x3k7Fe3oCmLHHs3C8YGs3QN7hQf8rw0PjX4GudqKBMzFpEhM16/ar6u+9bRgVKdw2Tm
         TH50Qzs0kiRfA4yWfob6ByYIgFm82UUlTIzmLVn/ba5GcgjBIwyI8h+Y5d7yLRp4c+xm
         4997VeDPKIXbAFeJtioysqJtCFuOIW/JFyHPsboOolEoHhH9rD7GQO1wWGsuNmYoJgDz
         FVCJhPN6LlsWVK6Bh7nODwpmLmNes5MfM6Zht/0idqCp86SBoOL9iLplk5F9j/RriLHm
         iu/g==
X-Forwarded-Encrypted: i=1; AFNElJ+mAV6Y3Xi7XOf/ioFd8kGUN/m/FRQGILzMHRddY6KaByBDjzDGVg817ZP9scpDHYUjmwM0toWG4MHXKafZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyvGqdBf/0nR5fHzf1IJvHDx80MbYI0KedVE6JHbzDUjU0nX6BG
	vlA+Je2QkrOBuHqTI2vlIGia9RsnChkgkMW77gUTlkApIibtMs8w5GCy
X-Gm-Gg: AeBDietIwyvAMv4pfeE4MoknIzPB64poFrs3aXKOZDuU8dMycoO65/WtC3P0v8PMo2n
	6ysf9EDM1UIQdkiIzE1y0qnyqyK4mBcxYRk4uyWbWY8QOgm2PWsx192ppPpni9OzSfaZeGAOJVU
	V/r3bR1kzFmliWPKkJux/r7gesf96mhml2lBIkd6lgbrISdYIfxYWDOpUT9DN7CGUXD992Mwink
	IhGZ6iuo3bwLoCQJBm9gGh0ses2ZZghSMRxkBXr7BzYcUbkmA27r99f58vU7UvMACfSGmA/Hlxa
	sp8lK+bBGlk5I/0aHqCzYNaDEv+dAvvvQyGcIUdgrsWv7gvyRUKXjUJBk6GXJjPn9qRj4PoOt2F
	2HpYLqwdj58aPw7xH2Tfje8qPZ74VpypOxClu8ie9MUqnq+PXwNFYz85A5EFZfAE1IGPmPKZsMQ
	4lwhWZJVX0c1DyNXQtWLc=
X-Received: by 2002:a05:600d:1c:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-488d6836d87mr221820675e9.17.1776247549991;
        Wed, 15 Apr 2026 03:05:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f08bdadbsm18978325e9.0.2026.04.15.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 03:05:49 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:05:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu7: cleanup register names and suffixes
Message-ID: <ad9i-XhEZ-m8WKVd@stanley.mountain>
References: <20260415070205.1245502-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415070205.1245502-1-deep@crimson.net.eu.org>

On Wed, Apr 15, 2026 at 09:02:05AM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> Rename BUTTRESS_ registers to include IPU7_ prefix and
> remove unnecessary U suffixes from numeric constants
> for consistency.
> 

The the renames and changing the types from u32 to int should probably
be done in separate patches.

You need to be a bit careful with changing types.  Generally, you should
use unsigned types for bitwise operations.  So the _MASK variables should
be unsigned.

> diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
> index 6ded07ccd780..c5f83023ddbd 100644
> --- a/drivers/staging/media/ipu7/ipu7-mmu.c
> +++ b/drivers/staging/media/ipu7/ipu7-mmu.c
> @@ -33,16 +33,16 @@
>  
>  #define ISP_PAGE_SHIFT		12
>  #define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
> -#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1U))
> +#define IPU7_ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
>  
>  #define ISP_L1PT_SHIFT		22
> -#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
> +#define IPU7_ISP_L1PT_MASK		(~((1 << ISP_L1PT_SHIFT) - 1))
>  
>  #define ISP_L2PT_SHIFT		12
> -#define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
> +#define ISP_L2PT_MASK		(~(IPU7_ISP_L1PT_MASK | (~(IPU7_ISP_PAGE_MASK))))

In the original code this was 0x3ff000 but now, because of sign
extension, it is 0xffffffff003ff000.  Does it make a difference?
I don't know.  But it makes me uncomfortable to see all these changes
thrown together like this where it's so hard to spot.

regards,
dan carpenter

