Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C992F82
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 04:55:03 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id e2so27807755plh.8
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 21:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZqQhFHRMnmMXoEihqnFM23lMTpYQSELleFFBsJcFYD4=;
        b=Mn0g2d6TBQgvNBBugzJ12Rd8D2+Da73PlHED8xTrQDst2DdIAdoTo5V+zNTbbvcuKa
         h007sxdALGnSpvlCLQfOKVuY0udIEE1eHvoEZhJj6WmwTW4JDUUaqgei01i1qNDtjv+S
         Zt2saGW5VbQL91wYWFfzmYwbUd7JszCGM4H/+gg+Ck27iOWQIhRaNNSXDkvPrghBcgEr
         1sdhlx8oR0ChMKiuUbTm3jxYi/dGcjd1y9TSugQrO67+Oyaz9AeuLFckWLMa8VFA9vzK
         j1aujKebpFlYSmBEjB9uOytL5uuYTVvxMCYIeguy/d3jeRswbDzJ2KNT+QS3ir/rYKSr
         hFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZqQhFHRMnmMXoEihqnFM23lMTpYQSELleFFBsJcFYD4=;
        b=AU9pCALAVsZEAFZlIY3H3EY8gN5zI2moNXAnp75EpEYfSz45Wgi0cNP5+5lHV/9yjC
         Xh0XPOjkZU8r1g/3csn7i+fj0LYzDKdWjlkewvUteaASQmxZWAoX9kRzSyIoj8bnoY3a
         jSXUKnLMGQmVoqqLH8lZRv8+TiIKlj+9CTlSjSdR0nYTEURvtsy+sTKA8rNyxk3AARx0
         kokwtsTqVnw/YTpR4UNEbr69TC5IiZnWHk3G5EvuhDr8JIgzaFWgiGybIaybmwGCOB4j
         fqVmFzqO/Iqu21sb1dqUWUQKKZ0CiEyNgKczbs4msYSegPcU95XKSm8abpwNOYTRl4E9
         a9Jw==
X-Gm-Message-State: AOAM531dShrYVAZBsAUk5QSe2+xkSCyFNDmMpo0/q+Ai8eAtDtpgACYP
	aKwgcG9O/yzs4pe+ChZ8474=
X-Google-Smtp-Source: ABdhPJz8oJFhCYn5LUB6Qaby3t57HY4RYtUP5dfQtRFujwTzA4n2v+vGhY8p9o6GKiOJe1ItGhiPLQ==
X-Received: by 2002:a17:90a:ad84:: with SMTP id s4mr2004969pjq.162.1619585703052;
        Tue, 27 Apr 2021 21:55:03 -0700 (PDT)
Received: from user ([2001:4490:4409:14a:1c7f:16a3:e48a:fdc2])
        by smtp.gmail.com with ESMTPSA id o127sm3973433pfd.147.2021.04.27.21.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 21:55:02 -0700 (PDT)
Date: Wed, 28 Apr 2021 10:24:54 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, saurav.girepunje@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] media: atomisp: pci: remove unneeded variable
 'err'akari.ailus@linux.intel.com,
Message-ID: <20210428045454.GA20682@user>
References: <20210418144323.GA54920@user>
 <20210418150708.GA1402@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418150708.GA1402@agape.jhs>

On Sun, Apr 18, 2021 at 05:07:09PM +0200, Fabio Aiuto wrote:
> On Sun, Apr 18, 2021 at 08:13:23PM +0530, Saurav Girepunje wrote:
> > Fix the following coccicheck warning:
> > 
> > drivers/staging/media/atomisp/pci/sh_css_mipi.c:39:5-8:
> > Unneeded variable: "err". Return "0" on line 44
> > 
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
> > ---
> >  drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > index d5ae7f0b5864..708903a31b08 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -36,12 +36,11 @@ ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
> >  int
> >  ia_css_mipi_frame_specify(const unsigned int size_mem_words,
> >  			  const bool contiguous) {
> > -	int err = 0;
> >  
> >  	my_css.size_mem_words = size_mem_words;
> >  	(void)contiguous;
> >  
> > -	return err;
> > +	return 0;
> >  }
> >  
> >  /*
> > -- 
> > 2.25.1
> > 
> > 
> 
> Hi Saurav,
> 
> this ia_css_mipi_frame_specify seems to be unused. On
> header file, before the prototype it is said that it could
> be removed only when all drivers moved to a new API.
> 
> Is that comment obsolete?
> 
> thank you,
> 
> fabio

yes this ia_css_mipi_frame_specify is unused. On header file 

/* Backward compatible for CSS API 2.0 only
 * TO BE REMOVED when all drivers move to CSS API 2.1.
 */

 deprecated{Use ia_css_mipi_buffer_config instead.}

new api also suggested on comment.

saurav
