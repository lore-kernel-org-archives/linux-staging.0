Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1B70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:45:52 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h20so6306681plr.4
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=;
        b=ipk8DwdYIM+Lp82DorQ0slg4Pzo/r2oPaPaTi5pIFNe1/ELqHN5WVqqpvKrp5agVi7
         Gx1ksSa8tqNrGMYoNsPhPZhSaOD31ER84MBkAiY/652qpkOz8FUKaRflCcPolsuJqaQ6
         rpOqq2YPaucNEYx0RI65wb2mHKvNL3vYqF3r+qsPlOeAkAyS0RI4sC5PlltLhW5BvjV5
         2YyEfVsbdSgTiO+zWf6Uqxse1uXsX26RbE/T3jMRoRW5y5Qecg7fKOkxb3dgCm5JrQay
         DJlJtoybuhS1gJpZIz/YYAwCbb9okPIrZzrTJMpW3c2pTAjLeSgZ9UizoxTHQ57bJlxT
         inrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=;
        b=h85CTzUKNL03qxVXCoZWx+NpXxGMpjvNt0OUtqGGHewi+FZSSNUOsK7IvEfMl4Zw2u
         g1t/rJ9qnwvjVcaec2nV3D8N3kBm/M0VphA6VcqXckRgiZ3GxEuOt0u8ZmsdGrzUmSBl
         /HaFFPoj9wvhmtNlqNCWu8SERLlFjspqAn0NJuPq7SI81Z/rw7FLfgZF1YRdA5huWtOx
         YLxUCLnFD0c1ZpTqTURCIxBlQ4bViq7yvBoTkexDtb5+xW2JjzIWiQ1S6JPCgMcdvjXQ
         Xeo18iVJg0MjZ3/uHM/Ivgq6dzRho4xHu2O3bRj6BZ0c01pJx0Ib3hihHiqa8F3FbZMn
         fPyA==
X-Gm-Message-State: AOAM533xRTdBVCF7MmVvchdYI2vHdt7F33+BU+lZ2mn1WvKKH0wrvSDO
	ME/f93hA5Okw1F6VTmRjg+g=
X-Google-Smtp-Source: ABdhPJxM44dz/V1i30xDBVDqbT6VanKYzhUL0fhLrUPPDqvvU5QpP5gH3Y+gZ2QcPWSxTrR/n+W9AA==
X-Received: by 2002:a17:902:8344:b029:ea:fc89:fa72 with SMTP id z4-20020a1709028344b02900eafc89fa72mr4649548pln.45.1618231552084;
        Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id i22sm11367148pgj.90.2021.04.12.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 05:45:51 -0700 (PDT)
Date: Mon, 12 Apr 2021 18:15:42 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, narmstrong@baylibre.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
Message-ID: <YHRA9i+BjveJOUvn@kali>
References: <YHIDufKhTEeuxyl5@kali>
 <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>

On Mon, Apr 12, 2021 at 11:17:22AM +0200, Hans Verkuil wrote:
> On 10/04/2021 21:59, Mitali Borkar wrote:
> > Declared 32 bit unsigned int as static constant inside a function and
> > replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
> > This indicates the value of canvas indexes will remain constant throughout execution.
> > Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
> > u32 reg_name as it will contain data/registry bases to write static
> > const indexes declared above and will keep track of of contiguos
> > registers after each reg_base.
> > This makes code look better, neater. It improves readability.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
> 
> Also change drivers/staging/media/meson/vdec/codec_h264.c.
> 
> It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().
>
I have done chnages in codec_h264.c Now, should I send that as new
patch?

> Regards,
> 
> 	Hans
> 
> >  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
> >  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > index 21e93a13356c..861d8584f22f 100644
> > --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  	struct amvdec_core *core = sess->core;
> >  	struct codec_mpeg12 *mpeg12;
> >  	int ret;
> > +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
> > +	static const u32 canvas2[] = { 8, 0 }
> >  
> >  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
> >  	if (!mpeg12)
> > @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  		goto free_mpeg12;
> >  	}
> >  
> > -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> > -				  (u32[]){ 8, 0 });
> > +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
> >  	if (ret)
> >  		goto free_workspace;
> >  
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > index 7f07a9175815..df5c27266c44 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
> >  }
> >  
> >  int amvdec_set_canvases(struct amvdec_session *sess,
> > -			u32 reg_base[], u32 reg_num[])
> > +			const u32 reg_base[], const u32 reg_num[])
> >  {
> >  	struct v4l2_m2m_buffer *buf;
> >  	u32 pixfmt = sess->pixfmt_cap;
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> > index cfaed52ab526..ace8897c34fe 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> > @@ -17,7 +17,7 @@
> >   * @reg_num: number of contiguous registers after each reg_base (including it)
> >   */
> >  int amvdec_set_canvases(struct amvdec_session *sess,
> > -			u32 reg_base[], u32 reg_num[]);
> > +			const u32 reg_base[], const u32 reg_num[]);
> >  
> >  /* Helpers to read/write to the various IPs (DOS, PARSER) */
> >  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
> > 
> 
