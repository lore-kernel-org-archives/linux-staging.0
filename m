Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB270CDE
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710431131; cv=none; b=hAAxhQKT+tjdBQK7pSZKULYzVdOk7XBbkBDMr+xWePc0FpBDdU6nmkQ732eNmKYXoCAe7EsopHfoRn9R6qUDzFK4rZ8pNWevZYmKcDewBkiy7zJq1Z1+UC8glPJSOyXBsbN+H8UXZ99Zg7y5hYrmJSAJCjFCiTREBkmvXY46s+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710431131; c=relaxed/simple;
	bh=uGNmFnSNjRtQHVgyo2jCJnF1/KE2DDgOOC1q5BmhLkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=At/rxMOX+gTK7c8k/SSRp5bbmWQ41k9qoQF/m4b0mbsLDxpkwW/5/0LomxmiPOJILsNCBqhOmoGRKriiOH0uGu04W3hT/IX1Wc7yk4AoAMvIV+kVmgZshPr3J0boUKlg2Kh0CFa0amudA1lhqvpbabreQ4tbMh1CgHN+cBLpWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QxxLLErE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxxLLErE"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5139d80f8b6so1421876e87.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710431127; x=1711035927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QVqjo/dkQEsoVjBAUUjahvK+YyDRWKUZUYghRIK8ZSo=;
        b=QxxLLErEcU+GDIBeY1OLwuFvspo8Qeeafs3H1ambdfH0DCArzYnwgTvdW2q/oTudeF
         PrewO/ALsSJRBuuKrVD5C9QsMgnV0NWbfwfc0GlvCEooesihj8TUEZpvjU4PtcD9QK8t
         dsrkU/SrgQDY0eZBctp4+u+8WYA6VIY7x7N1y08YjtwWUUKi4SrnaCRKn15Eb6gEY4QJ
         UQKutp+IibgMqmzN/KjBhJUyf7Dw5YHtUELbnrsWh9hAih0qRAA9d9YjAAWG1sjZxgHe
         9WaTaVf1sbRAXkBV8mx/BibBcPBZs3o5c1+mjSSAbptXhZgKUJsfPAEXDJ7bgb6eJexn
         3Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431127; x=1711035927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVqjo/dkQEsoVjBAUUjahvK+YyDRWKUZUYghRIK8ZSo=;
        b=jxVGCQAF5Qdf3SM/X96Q+Yew8uPNIQKdccL2UaUfGWtz1YIr1lGlGVZ2PD2qLFT012
         zMIsQOgMO7uubm/OqBNd/KR0w3syy8yy0G3BRgzMVtdqSQtu/dq5HH818E+baC2fkIkz
         xL/ChLV7ulPL6FWiMgyh7fWPcPidF1NIw5Ux475MKDKWxN3XnCPD3pMPFJJIcFvAiwV0
         UBm/kx7CNfLYbBid8KiNBIcCGDbQb6WYO5qsjZe0f9ytfs2hQiDQxK7jJpoFCDJkDtw9
         r2rtYfqUgeoFFnP4nvZOT9ur7BALnVTo9tWiPkGvwdSm/iTgzvff7TyhJm0q5EOQBrMw
         Dd/w==
X-Forwarded-Encrypted: i=1; AJvYcCWyWwFYioKX5sRUUGoQj1xtVd6cEKwLAul/4ZN3T6T391l/Nd/dEm/eQIKuPmZEbGKxFMXQp0KFgrIRbsjoT9+xr0kY3/0I0lidWRl7cQ==
X-Gm-Message-State: AOJu0YxAD3DtFdOgre3zFpqnCNUD5pMv/MLrSngkbHviTSnaQvw+7qtz
	UKcwuDHcYfMCITAyZTeAKIgVuPNUK+sSQu45Z5eGcp5kwmKKXmGh1K5qTBXVfuQ=
X-Google-Smtp-Source: AGHT+IGV0t8Qua8LfffQ9kgx1j6nX/KhzFd+3X5NrQXForpU3Ruk2of2K1Vke/gGthOg+x5XSUrqsw==
X-Received: by 2002:a19:ae01:0:b0:513:25c6:e98d with SMTP id f1-20020a19ae01000000b0051325c6e98dmr341212lfc.57.1710431127053;
        Thu, 14 Mar 2024 08:45:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m15-20020a05600c4f4f00b004130c1dc29csm2824204wmq.22.2024.03.14.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:45:26 -0700 (PDT)
Date: Thu, 14 Mar 2024 18:45:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 5/6] staging: vc04_services: Drop global variables
 tracking allocated pages
Message-ID: <72fd5d5b-88c1-47ce-984f-aaa8c35d6f55@moroto.mountain>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
 <20240314100607.336009-6-umang.jain@ideasonboard.com>
 <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk>

On Thu, Mar 14, 2024 at 02:54:34PM +0000, Kieran Bingham wrote:
> Quoting Umang Jain (2024-03-14 10:06:06)
> > The variables tracking allocated pages fragments in vchiq_arm.c
> > can be easily moved to struct vchiq_drvdata instead of being global.
> > This helps us to drop the non-essential global variables in the vchiq
> > interface.
> > 
> > Drop the TODO item as well, as it is now totally addressed:
> > > Get rid of all non essential global structures and create a proper per
> >   device structure
> > 
> > No functional changes intended in this patch.
> > 
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  drivers/staging/vc04_services/interface/TODO  |  8 ---
> >  .../interface/vchiq_arm/vchiq_arm.c           | 53 +++++++++----------
> >  .../interface/vchiq_arm/vchiq_arm.h           |  6 +++
> >  3 files changed, 30 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
> > index 05eb5140d096..15f12b8f213e 100644
> > --- a/drivers/staging/vc04_services/interface/TODO
> > +++ b/drivers/staging/vc04_services/interface/TODO
> > @@ -41,14 +41,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
> >  indentation deep making it very unpleasant to read. This is specially relevant
> >  in the character driver ioctl code and in the core thread functions.
> >  
> > -* Get rid of all non essential global structures and create a proper per
> > -device structure
> > -
> > -The first thing one generally sees in a probe function is a memory allocation
> > -for all the device specific data. This structure is then passed all over the
> > -driver. This is good practice since it makes the driver work regardless of the
> > -number of devices probed.
> > -
> >  * Clean up Sparse warnings from __user annotations. See
> >  vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
> >  is never disclosed to userspace.
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 282f83b335d4..666ab73ce0d1 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -140,12 +140,6 @@ struct vchiq_pagelist_info {
> >  };
> >  
> >  static void __iomem *g_regs;
> 
> What happens with this one ? Is it essential to be global? Can it be
> part of the device? Who's mapping it? or unmapping?
> 
> If we're keeping it global, I'd add a comment...
> 

Ugh...  If we hadn't updated the TODO list then we could have fixed this
in a follow on patch instead of redoing the series...  To be honest, I'd
prefer if it in a separate patch instead of mixed in to patch 5.

regards,
dan carpenter
