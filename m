Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488272F5468
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 17:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412290; cv=none; b=n5ECQOLI3xXcf50+B0xM/YGFPxx+sAWgnIiqqrtvDlToRlI2nh/0Kw/yzPDpqB+0txDMLmQhE/5C8mg2PEcCQELa1o0a4bT3trqo66Ve+j74ysVXpnsOrJFaqToA2gNh/UZWuYUiC2pJUw2JLiBvoNuHhO2bQEXCxgp4ZuV/IYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412290; c=relaxed/simple;
	bh=4e8drGCbCMEGkeJqJL8hBuXVLiObLZ0AkwcUUafRzxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWCbfIFhQJ8ZTuaj9sUHYLhheVWyeKPsDN27NqDFsnGQyQzisStQLitQkR9iXgwC353fA3n/DYFQNAczZKGlj/iDLyQlhLoDd4PAC478S6fJsBzvtyRF45q+opx6xHuk44qZCav0KJwtEh7975B3lDMYkepG0myzjdmIOlFm3CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bszk5JoY; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bszk5JoY"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-790948758c1so89396637b3.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768412287; x=1769017087; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNKgmzXJzqRMXg2Qi6sVMUlgJyo3BFl1pk1B1U573A8=;
        b=Bszk5JoYnP2n91MzGCyR3/6espSLfcDtRdb/6x6C2X159AuYP6CJLN8bPv4vY77t5Q
         7eg02kTUZ0sAO8ns2GVIlXr3K2qF0G0GagH+0VIg98/TOY+F2X3Pmkq7gW1wgwYtaHKT
         hwQVb8Fhs8cq1WanNvc1W4Nocgn+TuX5pjpEriIjfJW7YMNdL3+Frb7+wc1m/6Mu28Gc
         uxgICqwnKnJ1oo2z2FqUhmGuN4p/D7E5lkohrOM2Q2+5KxTU3/AlG46F+ILGFh+qfsHG
         Q+aNQbJ4rnfZbnwPXnYiGZwqrFEdr73QNe4auG7/ssGUeNJQloYidAvcXGqvyMq7NMRf
         SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412287; x=1769017087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNKgmzXJzqRMXg2Qi6sVMUlgJyo3BFl1pk1B1U573A8=;
        b=WQuKQmqnMkPh+Bi1jqAhJ271L88pK9+PQIcUOLUkRZiFWRdHGG5Fm45kJjJaVD6jNV
         ugN6hzT8fgD833a0LUOqlRBTUVV8R8hp8q/ztIznlCmNRtvqVt36GQDszH7fyJvy7CN1
         Ze/yvioHxJQOden69D4Hg6qKnWJwVnE7bEwtS5VgMVonyqoVonkod56zwMzafhqR2ub5
         CYCCk2UXoZcXgpUEeF3lsiZGSFqpsh9vd4oV/C746n9I57o1HoZLqs15DzFHy7qAw2/T
         vAK4YY8ofM3ZqMNuy1kKp+lRE+/BcqcYCWMIYKnQzAk2cNyxAakMxJ0ba7eLfZYz+939
         pR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOBA0OERjb+acxEG0xxE/jWYqk7wHiFm08Zn9DmsvEajc41VDtCqdmt9NFtAcbuC873STyoQ27vtGLwoEc@lists.linux.dev
X-Gm-Message-State: AOJu0YxNhSqYouwcUwurBe0K3JXJTojjyMs4LY3AacQPDCqYu1yqTT0n
	p7BUJzrWQrqwIB8/zuLN4/7Kk//AmGOA4pU9pLA0aakRCUxn5xDDtl7Zlyj9Qn+tS2G4uP7aI1K
	eUTGH157lUvaXtSZ8yCL5x8cGvhQIge0=
X-Gm-Gg: AY/fxX794k1b+7IrDW5RWNTRHlo+VU2tgSYpv97FI/6CY3J/RA7YXy19rlrbcNtIU6y
	e2fqPpEnd6Z0l9K+/Y8+Cfq1EOPcmyJrapsZd0HFRuXR9CuBEsjCeoF06g9LCu0IrDnVkVJUEFr
	v2XWyt88nYZzaIXPFF+xkbMBXZroItgyEVPQGpplsENjDsFkROkkRCiB4T67qIRCBIklwG1yyCe
	3ULMe+JSYQ+kbpm4J34DQK+RcsNW3TvFE67m1JltF2RrDNDU0G+fcfAYnoA+V7TQiFjCi0kGA==
X-Received: by 2002:a05:690e:1907:b0:63f:b5d8:9db2 with SMTP id
 956f58d0204a3-64901aac89fmr3055887d50.14.1768412286780; Wed, 14 Jan 2026
 09:38:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251231052427.58840-1-karthikey3608@gmail.com> <aWTUMPVMzxL7XuHt@kekkonen.localdomain>
In-Reply-To: <aWTUMPVMzxL7XuHt@kekkonen.localdomain>
From: Karthikey Kadati <karthikey3608@gmail.com>
Date: Wed, 14 Jan 2026 23:07:54 +0530
X-Gm-Features: AZwV_QjGYmzL6YR8wxZBwB1j333f3qswknmP_D3Evmi-bMG1uGseei4PKAWeyes
Message-ID: <CAPsOcun2Pkn5ojW_QgR3m2M4aZ2pu4bnebaNUE3hHej+b86m_A@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: remove private white balance IOCTLs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

