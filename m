Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5F870
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 21:34:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 11so2803444pfn.9
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 14:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y+PxuwGIyeW4oHOMlrWipwVHOGtXMFa2LYI1MnFtX9o=;
        b=WxuXKRi4dHO7pKQVkIYyAvEfHjXzr3pp4HATc7/w4DeUuWLqUdWBZKKgMkw5Vm0pcg
         28HhB7Bf6c7hL5ZAP+l1ZW05K04AihtUvwEL/6n0EpVEvJwz1E3DKK0bpgutRpGmA5BY
         wXlegv2YFKRRbD9Nia67d+OIsxlRxuQGOc6mBhZ5Z13dCcj39XoeDleJYegPNyJs+lnM
         tySi6K/HWk2bTQRGU0zbJ/GY8A460fD0ItohJJuAgWViQ7CCGXIL8WgJxD8lYRMpwiLj
         KaGFUxyiU6lFMr0C7AAxHyK8PaoUSqdiGbjYcnMOIpSj3QpTgWRv6n/rJCpJTL9Ps4Ot
         57yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y+PxuwGIyeW4oHOMlrWipwVHOGtXMFa2LYI1MnFtX9o=;
        b=URxx5FyExLR7kIExae7jl7yRvPIlGiXsV1/XERdIHPcb88QrFT2l1h3vU341pMtJKi
         l3qE7qHfq6SIeBChJjsPa6tVcCQ5FVpQAAORvXo1i8YqsJ1ekjdUmwRuAnuJjKOJjZ0W
         Df8vi2q6vVq+LdmyaTeyvgxQm+nVr0ZfRViE6qgw0+GY4fR85J0N1FtPDLuBsAZ+RpGm
         NCELhnaxzhopiZaxFApNmoUpjHg7nc5Cmq6SsJChQtx3vqsIRyVjXI3Y3IAB09iGF9Bv
         LIl78UrRAd6FIeFSnghu6gsOwNTtgsvnFH0fvYsAiokMSkz9vIOPdY8+NN7uAzooPXzG
         1LRw==
X-Gm-Message-State: AOAM531b4+mc21uiXSK86XBVl/U6/NpKM0H/Pl7ZjqAkT/5v78wGdYXY
	dqddek51V5sVnb/qg2ybzVs=
X-Google-Smtp-Source: ABdhPJwTOn0uwIGyTr2hiRJaUCVTKq9GHe/PDtVbG9trLtvquHldDi6409zVui1dxSvQ8GPr7Xo2zQ==
X-Received: by 2002:a63:c446:: with SMTP id m6mr9586932pgg.71.1617917678281;
        Thu, 08 Apr 2021 14:34:38 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id s2sm305833pjs.49.2021.04.08.14.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:34:37 -0700 (PDT)
Date: Fri, 9 Apr 2021 03:04:27 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH 1/2] media: zoran: add spaces around
 '<<'
Message-ID: <YG9242K4F5xjaOq8@kali>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
 <alpine.DEB.2.22.394.2104082315560.21785@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104082315560.21785@hadrien>

On Thu, Apr 08, 2021 at 11:16:41PM +0200, Julia Lawall wrote:
> 
> 
> On Fri, 9 Apr 2021, Mitali Borkar wrote:
> 
> > Added spaces around '<<' operator to improve readability and meet linux
> > kernel coding style.
> > Reported by checkpatch
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> > index 71b651add35a..a2a75fd9f535 100644
> > --- a/drivers/staging/media/zoran/zr36057.h
> > +++ b/drivers/staging/media/zoran/zr36057.h
> > @@ -30,13 +30,13 @@
> >  #define ZR36057_VFESPFR_HOR_DCM          14
> >  #define ZR36057_VFESPFR_VER_DCM          8
> >  #define ZR36057_VFESPFR_DISP_MODE        6
> > -#define ZR36057_VFESPFR_YUV422          (0<<3)
> > -#define ZR36057_VFESPFR_RGB888          (1<<3)
> > -#define ZR36057_VFESPFR_RGB565          (2<<3)
> > -#define ZR36057_VFESPFR_RGB555          (3<<3)
> > -#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
> > -#define ZR36057_VFESPFR_PACK24          (1<<1)
> > -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
> > +#define ZR36057_VFESPFR_YUV422          (0 << 3)
> > +#define ZR36057_VFESPFR_RGB888          (1 << 3)
> > +#define ZR36057_VFESPFR_RGB565          (2 << 3)
> > +#define ZR36057_VFESPFR_RGB555          (3 << 3)
> > +#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
> > +#define ZR36057_VFESPFR_PACK24          (1 << 1)
> > +#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
> 
> Are these all aligned in the actual file?
>
No Ma'am, they were not aligned in the actual file.

> julia
> 
> >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> >
> > --
> > 2.30.2
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810%40gmail.com.
> >
