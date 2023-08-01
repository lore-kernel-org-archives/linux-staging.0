Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A40111E
	for <linux-staging@lists.linux.dev>; Tue,  1 Aug 2023 12:55:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so3252125e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Aug 2023 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690894533; x=1691499333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDkOVF5dVkccZSSx3uF9S9mQpuBVPeaNHuRfTVTMyuw=;
        b=NcN067f5r7UOgh2B7Fx9rwvfjtyFPcvE7eUZKkpkMiS8IlqwRSDTuBDBgNpjo+m5AY
         tdKLxPrZbkYzNtB772wmIf8F86y2Fk0VB6sYk66ZBS5lOCg3grMJ6X3Rx0+fQztT+xGk
         LgtJQ+RYCvytpkStP3v6XJ6gZIhQlxZD+rAZP9cHuCwEa1i3SMQGMt/WWVJSAtha28Vx
         P1iXsnUfc28qp7SEbewRosL1S5S1GNDdMSPMCAF+xM9xozZURYfIOMvlFGmSC7EjszGz
         tDgmdJifpVwrzpgFN3Kpp1hpfepzksML6ZiQqbf+QtRB18ByUmL/7NRnhUDCPQFVttb1
         wOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690894533; x=1691499333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDkOVF5dVkccZSSx3uF9S9mQpuBVPeaNHuRfTVTMyuw=;
        b=C8ArA9QUtv7zoqIXFC+Ncd78uPpr+Ob2OTZr53c/7TzMsWMamD0ki3K/75WMo/Vl5Y
         mNBZt+C73YczJqj2PxP5AFC6Toa7HhjrgJWA7sYV0MrZe0jMb3C+SpgEIvXx8wUzePl+
         bmpJFd/7uAf4XoBy1KZUF2txln9Ub9UVX+mH/96ttoYNFkgBHok4xvAfaAxTKdvY9fGZ
         FvtxFLSPi5ib856pn8uVJPoLbYDssZGUdOFLJPBYHKGkm6+mIYQTh+f0Mp+X4GNo0uvc
         bgl+kOpiDqDWFiuBYKGCExrmlUD3RZbDopxO/QKdHYf+Zs4tahziTQX69mw9PMKm9fe/
         e6SQ==
X-Gm-Message-State: ABy/qLYRh1nAQJNTLpeH+OjFWZWA3Q3p4b7kaZIr3Jl8wR1+dyo1vfnZ
	KOHWasGV5AAGrQHFeLJlfH3qAw==
X-Google-Smtp-Source: APBJJlGuxtGGetdaut4uheRF3ll32vx6ed24rJA1ZTPwJSDD6l8me/IrAWVI//zpqmaPfkXykinuxA==
X-Received: by 2002:a1c:ed0c:0:b0:3fb:9ef1:34ef with SMTP id l12-20020a1ced0c000000b003fb9ef134efmr2496596wmh.37.1690894532910;
        Tue, 01 Aug 2023 05:55:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c230900b003fbe561f6a3sm16759367wmo.37.2023.08.01.05.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 05:55:32 -0700 (PDT)
Date: Tue, 1 Aug 2023 15:55:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kate Hsuan <hpa@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 1/2] media: atomisp: Fix smatch warnings caused by
 atomisp custom assert() usage
Message-ID: <65b19c92-fc5b-4767-81c5-0077aa3ec90f@kadam.mountain>
References: <20230730153343.22033-1-hdegoede@redhat.com>
 <CAEth8oFe1QFfbZ=COzT=BLJtoAXAgqVMZtTM6qe4aNvQ0ZNVPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEth8oFe1QFfbZ=COzT=BLJtoAXAgqVMZtTM6qe4aNvQ0ZNVPw@mail.gmail.com>

On Tue, Aug 01, 2023 at 08:32:18PM +0800, Kate Hsuan wrote:
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > index b20acaab0595..ced21dedf7ac 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -351,15 +351,6 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> >         ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> >                             "allocate_mipi_frames(%p) enter:\n", pipe);
> >
> > -       assert(pipe);
> > -       assert(pipe->stream);
> > -       if ((!pipe) || (!pipe->stream)) {
> > -               ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> > -                                   "allocate_mipi_frames(%p) exit: pipe or stream is null.\n",
> > -                                   pipe);
> > -               return -EINVAL;
> > -       }
> 
> Thank you for working on this.
> 
> The NULL test for pipe could be kept here since the caller only tests
> "stream" but not test "main_pipe" is NULL. (sh_css.c line: 1799)
> 

It dereferences main_pipe on the next line so this check would be too
late.

drivers/staging/media/atomisp/pci/sh_css.c
  1799          main_pipe       = stream->last_pipe;
  1800          pipe_id = main_pipe->mode;

Smatch says that ->last_pipe is known to be non-NULL as well.

$ smdb.py create_host_pipeline
drivers/staging/media/atomisp/pci/sh_css.c |  ia_css_stream_start | create_host_pipeline |        PARAM_VALUE |  0 | stream->last_pipe | 4096-ptr_max

regards,
dan carpenter
