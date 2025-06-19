Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD415A856
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342944; cv=none; b=g9UYL2ahFye/mPdV/DOBSS9vZraA1NMcU6AiU1Wj6cRBmIX+FQdVIe8ck4HjFAgHORgUHwgZWWcZ5wXd7WltnRU39jP4NYgOWhCcbinznuNR1C/auxu36QT6lYzzgy2MoAsrBpQ5rfdJ/sXkO/+hzC6P0dbVWhsKRRzJOzdG7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342944; c=relaxed/simple;
	bh=1odOdgCePaE7YQFe7cT7R8bcM+k0j7YI88YHcqbu7S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1w2y4j4wDBEebK4U1GISWDUaiCt4skjFSqTQMrr82Ts3bQM+MMr14YCR1v2spiEocpp76tJX1l3zUURZDab0t5IO36Fxjfu8AeC2ITFR4vbPDYQPF8LOvJigKdG915vWGjTyTZzWK50Phr/0HUIvGUnhYNSQVlndb8eoGrvWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiZo8axu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiZo8axu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2352400344aso8534865ad.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750342942; x=1750947742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzx/vk5AUTsaeIAmj6weO5EnX/lq5FtjMMGzRyfVOMI=;
        b=CiZo8axuaK4O1C1mIM+oQ7UPzGG+VFSpprac0P9EwjwCTilgNSgpj8f2a2T8LQxbWG
         119L69PL/u0IFzIIU0504v9FpFh3Gf8r3F9VeI22oSHXIIsBmL2rjwi1XYQJkmugmKTz
         xVhjyHcKNCKKd4FywDwhjPe2uDnDvNyC3TvF4maHb+bleFvXXd25K8Dx0WPtaXs6ou2R
         QLf9qyzJ207RY0QYPRji45QETp1MPGwi7ia4Per2u37RsA6qmx/rCZoR0O4PMgVI8ASM
         tm4R53P6puwKbs5RbANiButnXw0RyRWWEOUJ4HX4hWW2oFgasILbu4jjRcqGsbZmp8VW
         A03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342942; x=1750947742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzx/vk5AUTsaeIAmj6weO5EnX/lq5FtjMMGzRyfVOMI=;
        b=aC5YJjG88PUHkVenFhlBf3eFt1RrCD+1FXkwmEpUvNd1ZE5tsNIFoDx5Ksi+GZsMEQ
         IKW1YEOQ8zhGKBC2+BE4EyT/ucDZkLWsYrgBxmo+3cIeNYWhLaqPNnU4VeUuomWWXYZr
         Jk4igJkE9tNTMlIa8VZ1eMkmdIoZGRsGZ5f4LSSc3pk+0FaoI12PofupmPJaknlH4tJn
         nTgY7xT/AamwZgZ27buKhHcro/192WMZTivHkm/EN5GY6cX7KR0BIg/oZL+jsY08M4J8
         Vlo4y/FWIlvpHjfWZjewEE2vog2Ke+rdp85+QIS/dAOh4ZTI3GgA0fdRjcjQd7+3b9J6
         XXUw==
X-Forwarded-Encrypted: i=1; AJvYcCXWRpX/v9l9DQ5vsFP/DgRRHn3Z1oAU/Zt99H/WoXwBfTJIsgeoqyPr7/VfB/JYZ+bSf+5zo+pY7QmTI0Kv@lists.linux.dev
X-Gm-Message-State: AOJu0YwRcnkvFDEQmjXdu8japxptQRM4OntSORV9Ca12nCUgoQaQFCC4
	5L4OOU2AS8PE/MTg96j4KzxyUJh5f03Tv4Phlsh7UcIo3X5r2ZXN7cl3
X-Gm-Gg: ASbGncuCmB0Xoo4yvVIZwehlBQf8ZQnHYDstD21jbcRUZRyJlXr19zKEUEor+DfLbAl
	a/GYkdUyXpcz0c4S+Azkl/0Ghx0glDGL3Dp/8NaT+7Yl2HG7b3/bIpm2T6ijzYpXh67y4bCsYpy
	sEkaWeLK3uJoYCu33o2v4K2gXD2Rhhk06oBW8Q1nCikaraxCmNWvXW+XXPYiZWiBvgwHDiynbN4
	EugeXA14b5Wndy/oFbi3XLq6A5VjX6EiNIBsV79zWlcMzKH49ec7e/M6bMpmkLiFKdOQURPtIHL
	eLV9nBDquXIKXvgc8FOBdq5RvjYYZILTZEwxGWONSk70hFtPpTQ1PlKTod37OHQYAMMVGXf8
