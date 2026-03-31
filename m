Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547336D4EF
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937596; cv=none; b=YcA2UdCMOosvx0jgrWxHN1H9qmY9KD6X3pQIlvbZTnLz/md9LB03AtwfijRIdpSMl5piIMO5BcLssM967yHUmMgbiEeK1loLODfz8wcrzzB/D1s+LUQNIng03qDKRHl+Ut/k1By7lkjYe4fKJarO0LaxXm2FA/pyxbYLLxF5kcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937596; c=relaxed/simple;
	bh=T0WdtHPLuqZc/WxXl7q0YhY+SFfoltTnPpwveAiFlyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JetLBhiYgxD8MFJOflTDDyb5sf5AHUn35toPmLNzsz0YbkAPgjWGeu9suCdGBAWaNl54VRnwpbLYItTS8yZhp/DkCBaZrV4Mjlt7ZdSnp98NdTLAgjm4QzUuwxioswTtxzFSuRXFEwaCrpRvud3AoD15Cnfnq/276+tuzGbiQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCVVWtFK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCVVWtFK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so52768405e9.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937593; x=1775542393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=et9l0uCLAqqHtQrUf22zmxXsEHhRuZj9xUpTHJrU1EU=;
        b=HCVVWtFKZlXxFzIWpoOS9Wvpfp1WbBTNQ/dt27zO/nUfDILkuPju5RcAri5n0ISx81
         tmZPZhBRQXQrbQe4cmBv6uGnRkLQGSGvMcHDAwC8V7cd4wtp/GPbPgM5KURhUnvyoRvB
         YIAj/93qd8DiksqSIfIBjaJqfwKA/+nDAAg5L60sW8A4gY83cxQUrMCmHqvHESgKj4da
         EO688kx0QdVcZETAHAqJ4UPJEQ9qz9k0IHEmb/sWI7+2glEEwPa/Eoe0oQ5HE7hxW9WO
         zOGFi5i1UJn9AMHpenS0o9TDQMgaP4zrswUHVLy9+qPb72rPtVJ/LoLXBUTXLtVOQgRc
         0Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937593; x=1775542393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=et9l0uCLAqqHtQrUf22zmxXsEHhRuZj9xUpTHJrU1EU=;
        b=ZvIOyJh9+IaHgKrvwN/qHN3LHYtY9ZdMfUKuDtQ/YZ1QPauQwixENsVguAyIjnXVE7
         LtSBVrcVdHvx86c3Szc3b3hhPR4lI6nxxrecOGMm+ttKq4w+BGNU9vJwCNwJFfEJdLb8
         llygy0JfNPZQt3doVGhpKVgoimxxzJYzKuqaG7tug9QniY1YD513K9zlDxetkAyLQ/99
         ajPfbJqlUU6m8RYoPeqp4FJxaeOH0wUPJIoFSXb4vF3gtL36f1n7Rh8sFWZGPOnTnTRH
         DpUVN03jvU8Lcm/eJUX0sffU4V1LkHYvKF7ZC/2PCn+ozQUI3Qb0Tgd8PNxVJg1J9jt0
         q4Dg==
X-Gm-Message-State: AOJu0YzfqJT5MWFB74970YbaoV0UIpDr6x0XSuq20neoR/XVXU2x2aQs
	sFrSaQIXHojZZwC0qTlbc0QXo9a6x7KeHV+tuZs5RR4TQD5RmOvWF8P1
X-Gm-Gg: ATEYQzy5pvfAd/7G36Tz9QGSAy9sA663oThfIYLccUeoOK6rqVCLbw4lMtcGLNOzazy
	pMntiWjGqXozXr6IDwfCb87qPJkt9whwZDetT8RRMk9M1HzHqdI3m2QgsdZkjRiYqdOiXAmQ7Cr
	qyJuty4Y2LeYHKGR9ZMlC5yI4lY5U1nMcOhEqvi0TSFqRES0ntvflKhQT8uipEBddg1n/q45E2q
	Je9FP5p0oubSaWcVz2+VGZcONiVEEM3lr7qkqEAygOA17TJOD4cxlCaL4pk6UFwGTQa17UT6ILh
	KyF6cjfuCbEN6p8898WbswvkZ5NfTb7DL4r0nlwHUnHfQhK4JvkiNB0gdTREFAGPRzIgTvGTieE
	A6RupuQMQLYaZnoqcVf/zMhzfFUgHV5OV/AXJzaRv3bGWvaIJ97ssc+GX5rxhbZ2s3eQJ06gYrY
	N+1vXOZlcC4zCbRptP880XvDtDDTSp2w==
X-Received: by 2002:a05:600c:a101:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48878113373mr28774685e9.0.1774937592823;
        Mon, 30 Mar 2026 23:13:12 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c536a7fsm13426555e9.1.2026.03.30.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:13:12 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:13:10 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <actl0Di5Dnrp-uC6@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
 <acopy6nyxSb16J8N@stanley.mountain>
 <actj-9_YQqEMO58g@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <actj-9_YQqEMO58g@gmail.com>

On Tue, Mar 31, 2026 at 08:07:43AM +0200, Jose A. Perez de Azpillaga wrote:
> On Mon, Mar 30, 2026 at 12:35:30PM +0300, Dan Carpenter wrote:
> > On Sat, Mar 28, 2026 at 08:21:37PM +0100, Jose A. Perez de Azpillaga wrote:
> > > The function configure_isp_from_args() incorrectly dereferences
> > > args->delay_frames[0] to configure cropping without checking if the
> > > pointer is valid. However, as noted in a FIXME comment later in the
> > > same function, delay_frames can be NULL in certain pipeline
> > > configurations.
> >
> > The comment comes later in the function and it says "FIXME:
> > args->delay_frames can be NULL here".  "args->delay_frames" is
> > different from "args->delay_frames[0]".  Obviously
> > args->delay_frames can't actually be NULL there since we
> > dereference it here so the comment is wrong.
> >
> > If the correct response to the FIXME were just to add a NULL
> > check then the original author probably would have done that.
> >
>
> yes, I misunderstood the comment. my bad. I read more carefully.
>

edit: I'll read more carefully.

> ...
>
> regards,
> jose a. p-a
