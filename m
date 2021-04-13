Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255472
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 18:21:39 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id x27so8573630qvd.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=25gNIOG2c1hWR+uLY9hp/OskIyE7B6zmWTWkW5GFvMo=;
        b=VC9MmTbS9UfJzu0FekAhcs7mlPCYm98IVB2VcoWDjGP0y2cKlEKa+MezLqxmqgA9uM
         kCJKFbpfyJVS58HTngHby906J5tjd66qIEKfoC5U05uWqQ1XI1hutChJtXE1TNofrKq3
         xMZRr/le0avcpFTLPi+qEo2VF19yyllsWVQgGyh8JirL9OlsIntOLU88F/ezSyMr+W08
         A13bcYNtrNAh13w35qqayzHo1VdIIKCKeT2Qd+/8Fec022BoLn/zE4AkGHFf/hawmuNn
         d0osnyCz0/9LIcsJobW0TkA8X6IXKxuW1S7EquQnU8Sasj+zPWYDgKUZVk43fCMN0Nv1
         QaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=25gNIOG2c1hWR+uLY9hp/OskIyE7B6zmWTWkW5GFvMo=;
        b=lpkGUUHVdsbwQkKjpWl5J6/Bgbh5f31A4uuGzcHNdFTkh1k5c6fjn21Fo8iiRMRn3A
         QBw1uXXSDry61bqtWU9dIRJSxYsborIK5EMRUnfS7CSLkNFnLvkAy3wEWv7MUygdIgaV
         A92SklCQp68AkCETuq0NXYtzw0i/XVhYWxwIqClGYiiViAtFpMuSiIEweXOA/6b0beJU
         dH9NSf9e8cd8t10rMUyOXp3wRsCUzesSI5riVdkG+jnTCgP/oUrMKhWe3saeAEFgzXTK
         qRbdZaR3W2jm/mDGAl0wWikjN2peloVxYY2X8V7IUY/CDjEwQYC1Uz0MtpbagF1aXlYB
         C1oA==
X-Gm-Message-State: AOAM530XFPzPoXcHhnwFq81md+1Lvt5ONzl9jrhZ8zvp3pjDtF29CDS7
	XGW78zZbjuScEruKh9NdJ1E=
X-Google-Smtp-Source: ABdhPJw5qNta9vUPvuv/qS/Km7aFg6OU2gnJgBElSwcOeY0I+B1jwYCWi3NzxrecW0jMmBi6k1TWMQ==
X-Received: by 2002:a0c:dc04:: with SMTP id s4mr4580782qvk.1.1618338098917;
        Tue, 13 Apr 2021 11:21:38 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:83a0:18ef:c76d:6086? ([2001:1284:f016:a037:83a0:18ef:c76d:6086])
        by smtp.gmail.com with ESMTPSA id q67sm8596124qkb.89.2021.04.13.11.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 11:21:38 -0700 (PDT)
Message-ID: <4e2f52124b29b3ed6c3f7f645f067c503c7cf4cf.camel@gmail.com>
Subject: Re: [PATCH] staging: media: omap4iss: Remove unused macro functions
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Tue, 13 Apr 2021 15:21:35 -0300
In-Reply-To: <03549d0e-04d9-6d37-93e3-c09b29ce53aa@xs4all.nl>
References: <20210412134253.GA19402@focaruja>
	 <03549d0e-04d9-6d37-93e3-c09b29ce53aa@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em ter, 2021-04-13 às 17:06 +0200, Hans Verkuil escreveu:
> On 12/04/2021 15:42, Aline Santana Cordeiro wrote:
> > Remove unused macro functions "to_iss_device()", "to_device()",
> > and "v4l2_dev_to_iss_device(dev)".
> 
> 'git grep to_iss_device drivers/staging/omap4iss' gives me lots of
> hits!
> Same for to_device. Only v4l2_dev_to_iss_device appears to be unused.
> 
> Regards,
> 
>         Hans
> 
This command is really helpful, I didin't know. 
Thank you for the tip.

May I send a v2 removing just v4l2_dev_to_iss_device?

Thank you in advance,
Aline

> > 
> > Signed-off-by: Aline Santana Cordeiro <
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/omap4iss/iss.h | 8 --------
> >  1 file changed, 8 deletions(-)
> > 
> > diff --git a/drivers/staging/media/omap4iss/iss.h
> > b/drivers/staging/media/omap4iss/iss.h
> > index b88f952..a354d5f 100644
> > --- a/drivers/staging/media/omap4iss/iss.h
> > +++ b/drivers/staging/media/omap4iss/iss.h
> > @@ -29,11 +29,6 @@
> >  
> >  struct regmap;
> >  
> > -#define to_iss_device(ptr_module)                              \
> > -       container_of(ptr_module, struct iss_device, ptr_module)
> > -#define
> > to_device(ptr_module)                                          \
> > -       (to_iss_device(ptr_module)->dev)
> > -
> >  enum iss_mem_resources {
> >         OMAP4_ISS_MEM_TOP,
> >         OMAP4_ISS_MEM_CSI2_A_REGS1,
> > @@ -119,9 +114,6 @@ struct iss_device {
> >         unsigned int isp_subclk_resources;
> >  };
> >  
> > -#define v4l2_dev_to_iss_device(dev) \
> > -       container_of(dev, struct iss_device, v4l2_dev)
> > -
> >  int omap4iss_get_external_info(struct iss_pipeline *pipe,
> >                                struct media_link *link);
> >  
> > 
> 


