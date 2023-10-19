Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE82FE0F;
	Thu, 19 Oct 2023 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frpNivDh"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6be0277c05bso75640b3a.0;
        Thu, 19 Oct 2023 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697742380; x=1698347180; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWJpu48XDgOzWODf3Ip57EpXlsaglYJphkrHkfSodW0=;
        b=frpNivDhfDYBd2gSL54Vn1RAHB1K2a2W2aZrdqXbJ6RUPqCm/GrrovC6c+zVPFHVyU
         zXYav+nZokE+8MfGqV7lC1ATfmH65UWaCa/RoVvNv++gEoUjnvVVGyCS+SQFyQZtx7Oq
         uJus6Qpd+hLZVYNRLnmGpAmATSRRsTi5A3m7s6QNApCibNzyB1tgIlf+fYY7F4Lta9tM
         vOOEROKMOU9VrP17Tv3nN+2I00RnbRhNE0kTOI0oHdYPpUwXJPyRjW+jXEFq7lzfVxjf
         tJsALsdoSqEfwprk7+g7g7Zdcco6mqG3o4oPXr6mpK/At6QK4/Lon6TFkNZh6KHLfYwa
         xHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697742380; x=1698347180;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWJpu48XDgOzWODf3Ip57EpXlsaglYJphkrHkfSodW0=;
        b=qRPmwB6uP5dQJ5zGzPhEA4nNG6x8K8bJtoyXfumJQg8Gc8DB1WVNCrarZfdOh+NQEG
         CiE99R8OmLt10kLEtHz0kghHEI9sZalFRU+TSn3oN40yKFk9BjFyuzJmazlFWLJqzqIJ
         R4Wo7Tz+FAKeD3p6YAAhNoFXBDf89MTWFVZZnIkz90I+cBJh5lAKBXY1oXivY3/9jXdo
         JtlYjaI7ZR4XzCn21KGH4p1E31MGd4B59tkFi70zGAJZW60EvALoWIVxU8OackJ48BUu
         YnbJN7lMmrP1E0SsTrPGeP3XMOpGFgHdrT3JOHM4JCM/PknnbiEbUE97DcQ5sZcuJz/A
         bZhQ==
X-Gm-Message-State: AOJu0Yzx4d+7hI60DE0zxScQzJMcgzDutrajS/5V2KJTe79jCWE6N4x8
	gaAn3SSyqz/QuTS+cvcooqk2KB72grc9jg==
X-Google-Smtp-Source: AGHT+IHmT5wyc2UxYytBTeiu8da70APrWxnUEwtgWi0O8N35e6RkncPLic7Sry7GP7BjZMhVR2nX3A==
X-Received: by 2002:a05:6a00:1895:b0:6be:2bfa:6290 with SMTP id x21-20020a056a00189500b006be2bfa6290mr3054593pfh.8.1697742379976;
        Thu, 19 Oct 2023 12:06:19 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id c4-20020a056a00008400b006be22fde07dsm133346pfj.106.2023.10.19.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 12:06:19 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:06:18 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: vme_user: Replace printk() with
 pr_*(),dev_*()
Message-ID: <20231019190618.GA29750@Negi>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
 <a0579eeda5ce70f69b6bfdcbe534b9d37138096c.1697601942.git.soumya.negi97@gmail.com>
 <2023101823-unhidden-draw-d68c@gregkh>
 <20231018193855.GA32553@Negi>
 <2023101925-kudos-playful-7c5a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101925-kudos-playful-7c5a@gregkh>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Oct 19, 2023 at 05:34:01PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 18, 2023 at 12:38:56PM -0700, Soumya Negi wrote:
> > Hi Greg,
> > 
> > On Wed, Oct 18, 2023 at 03:26:07PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Oct 17, 2023 at 09:36:32PM -0700, Soumya Negi wrote:
> > > > vme.c uses printk() to log messages. To improve and standardize message
> > > > formatting, use logging mechanisms pr_err()/pr_warn() and
> > > > dev_err()/dev_warn() instead. Retain the printk log levels of the
> > > > messages during replacement.
> > > > 
> > > > Issue found by checkpatch.pl
> > > > 
> > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > > ---
> > > >  drivers/staging/vme_user/vme.c | 175 ++++++++++++++++++---------------
> > > >  1 file changed, 94 insertions(+), 81 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > > > index 6519a7c994a0..e8c2c1e77b7d 100644
> > > > --- a/drivers/staging/vme_user/vme.c
> > > > +++ b/drivers/staging/vme_user/vme.c
> > > > @@ -9,6 +9,8 @@
> > > >   * Copyright 2004 Motorola Inc.
> > > >   */
> > > >  
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > 
> > > No, this is a driver, as others have pointed out, always use dev_*()
> > > calls instead.
> > 
> > Some of the pr_ fns can be dev_, but I don't think all can.
> > e.g. device NULL-check error messages
> 
> I would argue that those are pointless and can be removed and also the
> check is probably not needed either.

Got it. The pr_() in find_bridge() can't be converted to dev_ so I'll remove 
the message entirely in another patch.

I understand that the device-NULL checks should be done on the caller's side. 
Since empty devices would mean something went wrong, would it be better to
put in an assertion(..WARN_ON) when removing the check? 

> > Also, there are portions of the driver where we have no access to
> > any 'struct device' to feed into dev_.
> 
> Then you can fix that :)

Will do this. 

Regards,
Soumya

> thanks,
> 
> greg k-h