You are absolutely right.

I investigated the code and confirmed that `integer_bits` in
`atomisp_wb_config` is essential for the hardware's gain calculation
(shift logic) and varies by configuration. Mapping this to standard
V4L2 controls (like `V4L2_CID_RED_BALANCE`) would mask this parameter,
making the interface unusable or forcing incorrect assumptions.

I also see that `ATOMISP_IOC_S_PARAMETERS` already exists and accepts
`struct atomisp_parameters`, which includes `atomisp_wb_config`. This
appears to be the "parameter buffer" mechanism you referred to, which
correctly handles the full configuration context.

Attempting to convert these specific private IOCTLs to standard
controls was the wrong approach, as they seem to be redundant legacy
interfaces better served by the existing parameter buffer.

I will drop this patch from the series.

Thanks,
Karthikey


On Mon, 12 Jan 2026 at 16:30, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Karthikey,
>
> On Wed, Dec 31, 2025 at 10:54:27AM +0530, Karthikey D Kadati wrote:
> > This patch resolves a MUST-FIX graduation blocker identified in the
> > atomisp TODO by removing the private ATOMISP_IOC_G_ISP_WHITE_BALANCE
> > and ATOMISP_IOC_S_ISP_WHITE_BALANCE and replacing them with standard
> > V4L2 control handling.
> >
> > The private IOCTLs were used to set white balance parameters. This
> > functionality is now mapped to the standard V4L2 controls
> > V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE.
> >
> > A helper function `atomisp_v4l2_set_wb` is introduced to translate the
> > V4L2 control values to the driver's internal configuration format.
> >
> > Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
> > ---
> >  .../media/atomisp/include/linux/atomisp.h     |  5 +-
> >  .../staging/media/atomisp/pci/atomisp_ioctl.c | 49 ++++++++++++++++---
> >  2 files changed, 44 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> > index 3c8fa3f58..fcf116cc4 100644
> > --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> > +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> > @@ -741,10 +741,7 @@ enum atomisp_burst_capture_options {
> >       _IOW('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
> >
> >  /* white balance Correction */
> > -#define ATOMISP_IOC_G_ISP_WHITE_BALANCE \
> > -     _IOR('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
> > -#define ATOMISP_IOC_S_ISP_WHITE_BALANCE \
> > -     _IOW('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
> > +
> >
> >  /* fpn table loading */
> >  #define ATOMISP_IOC_S_ISP_FPN_TABLE \
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > index bb8b2f221..5c0a1d92b 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> > @@ -1083,6 +1083,38 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
> >   * applications initialize the id and value fields of a struct v4l2_control
> >   * and call this ioctl.
> >   */
> > +static int atomisp_v4l2_set_wb(struct atomisp_sub_device *asd, int id,
> > +                            int value)
> > +{
> > +     struct atomisp_device *isp = asd->isp;
> > +     struct atomisp_wb_config config;
> > +     int ret;
> > +
> > +     if (atomisp_css_get_wb_config(asd, &config)) {
>
> I'm not sure this makes sense. How will the caller know the value of
> integer_bits?
>
> I'd think the IOCTL interface of this driver should probably be largely
> removed, to be replaced by the parameter buffer.
>
> > +             dev_err(isp->dev, "%s: can't get wb config\n", __func__);
> > +             return -EINVAL;
> > +     }
> > +
> > +     switch (id) {
> > +     case V4L2_CID_BLUE_BALANCE:
> > +             config.b = value << (16 - 8 - config.integer_bits + 1);
> > +             break;
> > +     case V4L2_CID_RED_BALANCE:
> > +             config.r = value << (16 - 8 - config.integer_bits + 1);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret = atomisp_white_balance_param(asd, 1, &config);
> > +     if (ret) {
> > +             dev_err(isp->dev, "%s: set wb config failed\n", __func__);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int atomisp_s_ctrl(struct file *file, void *fh,
> >                         struct v4l2_control *control)
> >  {
> > @@ -1122,6 +1154,17 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
> >       case V4L2_CID_ATOMISP_LOW_LIGHT:
> >               ret = atomisp_low_light(asd, 1, &control->value);
> >               break;
> > +     case V4L2_CID_AUTO_WHITE_BALANCE:
> > +             /*
> > +              * TODO: Auto White Balance is not supported yet.
> > +              * It is currently handled by the ISP.
> > +              */
> > +             ret = 0;
> > +             break;
> > +     case V4L2_CID_RED_BALANCE:
> > +     case V4L2_CID_BLUE_BALANCE:
> > +             ret = atomisp_v4l2_set_wb(asd, control->id, control->value);
> > +             break;
> >       default:
> >               ret = -EINVAL;
> >               break;
> > @@ -1484,13 +1527,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
> >               err = atomisp_ctc(asd, 1, arg);
> >               break;
> >
> > -     case ATOMISP_IOC_G_ISP_WHITE_BALANCE:
> > -             err = atomisp_white_balance_param(asd, 0, arg);
> > -             break;
> >
> > -     case ATOMISP_IOC_S_ISP_WHITE_BALANCE:
> > -             err = atomisp_white_balance_param(asd, 1, arg);
> > -             break;
> >
> >       case ATOMISP_IOC_G_3A_CONFIG:
> >               err = atomisp_3a_config_param(asd, 0, arg);
>
> --
> Regards,
>
> Sakari Ailus
