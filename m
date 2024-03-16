Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C62DDD4
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710578517; cv=none; b=qDOhMTwINybVerLzVanvN+lJJ8/JzZyRonuzBrqPAW0StLo2SeTWjj7YrChkkqoMRSZy3t6JhCSRSDy5yBb9+W8SPoa45cFdEeoZRcJxk/8oZS/YfqbF4bGP7J8kNErXEi2b1RKOlS+6tBhUGXzAbQEtddhTqKuUAiYt1f8dkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710578517; c=relaxed/simple;
	bh=cnbWDL727pj291U7y2UhN4v/qnboNO5hL6t3+KHEV94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYv9lBKQrTEhasaTRQE27i83WbdcnFxD2+HT3pX2921BSAp+VeB/veQxDvUqpB3CcRJCrGJ6E8iBHPpcTpkh484QzfLMaE23s4VDhWX/WW0p0UPjpWvWcrD1Z+B2OzqG7P+GMmRF0yyz7c4rpHHfjWkrUUg+B0LN7aWVrrhVxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPnZN/5y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPnZN/5y"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d90dfe73cso1644863f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 01:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710578514; x=1711183314; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alN4PohH+Amm3RsBNRna0WwnwX/Q22QawTPDk+t2XTk=;
        b=nPnZN/5yr6Se/670V0SMshZA79t7EugzKmX9FElGM900DwoE7+71LgDEGac/Qk+mRJ
         /tc4Vm9hUWZwtQGbIZ61QTIc8dKe01emc7d7MYqhZfVhzhyjroe9FTF6xDLGBQw4ZJ5K
         2wRETOheVuxnv/WYGiRZ/VWZVBQIavgw/otAZh3bYTXQAjcadAS5dXxpM9ImanT/UfOW
         /Tqk3TWN+dCIlGS/U7ABn0F0+E/SVmYgNUMl52MbHmfx4KQ1BIoaSmegzJkk9qc8Ri+4
         vQTDuWGWqSLVLzIDN9FC6k5IjYknnu7sZyAKIl5q+ay2t8QXLQssemwYHkOz6xDpXMfC
         stoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710578514; x=1711183314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alN4PohH+Amm3RsBNRna0WwnwX/Q22QawTPDk+t2XTk=;
        b=uQ90/kP6yqqdJ0VbKkqWOBqdn0OhWAbU20yc7h9uLCoP5EfRE9sGYIreQzoSPlPyOz
         vW9CGrkBZf4i/v9MQAUmrfIlChp4VvEW4tBvdqhVtQSa6Pqi1LsEMyF2aVHrz2nXq9e+
         d8Ugzl4XUVaQpZLItPVNtwlq5qGQTdwFHrfRQCJSaTHpWr+D9raytLUvjW9zjUUFpOFa
         LiQpubOhRZkoRKBKbG85rOvrGGXKSw0RSj30E2CGTaKQ3YjUdRyjjPpypRog138a3yc6
         bekQLsnGE9EB6y6v6rP3JnNSjC3Ts/SH4SUwUryfi+GXw3KJBTWk5UhGb7zNoSeG+p2X
         2HAA==
X-Forwarded-Encrypted: i=1; AJvYcCUXkmCSvOyhAy2iJaJI/F7HzcicDM7SLfZCXMw1/sCsvmaPYQ28iAdg2Phiu6WZFhyyJv/FcEG4vxNBqmCV+PFdvIMWlKq4DB2O5NRz1Q==
X-Gm-Message-State: AOJu0Yym37wylkqf89KXOsS+reep/SJjsGEU/3Xcjd2SQkZg3wGG50XL
	ahb3yDuW/qqXBU8j1W67mA6prrdRZo4KgbYDSXHmCTPyB34CvjFE0HJKEBF4Pu4=
X-Google-Smtp-Source: AGHT+IFIx3+FL5ZwPdUPFFtpEmmkR4RVuWQXq/AmlEmlSTJmD0vHaWWdfVw+EHlp/XjgQ0dDYBGvvw==
X-Received: by 2002:adf:f1d1:0:b0:33e:835:668b with SMTP id z17-20020adff1d1000000b0033e0835668bmr7673229wro.22.1710578513837;
        Sat, 16 Mar 2024 01:41:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d5684000000b0033ec6c8e780sm4864777wrv.102.2024.03.16.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 01:41:53 -0700 (PDT)
Date: Sat, 16 Mar 2024 11:41:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 5/6] staging: vc04_services: Drop global variables
 tracking allocated pages
Message-ID: <ea63d6ee-73bf-47de-a19c-6c83bcc0f374@moroto.mountain>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
 <20240314100607.336009-6-umang.jain@ideasonboard.com>
 <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk>
 <996c4012-4274-4bbc-8155-43ae76368f79@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <996c4012-4274-4bbc-8155-43ae76368f79@ideasonboard.com>

On Fri, Mar 15, 2024 at 11:17:15AM +0530, Umang Jain wrote:
> Hi,
> 
> On 14/03/24 8:24 pm, Kieran Bingham wrote:
> > Quoting Umang Jain (2024-03-14 10:06:06)
> > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > index 282f83b335d4..666ab73ce0d1 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > @@ -140,12 +140,6 @@ struct vchiq_pagelist_info {
> > >   };
> > >   static void __iomem *g_regs;
> > What happens with this one ? Is it essential to be global? Can it be
> > part of the device? Who's mapping it? or unmapping?
> > 
> > If we're keeping it global, I'd add a comment...
> 
> The keyword in the series in 'non-essential' and I feel this one is
> essential one.
> 
> It's on the irq request path so encapsulating it in the platform driver data
> and then again trying to get it from there, will make this affect
> performance.
> 
> See remote_event_signal() and vchiq_doorbell_irq()  in vchiq_arm.c
> 

The fast path argument was convincing up to here

> (For testing, a added a dev_info() in the vchiq_doorbell_irq() and it
> brought down the consistent 30fps IMX219 streaming to (15-26)fps
> inconsistent range)
> 

but doing a dev_info() seems way way more expensive than dereferencing
in some pointers in driver data...

Anyway, adding a comment seems like a good idea.

regards,
dan carpenter

