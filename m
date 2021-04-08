Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E43070
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 21:46:10 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id z16so2343848pga.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zdYrRG+l2GoEvS5VtKq2sFMzwk0/c7v4k7SjxU8/nlI=;
        b=pGvoxtmiv0oLqbjD93870KWrjw47K88SjDBibeVYxxIXuawIzHhxFYP1zA278oET1S
         PODbKJTQCZx3gHNcDk/vOIHnsYSuTreJ2iEZHTo7INLdqHp/H+NBM9qOJrRGxACNDnaC
         kw42jgirCc9Npswcxhyr9BAw9H/tK6cGNxHvrsFD36m6I1HSwnTMx2re17qp+6h9c3BA
         ifknR1qtAehdZd9qhLxbuMVmHK6IjfD00k2jMAdkZp5YP/JDiPdTAKFmyyWuq2X0szKJ
         vlWqFVo2ArCOi71EQUDQfIFeop0BXYivPzrK/MPvFykk/i8/mnUCUA6rxKF5lRlX3OYa
         y0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zdYrRG+l2GoEvS5VtKq2sFMzwk0/c7v4k7SjxU8/nlI=;
        b=kTwr+blj4NtqshsP7JhXtqbEfC1ORrcpxR1Ki4GdT9i1TYIgZ+gcqQPgPaV/hcWuXi
         h6rjxzvigcZdcLAuGxHg7c8vA0j+4PfhoTJWeOj35XW6YTXYgWBGmfW+q98TGOhGT18t
         WxYoSIFoe1mbcID22zqdQTdPKqPSZXisq6xTEVr1JAusNYeHv2++H0XU0+ktGXSlDnvb
         KJ+AwgJ43/qUCYNWbatQmjk9+w2nCEZsGM2qNqRYq/WmY7W3U2ylFm+FsaNbJcNEWpg0
         4VQf3deNLADTI32SE1tVV0zVf2xJ9fe/yFVQMb+LTxxGH4Sz4HAHKhY6lK/YpfLqXYiZ
         zzMw==
X-Gm-Message-State: AOAM531lw3P75pKZMDEpAsTTyqbmPk0p1fEWUdNUwfz5dxSSyNrYV15S
	Ca2PhkNEbhpZ8S4tdRiKVW4=
X-Google-Smtp-Source: ABdhPJxsxvaEVHM/nKZAefWElpdkYy/pEMZeN8rPJZDReAXKIQ+J5RCpE0/w6ueGlPBN9u6RXku8xg==
X-Received: by 2002:a62:2b03:0:b029:241:d147:2a79 with SMTP id r3-20020a622b030000b0290241d1472a79mr9301490pfr.53.1617918369651;
        Thu, 08 Apr 2021 14:46:09 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id t24sm290089pgi.30.2021.04.08.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:46:09 -0700 (PDT)
Date: Fri, 9 Apr 2021 03:15:59 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH 2/2] media: zoran: replace bit shifts
 by BIT() macro
Message-ID: <YG95l9b++d+RFrDa@kali>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810@gmail.com>
 <alpine.DEB.2.22.394.2104082314090.21785@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104082314090.21785@hadrien>

On Thu, Apr 08, 2021 at 11:15:07PM +0200, Julia Lawall wrote:
> 
> 
> On Fri, 9 Apr 2021, Mitali Borkar wrote:
> 
> > Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> > This BIT() macro from linux/bitops.h is used to define ZR36057_VFESPFR_* bitmasks.
> > Use of macro is better and neater. It maintains consistency.
> > Reported by checkpatch.
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/zoran/zr36057.h | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> > index a2a75fd9f535..93075459f910 100644
> > --- a/drivers/staging/media/zoran/zr36057.h
> > +++ b/drivers/staging/media/zoran/zr36057.h
> > @@ -8,6 +8,8 @@
> >  #ifndef _ZR36057_H_
> >  #define _ZR36057_H_
> >
> > +#include <linux/bitops.h>
> > +
> >  /* Zoran ZR36057 registers */
> >
> >  #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
> > @@ -31,12 +33,12 @@
> >  #define ZR36057_VFESPFR_VER_DCM          8
> >  #define ZR36057_VFESPFR_DISP_MODE        6
> >  #define ZR36057_VFESPFR_YUV422          (0 << 3)
> > -#define ZR36057_VFESPFR_RGB888          (1 << 3)
> > +#define ZR36057_VFESPFR_RGB888          BIT(3)
> 
> Uniformity is generally considered to be more important than using BIT.
> Having only a few constants defined using BIT is a bit strange.
>
Okay Ma'am. Can you please tell me on how to proceed now? I am not sure
how to proceed.

> julia
> 
> >  #define ZR36057_VFESPFR_RGB565          (2 << 3)
> >  #define ZR36057_VFESPFR_RGB555          (3 << 3)
> > -#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
> > -#define ZR36057_VFESPFR_PACK24          (1 << 1)
> > -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
> > +#define ZR36057_VFESPFR_ERR_DIF          BIT(2)
> > +#define ZR36057_VFESPFR_PACK24          BIT(1)
> > +#define ZR36057_VFESPFR_LITTLE_ENDIAN    BIT(0)
> >
> >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> >
> > --
> > 2.30.2
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810%40gmail.com.
> >
