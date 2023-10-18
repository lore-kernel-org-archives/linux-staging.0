Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166D34CED;
	Wed, 18 Oct 2023 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTBj8QKX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ca6809fb8aso26648165ad.1;
        Wed, 18 Oct 2023 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697657937; x=1698262737; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbWpIm78ki4Fx1nMnnk18t9z2vykmSJma0XrCQOyKmQ=;
        b=eTBj8QKX9rc9YCa8mUkVZjzioXtwx9IjsujP2guyPdT/q1bfgbfGw34pwwPJBym4tV
         PIGvjzsuxy/DRxcKdz11V6e8q1sqM+u6xHaHnPEN87v+n3YxN9Y9XcJKy3DNIVybPIPc
         Eqsbsz8qAxheDb4gc8LzbNSuR+FVcZIJjmb+ERgPk0i80eE/OqqmxBkkyQOCvN+FAqCI
         x7n1wYS3RY3PaTOmSrhYKM6DdH+jTWy1jUxIxBFWd0hGf6PyaKdsZU2jT/VK1/KpSQWn
         dFJ2hukh1s9FDKsmYmp6WCvaYh30UhLTsJykbOoefqdnjsZ6RN+dsQ1uQX+CN17+Mk+a
         K7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697657937; x=1698262737;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbWpIm78ki4Fx1nMnnk18t9z2vykmSJma0XrCQOyKmQ=;
        b=s7ABES1bn4y8BvmgPe5HxEmR77w+FNK9Boidt+OuOFiX0jU7L6qN/N5nqIqi/Gpxbj
         d15lu+R9cb0LOJvG2pe2fgHdYXOy6dupq/LWwqA6ShmqtYw2ZF49f3pAUg+PBdSZSdEb
         JnDAV/u7vsca+MLCV5NO+k2yCLYPcr1Ngy6smD/UjI9CsY5Tlr4oWtFnJ0v0lW+ThP+8
         f9wAG2nMBMGZuH2zGY+6AibZ9fyb3VradX9KgHVTqUTwkhDQRk4U2GxB2M7J+qKOexOh
         HD+qNx1KLtHQTjJLV1gCNuhre65pIjQcpjMi4NBoDLTE12KoDACcP8+lM0J2qHkyIRWE
         Sv+w==
X-Gm-Message-State: AOJu0YzOLm6w9edHh4yyJPzSaw2szrjq7YVFb0eAsji3rf/f9yvdLtk3
	j7Yrp1Z2e0wrJfC/NaFrZjaFg8Vibd4PkQ==
X-Google-Smtp-Source: AGHT+IGgVp5pZFDv7wfoIE5v7AmWPBT6HKlAlspyxnuNXWtvyCdJ3FtLj6kP9CH2Gk3zoAYZAe58Qw==
X-Received: by 2002:a17:903:2305:b0:1c8:9d32:3396 with SMTP id d5-20020a170903230500b001c89d323396mr332383plh.60.1697657937180;
        Wed, 18 Oct 2023 12:38:57 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090282c800b001b896d0eb3dsm311044plz.8.2023.10.18.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 12:38:56 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:38:56 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: vme_user: Replace printk() with
 pr_*(),dev_*()
Message-ID: <20231018193855.GA32553@Negi>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
 <a0579eeda5ce70f69b6bfdcbe534b9d37138096c.1697601942.git.soumya.negi97@gmail.com>
 <2023101823-unhidden-draw-d68c@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101823-unhidden-draw-d68c@gregkh>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi Greg,

On Wed, Oct 18, 2023 at 03:26:07PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 17, 2023 at 09:36:32PM -0700, Soumya Negi wrote:
> > vme.c uses printk() to log messages. To improve and standardize message
> > formatting, use logging mechanisms pr_err()/pr_warn() and
> > dev_err()/dev_warn() instead. Retain the printk log levels of the
> > messages during replacement.
> > 
> > Issue found by checkpatch.pl
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.c | 175 ++++++++++++++++++---------------
> >  1 file changed, 94 insertions(+), 81 deletions(-)
> > 
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > index 6519a7c994a0..e8c2c1e77b7d 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -9,6 +9,8 @@
> >   * Copyright 2004 Motorola Inc.
> >   */
> >  
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> No, this is a driver, as others have pointed out, always use dev_*()
> calls instead.

Some of the pr_ fns can be dev_, but I don't think all can.
e.g. device NULL-check error messages

Also, there are portions of the driver where we have no access to
any 'struct device' to feed into dev_.

> Yes, that means that sometimes you do need to propagate the proper
> device to the function, but that's ok, it's the correct solution here.

Got it. In v2, I'll make pr_*() to dev_*() wherever possible. In most cases, 
the VME bridge device is accessible or if not we can get it using find_bridge().

Thanks,
Soumya
> thanks,
> 
> greg k-h



