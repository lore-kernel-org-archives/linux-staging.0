Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8F2C9E
	for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 18:44:35 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-79969c14964so1641863241.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692125074; x=1692729874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mr89f7jlVGVNCiS1wFJrPscC+n1hf6qGfxlXNpoD46A=;
        b=WMAQvCeiTFAjlOFLgFleqIQX7ucLCx4JlbR26BMfSLYqCBaYnmPSnQHOS5g9Rpq4fX
         MOkachJJHldDF4XpEiJ34S3tPw8N61k4csG52/sWSTNVNOex7xc5jiOcHhjmX3j46d17
         KDbZWz6dbZR3H0gpKxTc5naXTvIYiy14eLzi9g/eFBxJy16zvjMVaaEWW5O9GujFqRwW
         A/A6WaYPW7QK9labOqQ5/jLSbsIQcsl8KKniP5Kz1p3kI+GqLs7leXzD0m909vK0bogb
         wNaga3fvdYMqbim9NcMkMcrrbzCtVXDgA6uo18ZaCvQgs0dBd3xRzwC361OPcyacgOZN
         GRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692125074; x=1692729874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr89f7jlVGVNCiS1wFJrPscC+n1hf6qGfxlXNpoD46A=;
        b=JMhGmJbPGmIiajfNiGVrb4uiasn6pbofxEpNH0AFOKDA/5S5P3LvWcKLOI76Vx+60O
         sYUT8d15CGkIBoFQjfr0RDVogNOAjGqyoJkre7l7VBC683y8//nsa9OIfXwBTlhF0rIp
         VGX2kK57AF2wNOY7cQj89J3m+1jxfaY6DGLOyvn0gwq+TKcdGsJ6MMTdbyS49Hgtw6dC
         zFZ/SGncU5QEzC1hhKt87jYDgU9wY5yt+TPOikma3XjzIk9n9NdEY8RfbERVENECRlcP
         52Mu6rJzQ9POwzKYNoxlfaBpvKp0rz2MFMHuAYfqF8Y91Nyb8OZ2UTX9RwTuzCLdf4F4
         +/zA==
X-Gm-Message-State: AOJu0Yy1wx4Ju9zbFu4gzPpZc28yMn9QIyXo6N2WAY9JhuxMDvcvIQIe
	dSL2weq1ZxJ5Vi16nzJfIY8=
X-Google-Smtp-Source: AGHT+IGQDjfmkVlbrf2M9Fn/0we+GLd6kPwKwgcfcbJC9Id9MA/LoYhbuwY+Z1gF2f/sQh6DXh93aw==
X-Received: by 2002:a67:fc94:0:b0:445:872:67ea with SMTP id x20-20020a67fc94000000b00445087267eamr13341344vsp.34.1692125074023;
        Tue, 15 Aug 2023 11:44:34 -0700 (PDT)
Received: from abdel (bras-base-ktnron0692w-grc-13-174-95-13-129.dsl.bell.ca. [174.95.13.129])
        by smtp.gmail.com with ESMTPSA id y3-20020a0cd983000000b0063d152e5d9asm2186570qvj.120.2023.08.15.11.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 11:44:33 -0700 (PDT)
Date: Tue, 15 Aug 2023 14:44:29 -0400
From: Abdel Alkuor <alkuor@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix sii164InitChip function name
Message-ID: <ZNvHjUlGnWqUVSNe@abdel>
References: <20230815043759.404423-1-alkuor@gmail.com>
 <ZNsOv7F1B9AnlUVG@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNsOv7F1B9AnlUVG@nam-dell>

On Tue, Aug 15, 2023 at 07:35:59AM +0200, Nam Cao wrote:
> On Tue, Aug 15, 2023 at 12:37:59AM -0400, Abdel Alkuor wrote:
> > Adhere to Linux Kernel coding style. Found by checkpatch.
> > 
> > Signed-off-by: Abdel Alkuor <alkuor@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
> >  drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
> >  drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> > index e0c7ff3352bf..8b81e8642f9e 100644
> > --- a/drivers/staging/sm750fb/ddk750_dvi.c
> > +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> > @@ -14,7 +14,7 @@
> >  static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
> >  #ifdef DVI_CTRL_SII164
> >  	{
> > -		.init = sii164InitChip,
> > +		.init = sii164_init_chip,
> >  		.get_vendor_id = sii164_get_vendor_id,
> >  		.get_device_id = sii164GetDeviceID,
> >  #ifdef SII164_FULL_FUNCTIONS
> > diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
> > index 3da1796cd7aa..d162e1a16584 100644
> > --- a/drivers/staging/sm750fb/ddk750_sii164.c
> > +++ b/drivers/staging/sm750fb/ddk750_sii164.c
> > @@ -72,7 +72,7 @@ unsigned short sii164GetDeviceID(void)
> >   */
> >  
> >  /*
> > - *  sii164InitChip
> > + *  sii164_init_chip
> >   *      This function initialize and detect the DVI controller chip.
> >   *
> >   *  Input:
> > @@ -118,7 +118,7 @@ unsigned short sii164GetDeviceID(void)
> >   *      0   - Success
> >   *     -1   - Fail.
> >   */
> > -long sii164InitChip(unsigned char edge_select,
> > +long sii164_init_chip(unsigned char edge_select,
> >  		    unsigned char bus_select,
> >  		    unsigned char dual_edge_clk_select,
> >  		    unsigned char hsync_enable,
> 
> I think you introduce new checkpatch warnings here.
> 
> > diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
> > index ca330f6a43e2..13420bcc282c 100644
> > --- a/drivers/staging/sm750fb/ddk750_sii164.h
> > +++ b/drivers/staging/sm750fb/ddk750_sii164.h
> > @@ -16,7 +16,7 @@ enum sii164_hot_plug_mode {
> >  };
> >  
> >  /* Silicon Image SiI164 chip prototype */
> > -long sii164InitChip(unsigned char edgeSelect,
> > +long sii164_init_chip(unsigned char edgeSelect,
> >  		    unsigned char busSelect,
> >  		    unsigned char dualEdgeClkSelect,
> >  		    unsigned char hsyncEnable,
> 
> Also here.
> 
> Best regards,
> Nam
> > 

Hi Nam,

Thanks for the review. I will update the indentation in V2.

Abdel
