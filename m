Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF070
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 16:50:03 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y16so4609849pfc.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmjR3bywiH9JkVQf06ZFzqn9YgRCejJkL2Con+KKCbI=;
        b=V8ABkSyfJ2sBz25TVDFwf7r0NU1SGiS4xpHo0k1zcRPlACTuYzm5bSux1xoXXB0PT0
         BlDP29UjYU9zC5iCYd2UCUyS24OQGqdkXgu1vXaaU5brVf5v53gMRgaAk/9S2aKr8Bcs
         /yqr7rtt/rsN9zmkcreV8LpTxyJmvmnc+msoyoXolsUjKq9lSGNgtns7eo30uHOWKR4V
         2s5CRA2TDVfLHM3Bo7sdnyzlNPKg0UgZICdMZhQwqA/MepWMB6t3fGLUWtlZtmz0jqR9
         Kq5IlBDVlzemXdAk3quZuHCO86yFmRhBH4kQf/nzagM4ZjbhDSN/p9WUvAgce9ryk0sg
         rGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmjR3bywiH9JkVQf06ZFzqn9YgRCejJkL2Con+KKCbI=;
        b=nxfk/47wyp1RPDjl+W9XBZl3NfW/oQkcPVhRfjNYlkJx3mSCLg+XWXJzkgRMleD7Y6
         AsWPYpFbWfP1jBOOELESsaFVqeO6q6rXAKLRCqC5tve6nmXCZv3CXWktwwGGPIvGrDh2
         rqnZ3i4b+GKWSz4yusLH8LjNoI6m7X06Kat9I54HuqFPohBMEYxKNwp9WA1LMVblBvYM
         4q/IAdc+vcaOOs7Oc239k7FoeA6JGBriLJjV8BqiSSGYqZskKPjROVmfRfdf9EHPrqVU
         96Z5ms4y5EuWM6es7q/cIygm6B34mxkWW1VHXR0f1evZu02Y3L3JfgpLWX4JcGuwfOa1
         Yneg==
X-Gm-Message-State: AOAM533QwayAtPzEJ2LfuYl8+Ff8NsGSURZKywCTDsS8DkhD/WQR3ECk
	RycLunUSDOK2a8s9XPb14Y8=
X-Google-Smtp-Source: ABdhPJz/kGjQCWC42Pk9J5e1J3e2HDye5UhxDnitPlRcxsr2UmlBHVGOW+4tDW35zoLvMSf7qoi0dQ==
X-Received: by 2002:a63:f258:: with SMTP id d24mr13915247pgk.174.1617987003027;
        Fri, 09 Apr 2021 09:50:03 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id z192sm3108490pgz.94.2021.04.09.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:50:02 -0700 (PDT)
Date: Fri, 9 Apr 2021 22:19:52 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/2] media: zoran: add spaces around '<<'
Message-ID: <YHCFsNZVGfjjyHDi@kali>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
 <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl>

On Fri, Apr 09, 2021 at 09:23:22AM +0200, Hans Verkuil wrote:
> Hi Mitali,
> 
> On 08/04/2021 22:38, Mitali Borkar wrote:
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
> >  
> >  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> >  
> > 
> 
> I looked at that header and it is very messy.
> 
> Can you make two new patches? The first aligns every nicely, e.g. this:
> 
> #define ZR36057_VFEHCR          0x000   /* Video Front End, Horizontal Configuration Register */
> #define ZR36057_VFEHCR_HS_POL             BIT(30)
> #define ZR36057_VFEHCR_H_START           10
> #define ZR36057_VFEHCR_H_END            0
> #define ZR36057_VFEHCR_HMASK            0x3ff
> 
> should become:
> 
> /* Video Front End, Horizontal Configuration Register */
> #define ZR36057_VFEHCR			0x000
> #define ZR36057_VFEHCR_HS_POL		BIT(30)
> #define ZR36057_VFEHCR_H_START		10
> #define ZR36057_VFEHCR_H_END		0
> #define ZR36057_VFEHCR_HMASK		0x3ff
> 
> Same for all the other register blocks. Use tabs to do the alignment
> instead of spaces, as is currently the case.
>
> The second patch can replace the (0<<3) etc. to BIT(0).
>
Then I guess only one new patch would be needed for proper alignment, am
i right? I have to rename it as v2 or should send as a completely new
patch?
> That would be a nice cleanup of this rather messy header.
> 
> Thanks!
> 
> 	Hans
