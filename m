Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6970
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:15:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id z16so5890629pga.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QpIbiNVMq3dfEaOyd8G4kAX24XpczwvMO/4p2DUsJGY=;
        b=j5oe0oBYhswpHxcSJXW5VzanH/hlbrFgOSQFj7x4NwFjaArxExk4JRqc1IiwwSAOCm
         OvGeZ+GjRj1gQf1fBAu9ZJ/x9Lo18MiaFgMr7C4QCBvfCsoN7Q3/6lw9EW8Tx3Ug7e/4
         PttK34x1kjWMSVYNsTN0r49dkoq/up093CgPK+ITbyEZmBDbO+MeVcNCJkRaXFDdjsah
         ++FSKZZtwl/eR8J+CSrm0cMLIzF7V7jOjtVYrYnj62mvtsaKd+noUpg0bQoJXScRo8E+
         UWBufccQUobuAbN/TSwwbP075CYe7H35TYzSRYQucWEwmoHs4BhPolmKZP6sRrx4y4DA
         xHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QpIbiNVMq3dfEaOyd8G4kAX24XpczwvMO/4p2DUsJGY=;
        b=FEVSeASCwjBFtc8uU87u7PLLMmzUhnFLeQTudZmkt7s2R74XTrTZaxm0w0Rabj+x+z
         arWBeqrhFOH72uaOapX6iSkauklBXlzRWmJz60SKp6V4y7DtNFuZqEObjgSyCe3qZ8UH
         3J/JoDiCEpnICjhh7SmRX3drfJKGZTC7PgWLu/rOqYQl59HZ307j/Ny5ClDl2zc1g3vx
         +q8hpJ9lOqDh9TZwOB/1iFYzbnGvdLbGHG3ZU0lwHW8m61s4Eha7RkK3XIqdGCcuJAjb
         2+hwCM6eTRVDOlnzDbIsSKunKR4dMe5ptAy5wOsDcMkmR0+nvgIjtYBD9BlF3hdqyi8J
         V2rg==
X-Gm-Message-State: AOAM530lLSqde4CYTAwY/IZt8vAT6+sJHCDjIEFhffgx8P24tFGJiXxJ
	5p0jkzsin1WWC4qb7KwruhQ=
X-Google-Smtp-Source: ABdhPJzOIk1qqd10FhrdJhCDIEdX8cqWHlnHm4ft/ES0JFG4Nes1pPfEVeI4KkMhJEVib0IG8y5K+Q==
X-Received: by 2002:aa7:91d1:0:b029:1fe:2a02:73b9 with SMTP id z17-20020aa791d10000b02901fe2a0273b9mr16582510pfa.2.1618060510358;
        Sat, 10 Apr 2021 06:15:10 -0700 (PDT)
Received: from kali ([106.195.15.71])
        by smtp.gmail.com with ESMTPSA id r11sm4915188pjp.46.2021.04.10.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 06:15:10 -0700 (PDT)
Date: Sat, 10 Apr 2021 18:44:45 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v2 2/2] staging: media: zoran: remove
 and add comments; align code
Message-ID: <YHGkxRJ8S22/ZqDZ@kali>
References: <YHCgnP6Jr6TbjwUy@kali>
 <alpine.DEB.2.22.394.2104092209200.23056@hadrien>
 <YHDR7VxighihfZd5@kali>
 <alpine.DEB.2.22.394.2104101354180.2975@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104101354180.2975@hadrien>

