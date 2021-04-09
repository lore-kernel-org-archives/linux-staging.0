Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463A6D0D
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 15:11:22 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 7so2900219plb.7
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VwUEOjH92oEmqBKxM4cMkLQe6zVpWnWnVa3MdaDyiVA=;
        b=t+KI1fbe9X4IP5EGG6zIQ2ul1lnbw29irRB7xkpOExmizGzlI7gt9i76FYU48kKvB5
         vrLLN7tEnKskpxcHd9fR2SsZeprUCUD0HuVAlw5G/+s5b+wuDgUATqyk2k0kL/K44rpv
         E9qlT8CtGb40jqKe1Cj/Q1J4UzEHKr8GILTCmMDSLhORZQRR6iSKd6UzvKvOrccrZ0tl
         dyBszdSs6FOCp/8E2kfCbTSAzlFEdlbYV3umSDlTrqf3z8aPoPbh5Eb3JkpW6Mlf5oBi
         mInmwgd5/ZoSRSnVr7dbSQQfBwIkhN1xrrhYcAhAxahVvB7hAsjNtGNg2Zae+Iw1C3mJ
         k4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VwUEOjH92oEmqBKxM4cMkLQe6zVpWnWnVa3MdaDyiVA=;
        b=Wzhx5YTx9tXh9g5L2zgY6mnS4BO/i01kXZc5TbTJMgfPmECL91zjU5qFYOXywcSoDI
         NIsR5vS4juOxN4zqs0WgMokPKJjZXK0X189v/2u/8Mw7ZfNhWGq5hhyWfn5qzWNTbD2M
         Q6HDrSPU3gJ8Uts2f9DquM2qDGMBBcU+BnnHRl2ZRzzOXn2EzY22lXlzOVRW+OklIcAy
         giceo4yqJAOtqGwWwPbyKhP+oK+fdKpAuldqDx6Xj4fCb495utuTW1aIarZXVVLO+i2l
         094GBUbsMQqNmIvO480yuJkxLhX+u3huyApc6bl6TA/Ak4RGPm38Z63ABA4oRi/fZM4o
         ouxA==
X-Gm-Message-State: AOAM531V9fzjwhY8FwtTndsJ2h1/427MUdPkv/cQSg5yS9O6emepxfMw
	Bx5M7CSguweYP/um4K0LEgU=
X-Google-Smtp-Source: ABdhPJyiBMjqGAatQPGIL8TqJ0WjQHXP/gTxrVaDLJ7DwW3aOv5M7+Ak5i/9B5Zhsvvm+UmBaizdgg==
X-Received: by 2002:a17:902:da81:b029:e5:de44:af5b with SMTP id j1-20020a170902da81b02900e5de44af5bmr13397777plx.27.1617981081975;
        Fri, 09 Apr 2021 08:11:21 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id x2sm3371705pgb.89.2021.04.09.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:11:21 -0700 (PDT)
Date: Fri, 9 Apr 2021 20:41:14 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/2] media: zoran: add spaces around '<<'
Message-ID: <YHBukmdxSiRc+K6I@kali>
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
Okay Sir, will do this.

> The second patch can replace the (0<<3) etc. to BIT(0).
>
Sir may I know how to write (2<<3) in BIT() form? Like I am still
learning and not sure how to convert this. Should it be BIT(2)? But this
is only possible for (1<<nr), PLease help me out. 

Thanks.

> That would be a nice cleanup of this rather messy header.
> 
> Thanks!
> 
> 	Hans
