Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3581C687
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712352128; cv=none; b=jQNvMgYCJh05QRvrs2s+HDzyrl7pj5qAZupuAhZrmwHs+RlbJtgAGjAIlIc0CDXPj++iDQ10ODh4hDcSA7Bfs6G//K4+lbkBjEgP+dkUJ4VUlKWgm2jzM5FnCUarC5M+TOrveDAiSpnSOE7uVJfbPPIu6imwssZd3pNjkslaquQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712352128; c=relaxed/simple;
	bh=Q04UiuMyRXbGVxJakumDS8nr1AiT4+472waBBZEdOo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfA4aOHg7QxuFbgSouRJTT0J6DQuhJtez6I/NhOzIS+7uu5aW2BkVwNl6m6TtHWMOVC3PA7oBg3G15x+KdnKYLRv1W5+wa86Y/guK0M0qkOOqRJFfOWxPnb/IJEWGH+hnYxibKfk+naS3LHHTmuoTlz+3BcZAmHeMMl5rJRR61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aelaU2x5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aelaU2x5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0d8403257so23800395ad.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712352126; x=1712956926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=usb2eToxZqr2+tKAK3YBZ5ATHfFIYXjx4gZa/I7hs4w=;
        b=aelaU2x53rnCNJN1OXrlodcNkl3TckrIEhomU3nqitiXR4djY6j3F5DMmW5NpIOHcX
         gDFng/RaGuUF+SXtnf2f2NnJ22CsMCJYsSv9uAm/5S/V6pyL+sdeA/waltkzj4Bd6fM0
         aeim7NtNlABJxaaxxeXC9Fb8bGHlOIY8K91DkjHncgNR/LZAvXhhzwIk2rQTdjs/+T1D
         wZm9rxaadBRWi8mTDDTcFIMIPftjari6jmlsqfTQNrOZGt3+qgrbdTmfTfD0l8/eJmIv
         Xtrrth5yTiQuQNXBGZ5JRieVenRGVPl9snVzfwLNSI3sKwLlJYNnKeRYU6iJCeOm71or
         rIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712352126; x=1712956926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usb2eToxZqr2+tKAK3YBZ5ATHfFIYXjx4gZa/I7hs4w=;
        b=Z3W9gByOqZ5y8Kswiq4jIjoEBKrNTMWT1K6udb2d9igglQcn9GHtPTE8VTQfcBr5ht
         o6cnp55AF6GjfsJD7dni2zUmjudW3KJS+mfFh/l4+JyeqES6nmpzSsyUx4PNs5oS0cNk
         u7ca9PdEJotINd4i5UHDOk34eoqKFZT+st3Vy5bYC78taezpc6q7Nno6NYN+PXMcNZh4
         kuRB6bIkxg+MtdYGbD0zaK8PqFiXRe8jxBg14ENy1uXwXOxYAd1T8hxuGwy/UwkhCrej
         6aQdP6H62j7CCoWmLg7noRLYqjS3vAZh3uAwS9TVb42FML3f6QieWGTxD4LIryn0SGYy
         AbmA==
X-Forwarded-Encrypted: i=1; AJvYcCV88SvZuAZTkbj+XwM3C2hyJNdI98kEwe+jfStnb/pDFJ5AsDzAb8C2ZLn10WU4dAj2Rv3O0laXKxWoIKlYkWP9IL4pbXZGxeUA4rHR3w==
X-Gm-Message-State: AOJu0YwbY5j4tXMnAhqBq2cfh9UvxdfCcbAwKulC+c1vrM5JJM5wBqGF
	+dePas/8tQdUHTv/Meao9GtfGxD99mK/7g4KbbXJhm0wH8FVK127
X-Google-Smtp-Source: AGHT+IG8uZKBY56GrIfR0tYPyGgVCIFZ6EmnJZmso58ECHQNdnyePLWbLj7ian9poAK/ZbsgkisM0g==
X-Received: by 2002:a17:902:82c7:b0:1e0:2995:c330 with SMTP id u7-20020a17090282c700b001e02995c330mr2413480plz.63.1712352126269;
        Fri, 05 Apr 2024 14:22:06 -0700 (PDT)
Received: from jc-ubuntu-dev-korn-1 (c-98-210-1-68.hsd1.ca.comcast.net. [98.210.1.68])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b001e0ea5c910dsm2075113plg.18.2024.04.05.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 14:22:05 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:22:05 -0700
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Clear up precedence for gcam logging
 macros
Message-ID: <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>

On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
> On 4/3/24 7:16 PM, Jackson Chui wrote:
> > Reported by checkpatch:
> > 
> > CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> > precedence issues
> 
> I agree with your argument about the way the macro should be
> defined.  But perhaps these gcam_*() functions could just
> be eliminated?
> 
> I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
> to gcam_info().  It would be a different patch, but maybe
> you could do that instead?
> 
> 					-Alex
> 
> 
> > 
> > Disambiguates '&' (address-of) operator and '->' operator precedence,
> > accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> > 'struct device*', which is required by the dev_{dbg,info,err} driver
> > model diagnostic macros. Issue found by checkpatch.
> > 
> > Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> > ---
> >   drivers/staging/greybus/camera.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index a8173aa3a995..d82a2d2abdca 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> >   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> > +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> > +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
> >   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >   					  int type, unsigned int flags,
>

Thanks for the feedback, Alex!

I thought about refactoring it, but I feel it is worth keeping
the macro around. It acts as an apdater between callers, who 
have 'gcam' and want to log and what the dynamic debug macros 
expect. Without it, the code gets pretty ugly.

Jackson