On Sat, Apr 10, 2021 at 01:56:24PM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 10 Apr 2021, Mitali Borkar wrote:
> 
> > On Fri, Apr 09, 2021 at 10:12:12PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Sat, 10 Apr 2021, Mitali Borkar wrote:
> > >
> > > > Removed comments from the same line and added them to new line above the
> > > > blocks, aligned everything properly by using tabs to make code neater
> > > > and improve readability.
> > > >
> > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > ---
> > > >  drivers/staging/media/zoran/zr36057.h | 293 ++++++++++++++------------
> > > >  1 file changed, 162 insertions(+), 131 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> > > > index 93075459f910..198d344a8879 100644
> > > > --- a/drivers/staging/media/zoran/zr36057.h
> > > > +++ b/drivers/staging/media/zoran/zr36057.h
> > > > @@ -12,145 +12,176 @@
> > > >
> > > >  /* Zoran ZR36057 registers */
> > > >
> > > > -#define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
> > > > -#define ZR36057_VFEHCR_HS_POL             BIT(30)
> > > > -#define ZR36057_VFEHCR_H_START           10
> > > > +/* Video Front End, Horizontal Configuration Register */
> > > > +#define ZR36057_VFEHCR			0x000
> > > > +#define ZR36057_VFEHCR_HS_POL			BIT(30)
> > >
> > > It looks like the alignment didn't work out here?  Check that the use of
> > > tabs is the same as on the nearby lines.
> > >
> > Do I need to align BIT(30), 10, 0x000 and rest in same column or should I
> > align them separately?
> 
> If there are a bunch of #defines with no blank line between them and
> similar names (these all start with ZR36057_VFEHCR), then it can be nice
> to line them all up.
> 
> >
> > > > +#define ZR36057_VFEHCR_H_START		10
> > > >  #define ZR36057_VFEHCR_H_END		0
> > > >  #define ZR36057_VFEHCR_HMASK		0x3ff
> > > >
> > > > -#define ZR36057_VFEVCR          0x004	/* Video Front End, Vertical Configuration Register */
> > > > -#define ZR36057_VFEVCR_VS_POL             BIT(30)
> > > > -#define ZR36057_VFEVCR_V_START           10
> > > > +/* Video Front End, Vertical Configuration Register */
> > > > +#define ZR36057_VFEVCR			0x004
> > > > +#define ZR36057_VFEVCR_VS_POL			BIT(30)
> > > > +#define ZR36057_VFEVCR_V_START		10
> > > >  #define ZR36057_VFEVCR_V_END		0
> > > >  #define ZR36057_VFEVCR_VMASK		0x3ff
> > > >
> > > > -#define ZR36057_VFESPFR         0x008	/* Video Front End, Scaler and Pixel Format Register */
> > > > -#define ZR36057_VFESPFR_EXT_FL            BIT(26)
> > > > -#define ZR36057_VFESPFR_TOP_FIELD         BIT(25)
> > > > -#define ZR36057_VFESPFR_VCLK_POL          BIT(24)
> > > > -#define ZR36057_VFESPFR_H_FILTER         21
> > > > -#define ZR36057_VFESPFR_HOR_DCM          14
> > > > -#define ZR36057_VFESPFR_VER_DCM          8
> > > > -#define ZR36057_VFESPFR_DISP_MODE        6
> > > > -#define ZR36057_VFESPFR_YUV422          (0 << 3)
> > > > -#define ZR36057_VFESPFR_RGB888          BIT(3)
> > > > -#define ZR36057_VFESPFR_RGB565          (2 << 3)
> > > > -#define ZR36057_VFESPFR_RGB555          (3 << 3)
> > > > -#define ZR36057_VFESPFR_ERR_DIF          BIT(2)
> > > > -#define ZR36057_VFESPFR_PACK24          BIT(1)
> > > > -#define ZR36057_VFESPFR_LITTLE_ENDIAN    BIT(0)
> > > > -
> > > > -#define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> > > > -
> > > > -#define ZR36057_VDBR            0x010	/* Video Display "Bottom" Register */
> > > > -
> > > > -#define ZR36057_VSSFGR          0x014	/* Video Stride, Status, and Frame Grab Register */
> > > > -#define ZR36057_VSSFGR_DISP_STRIDE       16
> > > > -#define ZR36057_VSSFGR_VID_OVF            BIT(8)
> > > > -#define ZR36057_VSSFGR_SNAP_SHOT          BIT(1)
> > > > -#define ZR36057_VSSFGR_FRAME_GRAB         BIT(0)
> > > > -
> > > > -#define ZR36057_VDCR            0x018	/* Video Display Configuration Register */
> > > > -#define ZR36057_VDCR_VID_EN               BIT(31)
> > > > -#define ZR36057_VDCR_MIN_PIX             24
> > > > -#define ZR36057_VDCR_TRITON              BIT(24)
> > > > -#define ZR36057_VDCR_VID_WIN_HT           12
> > > > -#define ZR36057_VDCR_VID_WIN_WID          0
> > > > -
> > > > -#define ZR36057_MMTR            0x01c	/* Masking Map "Top" Register */
> > > > -
> > > > -#define ZR36057_MMBR            0x020	/* Masking Map "Bottom" Register */
> > > > -
> > > > -#define ZR36057_OCR             0x024	/* Overlay Control Register */
> > > > -#define ZR36057_OCR_OVL_ENABLE            BIT(15)
> > > > -#define ZR36057_OCR_MASK_STRIDE          0
> > > > -
> > > > -#define ZR36057_SPGPPCR         0x028	/* System, PCI, and General Purpose Pins Control Register */
> > > > -#define ZR36057_SPGPPCR_SOFT_RESET	 BIT(24)
> > > > -
> > > > -#define ZR36057_GPPGCR1         0x02c	/* General Purpose Pins and GuestBus Control Register (1) */
> > > > -
> > > > -#define ZR36057_MCSAR           0x030	/* MPEG Code Source Address Register */
> > > > -
> > > > -#define ZR36057_MCTCR           0x034	/* MPEG Code Transfer Control Register */
> > > > -#define ZR36057_MCTCR_COD_TIME            BIT(30)
> > > > -#define ZR36057_MCTCR_C_EMPTY             BIT(29)
> > > > -#define ZR36057_MCTCR_C_FLUSH             BIT(28)
> > > > +/* Video Front End, Scaler and Pixel Format Register */
> > > > +#define ZR36057_VFESPFR			0x008
> > > > +#define ZR36057_VFESPFR_EXT_FL			BIT(26)
> > > > +#define ZR36057_VFESPFR_TOP_FIELD		BIT(25)
> > > > +#define ZR36057_VFESPFR_VCLK_POL		BIT(24)
> > > > +#define ZR36057_VFESPFR_H_FILTER	21
> > > > +#define ZR36057_VFESPFR_HOR_DCM		14
> > > > +#define ZR36057_VFESPFR_VER_DCM		8
> > > > +#define ZR36057_VFESPFR_DISP_MODE	6
> > >
> > > The above four lines also look odd.
> > >
> > > > +#define ZR36057_VFESPFR_YUV422			(0 << 3)
> > > > +#define ZR36057_VFESPFR_RGB888			BIT(3)
> > >
> > > Was there really a BIT in the original code, or is this a patch against
> > > your previous patch?
> > >
> > No, I added BIT(3), originally it was (1<<3).
> 
> OK, I don't think it is good to have just one BIT when there is a clear
> pattern for the others that the BIT is hiding.  So you should do the
> alignment patch against the original code, and not the code with this
> change.
>
Mam, my new patch is ready but I am not sure how to send, the v1/2 is
not on top, I have not made changes in it because it was not required. Now,  how to
send these two mails as a patchset, since in between these two git
commits, I have another commits too.