X-Google-Smtp-Source: AGHT+IHxAiL7hf1jJVl22RrIcO1EAkXCMjUFL/8ZXNEEdM6cf4zD/pd8rrtTHN3+4EbISj7/GDjPPQ==
X-Received: by 2002:a17:902:f683:b0:234:c8f6:1b11 with SMTP id d9443c01a7336-2366b144efemr374948105ad.44.1750342942435;
        Thu, 19 Jun 2025 07:22:22 -0700 (PDT)
Received: from rpi4b8g ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca379sm120067605ad.210.2025.06.19.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:22:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:22:17 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kisub Choe <kisub.choe.0x1@gmail.com>, sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: rename 'proc_setBLANK'
Message-ID: <aFQdGZFdtMAgTGpA@rpi4b8g>
References: <20250618141555.5434-1-kisub.choe.0x1@gmail.com>
 <2025061817-jacket-nacho-50d6@gregkh>
 <aFQMrXRzui58krqA@zinc>
 <2025061927-pushpin-scholar-a898@gregkh>
 <aFQVZIXoS43iu0o5@zinc>
 <2025061933-dispersal-employer-0e12@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025061933-dispersal-employer-0e12@gregkh>

On Thu, Jun 19, 2025 at 03:52:53PM +0200, Greg KH wrote:
> On Thu, Jun 19, 2025 at 10:49:24PM +0900, Kisub Choe wrote:
> > On Thu, Jun 19, 2025 at 03:24:26PM +0200, Greg KH wrote:
> > > On Thu, Jun 19, 2025 at 10:12:13PM +0900, Kisub Choe wrote:
> > > > On Wed, Jun 18, 2025 at 04:26:10PM +0200, Greg KH wrote:
> > > > > On Wed, Jun 18, 2025 at 11:15:55PM +0900, Kisub Choe wrote:
> > > > > > Rename 'proc_setBLANK' to 'proc_setBLANK' to
> > > > > 
> > > > > That doesn't rename anything :(
> > > > Rename 'proc_setBLANK' to 'proc_set_blank' to
> > > > > 
> > > > > 
> > > > > 
> > > > > > conform with kernel style guidelines as reported by checkpatch.pl
> > > > > > 
> > > > > > CHECK: Avoid CamelCase: <proc_setBLANK>
> > > > > > 
> > > > > > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/sm750fb/sm750.c | 4 ++--
> > > > > >  drivers/staging/sm750fb/sm750.h | 2 +-
> > > > > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > > > > > index 1d929aca399c..bb2ade6030c2 100644
> > > > > > --- a/drivers/staging/sm750fb/sm750.c
> > > > > > +++ b/drivers/staging/sm750fb/sm750.c
> > > > > > @@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
> > > > > >  	pr_debug("blank = %d.\n", blank);
> > > > > >  	par = info->par;
> > > > > >  	output = &par->output;
> > > > > > -	return output->proc_setBLANK(output, blank);
> > > > > > +	return output->proc_set_blank(output, blank);
> > > > > >  }
> > > > > >  
> > > > > >  static int sm750fb_set_drv(struct lynxfb_par *par)
> > > > > > @@ -605,7 +605,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
> > > > > >  	crtc->ypanstep = 1;
> > > > > >  	crtc->ywrapstep = 0;
> > > > > >  
> > > > > > -	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
> > > > > > +	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
> > > > > >  				 hw_sm750le_set_blank : hw_sm750_set_blank;
> > > > > 
> > > > > Why do we even need this function pointer?  Why not just do the check
> > > > > above when it is called instead of this indirection?
> > > > > 
> > > > > thanks,
> > > > > 
> > > > > greg k-h
> > > > 
> > > > Dear Greg,
> > > > 
> > > > Here is the updated patch with revised commit message. No code changes.
> > > 
> > > Please read the documentation for how to send an updated patch (hint, it
> > > needs to be a new version).
> > > 
> > > Also, see my comments above about what you should do here instead of
> > > just renaming the variable.  Please make that change which will remove
> > > the variable entirely.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Thank you for feedback.
> > 
> > I was wondering if you could share additional feedback regarding
> > pros and cons calling a function directly based on the condition instead of the
> > current implementation?
> 
> I'll leave that as an exercise for the reader to complete :)
> 
> have fun!
> 
> greg k-h

Thank you!
Let me try to make changes and update.

Regards,
Kisub Choe.