> julia
> 
> > > > +#define ZR36057_VFESPFR_RGB565			(2 << 3)
> > > > +#define ZR36057_VFESPFR_RGB555			(3 << 3)
> > > > +#define ZR36057_VFESPFR_ERR_DIF			BIT(2)
> > > > +#define ZR36057_VFESPFR_PACK24			BIT(1)
> > > > +#define ZR36057_VFESPFR_LITTLE_ENDIAN		BIT(0)
> > > > +
> > > > +/* Video Display "Top" Register */
> > > > +#define ZR36057_VDTR			0x00c
> > > > +
> > > > +/* Video Display "Bottom" Register */
> > > > +#define ZR36057_VDBR			0x010
> > > > +
> > > > +/* Video Stride, Status, and Frame Grab Register */
> > > > +#define ZR36057_VSSFGR			0x014
> > > > +#define ZR36057_VSSFGR_DISP_STRIDE	16
> > > > +#define ZR36057_VSSFGR_VID_OVF			BIT(8)
> > > > +#define ZR36057_VSSFGR_SNAP_SHOT		BIT(1)
> > > > +#define ZR36057_VSSFGR_FRAME_GRAB		BIT(0)
> > > > +
> > > > +/* Video Display Configuration Register */
> > > > +#define ZR36057_VDCR			0x018
> > > > +#define ZR36057_VDCR_VID_EN			BIT(31)
> > > > +#define ZR36057_VDCR_MIN_PIX		24
> > > > +#define ZR36057_VDCR_TRITON			BIT(24)
> > > > +#define ZR36057_VDCR_VID_WIN_HT		12
> > >
> > > These don't look well aligned either.
> > >
> > > Please check on the rest.
> > >
> > Yes Ma'am, I am rechecking this.
> >
> > > julia
> > >
> > >
> > > > +#define ZR36057_VDCR_VID_WIN_WID	0
> > > > +
> > > > +/* Masking Map "Top" Register */
> > > > +#define ZR36057_MMTR			0x01c
> > > > +
> > > > +/* Masking Map "Bottom" Register */
> > > > +#define ZR36057_MMBR			0x020
> > > > +
> > > > +/* Overlay Control Register */
> > > > +#define ZR36057_OCR			0x024
> > > > +#define ZR36057_OCR_OVL_ENABLE			BIT(15)
> > > > +#define ZR36057_OCR_MASK_STRIDE		0
> > > > +
> > > > +/* System, PCI, and General Purpose Pins Control Register */
> > > > +#define ZR36057_SPGPPCR			0x028
> > > > +#define ZR36057_SPGPPCR_SOFT_RESET		BIT(24)
> > > > +
> > > > +/* General Purpose Pins and GuestBus Control Register (1) */
> > > > +#define ZR36057_GPPGCR1			0x02c
> > > > +
> > > > +/* MPEG Code Source Address Register */
> > > > +#define ZR36057_MCSAR			0x030
> > > > +
> > > > +/* MPEG Code Transfer Control Register */
> > > > +#define ZR36057_MCTCR			0x034
> > > > +#define ZR36057_MCTCR_COD_TIME			BIT(30)
> > > > +#define ZR36057_MCTCR_C_EMPTY			BIT(29)
> > > > +#define ZR36057_MCTCR_C_FLUSH			BIT(28)
> > > >  #define ZR36057_MCTCR_COD_GUEST_ID	20
> > > >  #define ZR36057_MCTCR_COD_GUEST_REG	16
> > > >
> > > > -#define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
> > > > -
> > > > -#define ZR36057_ISR             0x03c	/* Interrupt Status Register */
> > > > -#define ZR36057_ISR_GIRQ1                BIT(30)
> > > > -#define ZR36057_ISR_GIRQ0                BIT(29)
> > > > -#define ZR36057_ISR_COD_REP_IRQ            BIT(28)
> > > > -#define ZR36057_ISR_JPEG_REP_IRQ           BIT(27)
> > > > -
> > > > -#define ZR36057_ICR             0x040	/* Interrupt Control Register */
> > > > -#define ZR36057_ICR_GIRQ1                BIT(30)
> > > > -#define ZR36057_ICR_GIRQ0                BIT(29)
> > > > -#define ZR36057_ICR_COD_REP_IRQ            BIT(28)
> > > > -#define ZR36057_ICR_JPEG_REP_IRQ           BIT(27)
> > > > -#define ZR36057_ICR_INT_PIN_EN             BIT(24)
> > > > -
> > > > -#define ZR36057_I2CBR           0x044	/* I2C Bus Register */
> > > > -#define ZR36057_I2CBR_SDA		 BIT(1)
> > > > -#define ZR36057_I2CBR_SCL		 BIT(0)
> > > > -
> > > > -#define ZR36057_JMC             0x100	/* JPEG Mode and Control */
> > > > -#define ZR36057_JMC_JPG                  BIT(31)
> > > > -#define ZR36057_JMC_JPG_EXP_MODE          (0 << 29)
> > > > -#define ZR36057_JMC_JPG_CMP_MODE           BIT(29)
> > > > -#define ZR36057_JMC_MJPG_EXP_MODE         (2 << 29)
> > > > -#define ZR36057_JMC_MJPG_CMP_MODE         (3 << 29)
> > > > -#define ZR36057_JMC_RTBUSY_FB            BIT(6)
> > > > -#define ZR36057_JMC_GO_EN                BIT(5)
> > > > -#define ZR36057_JMC_SYNC_MSTR             BIT(4)
> > > > -#define ZR36057_JMC_FLD_PER_BUFF         BIT(3)
> > > > -#define ZR36057_JMC_VFIFO_FB             BIT(2)
> > > > -#define ZR36057_JMC_CFIFO_FB             BIT(1)
> > > > -#define ZR36057_JMC_STLL_LIT_ENDIAN       BIT(0)
> > > > -
> > > > -#define ZR36057_JPC             0x104	/* JPEG Process Control */
> > > > -#define ZR36057_JPC_P_RESET              BIT(7)
> > > > -#define ZR36057_JPC_COD_TRNS_EN            BIT(5)
> > > > -#define ZR36057_JPC_ACTIVE               BIT(0)
> > > > -
> > > > -#define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
> > > > -#define ZR36057_VSP_VSYNC_SIZE           16
> > > > -#define ZR36057_VSP_FRM_TOT              0
> > > > -
> > > > -#define ZR36057_HSP             0x10c	/* Horizontal Sync Parameters */
> > > > -#define ZR36057_HSP_HSYNC_START          16
> > > > -#define ZR36057_HSP_LINE_TOT             0
> > > > -
> > > > -#define ZR36057_FHAP            0x110	/* Field Horizontal Active Portion */
> > > > -#define ZR36057_FHAP_NAX                16
> > > > -#define ZR36057_FHAP_PAX                0
> > > > -
> > > > -#define ZR36057_FVAP            0x114	/* Field Vertical Active Portion */
> > > > -#define ZR36057_FVAP_NAY                16
> > > > -#define ZR36057_FVAP_PAY                0
> > > > -
> > > > -#define ZR36057_FPP             0x118	/* Field Process Parameters */
> > > > -#define ZR36057_FPP_ODD_EVEN             BIT(0)
> > > > -
> > > > -#define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
> > > > -
> > > > -#define ZR36057_JCFT            0x120	/* JPEG Code FIFO Threshold */
> > > > -
> > > > -#define ZR36057_JCGI            0x124	/* JPEG Codec Guest ID */
> > > > -#define ZR36057_JCGI_JPE_GUEST_ID         4
> > > > -#define ZR36057_JCGI_JPE_GUEST_REG        0
> > > > -
> > > > -#define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
> > > > -
> > > > -#define ZR36057_POR             0x200	/* Post Office Register */
> > > > -#define ZR36057_POR_PO_PEN                BIT(25)
> > > > -#define ZR36057_POR_PO_TIME               BIT(24)
> > > > -#define ZR36057_POR_PO_DIR                BIT(23)
> > > > -
> > > > -#define ZR36057_STR             0x300	/* "Still" Transfer Register */
> > > > +/* MPEG Code Memory Pointer Register */
> > > > +#define ZR36057_MCMPR			0x038
> > > > +
> > > > +/* Interrupt Status Register */
> > > > +#define ZR36057_ISR			0x03c
> > > > +#define ZR36057_ISR_GIRQ1			BIT(30)
> > > > +#define ZR36057_ISR_GIRQ0			BIT(29)
> > > > +#define ZR36057_ISR_COD_REP_IRQ			BIT(28)
> > > > +#define ZR36057_ISR_JPEG_REP_IRQ		BIT(27)
> > > > +
> > > > +/* Interrupt Control Register */
> > > > +#define ZR36057_ICR			0x040
> > > > +#define ZR36057_ICR_GIRQ1			BIT(30)
> > > > +#define ZR36057_ICR_GIRQ0			BIT(29)
> > > > +#define ZR36057_ICR_COD_REP_IRQ			BIT(28)
> > > > +#define ZR36057_ICR_JPEG_REP_IRQ		BIT(27)
> > > > +#define ZR36057_ICR_INT_PIN_EN			BIT(24)
> > > > +
> > > > +/* I2C Bus Register */
> > > > +#define ZR36057_I2CBR			0x044
> > > > +#define ZR36057_I2CBR_SDA			BIT(1)
> > > > +#define ZR36057_I2CBR_SCL			BIT(0)
> > > > +
> > > > +/* JPEG Mode and Control */
> > > > +#define ZR36057_JMC			0x100
> > > > +#define ZR36057_JMC_JPG				BIT(31)
> > > > +#define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
> > > > +#define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
> > > > +#define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
> > > > +#define ZR36057_JMC_MJPG_CMP_MODE		(3 << 29)
> > > > +#define ZR36057_JMC_RTBUSY_FB			BIT(6)
> > > > +#define ZR36057_JMC_GO_EN			BIT(5)
> > > > +#define ZR36057_JMC_SYNC_MSTR			BIT(4)
> > > > +#define ZR36057_JMC_FLD_PER_BUFF		BIT(3)
> > > > +#define ZR36057_JMC_VFIFO_FB			BIT(2)
> > > > +#define ZR36057_JMC_CFIFO_FB			BIT(1)
> > > > +#define ZR36057_JMC_STLL_LIT_ENDIAN		BIT(0)
> > > > +
> > > > +/* JPEG Process Control */
> > > > +#define ZR36057_JPC			0x104
> > > > +#define ZR36057_JPC_P_RESET			BIT(7)
> > > > +#define ZR36057_JPC_COD_TRNS_EN			BIT(5)
> > > > +#define ZR36057_JPC_ACTIVE			BIT(0)
> > > > +
> > > > +/* Vertical Sync Parameters */
> > > > +#define ZR36057_VSP			0x108
> > > > +#define ZR36057_VSP_VSYNC_SIZE		16
> > > > +#define ZR36057_VSP_FRM_TOT		0
> > > > +
> > > > +/* Horizontal Sync Parameters */
> > > > +#define ZR36057_HSP			0x10c
> > > > +#define ZR36057_HSP_HSYNC_START		16
> > > > +#define ZR36057_HSP_LINE_TOT		0
> > > > +
> > > > +/* Field Horizontal Active Portion */
> > > > +#define ZR36057_FHAP			0x110
> > > > +#define ZR36057_FHAP_NAX		16
> > > > +#define ZR36057_FHAP_PAX		0
> > > > +
> > > > +/* Field Vertical Active Portion */
> > > > +#define ZR36057_FVAP			0x114
> > > > +#define ZR36057_FVAP_NAY		16
> > > > +#define ZR36057_FVAP_PAY		0
> > > > +
> > > > +/* Field Process Parameters */
> > > > +#define ZR36057_FPP			0x118
> > > > +#define ZR36057_FPP_ODD_EVEN			BIT(0)
> > > > +
> > > > +/* JPEG Code Base Address */
> > > > +#define ZR36057_JCBA			0x11c
> > > > +
> > > > +/* JPEG Code FIFO Threshold */
> > > > +#define ZR36057_JCFT			0x120
> > > > +
> > > > +/* JPEG Codec Guest ID */
> > > > +#define ZR36057_JCGI			0x124
> > > > +#define ZR36057_JCGI_JPE_GUEST_ID	4
> > > > +#define ZR36057_JCGI_JPE_GUEST_REG	0
> > > > +
> > > > +/* GuestBus Control Register (2) */
> > > > +#define ZR36057_GCR2			0x12c
> > > > +
> > > > +/* Post Office Register */
> > > > +#define ZR36057_POR			0x200
> > > > +#define ZR36057_POR_PO_PEN			BIT(25)
> > > > +#define ZR36057_POR_PO_TIME			BIT(24)
> > > > +#define ZR36057_POR_PO_DIR			BIT(23)
> > > > +
> > > > +/* "Still" Transfer Register */
> > > > +#define ZR36057_STR			0x300
> > > >
> > > >  #endif
> > > > --
> > > > 2.30.2
> > > >
> > > > --
> > > > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > > > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > > > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHCgnP6Jr6TbjwUy%40kali.
> > > >
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHDR7VxighihfZd5%40kali.
> >
