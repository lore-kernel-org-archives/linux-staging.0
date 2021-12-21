Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766D29CA
	for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 20:41:48 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id e16so227864qkl.12
        for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 12:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0L/zCdTzYL+bpasAbKxdwMufx6Ki92cX1lsoKE84Vow=;
        b=Th4r/bsQMnfzXLtz0OKCa8UfMb8HvudGBMXAYe5iT23P2800sYKRUunevTcnrnjKOW
         Xu72cQF+znRdJYd22sXrOx/OraCv7DB6XLZaP4HdEIIfZz5x67mkxYej8jogYcLTCLDd
         p8ykJf0v9nNWosEXLv5sb1FJvn4rBO9GYR9G+7uOt+L5ARuOVeXgopWr5oQXjFcH7aAm
         aGRIRWs5EDKb34aN6K3f2TFmFmgrFPgOneOMUH+b7ftIUjsoz46CKGpvAOyDPKvD2Jhp
         MwlJOD+kKZsiNcZ+VevuluRhsaXGUKmV6lgAKiFsPRaBWceSaZ6+ypVsfuU7MmjdojMA
         SyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0L/zCdTzYL+bpasAbKxdwMufx6Ki92cX1lsoKE84Vow=;
        b=PfBiTy02F8jPxlO8C7tUJwFliuG3rk13RDodLZYLGDMH6qd+pmLICbGPiDqkxa+Sxd
         m4r2kuRDlOPbkZXPAOe2tg82AeoinLjDoLDGh3QyKwhG+WAllz1jf7RWlaITrf+uBOpD
         1k0hw35ITqFObZvZL827DJ18Kli/Zo5olo8GAPrrU1wglNe+rKayqLB+IPYI7nqQ1WPj
         tRpwzgJIByam1htipgq6dyiUs/bxziJ2iBHkXNjPhsbNvAuQBQsg7GC9cvRWPQM4XTlA
         gHj18mhlvzlwNLiVWi6TdmDjU4xWM4n4Vu/0D8dIZAFeuNZNn8YpF1zd8OuTO3pkCZg2
         wIqQ==
X-Gm-Message-State: AOAM530rXhe3vCoIo1QWGMu4JtujrEIE4K54If1CixzypLVK1lQEjWD/
	b8fAmRg7vZmG7jAkrZBoYqc=
X-Google-Smtp-Source: ABdhPJygxTUYpfu/KJlTncs23BQYQ9IlPS+6EmdoAjQJ5no6Z/JqFkZRwEiDvjn0MaPp6ZMq2okYZQ==
X-Received: by 2002:a05:620a:2494:: with SMTP id i20mr85971qkn.624.1640119307571;
        Tue, 21 Dec 2021 12:41:47 -0800 (PST)
Received: from debianG ([190.191.20.243])
        by smtp.gmail.com with ESMTPSA id n20sm50421qkp.65.2021.12.21.12.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 12:41:47 -0800 (PST)
Date: Tue, 21 Dec 2021 17:41:46 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: Re: [PATCH 2/4] staging: vc04_services: avoid the use of typedef for
 function pointers
Message-ID: <YcI8ChRmECkk/6RV@debianG>
References: <cover.1639858361.git.gascoar@gmail.com>
 <7f681ccee713ef8600f40c765b6a59e119c6bf2c.1639858361.git.gascoar@gmail.com>
 <YcFyASAYo6yimT8W@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcFyASAYo6yimT8W@kroah.com>

On Tue, Dec 21, 2021 at 07:19:45AM +0100, Greg KH wrote:
> On Mon, Dec 20, 2021 at 06:29:12PM -0300, Gaston Gonzalez wrote:
> > Replace typedef bm2835_mmal_v4l2_ctrl_cb with equivalent declaration to
> > better align with the linux kernel coding style.
> > 
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >  .../vc04_services/bcm2835-camera/controls.c   | 76 +++++++++----------
> >  1 file changed, 35 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> > index b096a12387f7..7782742396fc 100644
> > --- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
> > +++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> > @@ -65,13 +65,6 @@ enum bm2835_mmal_ctrl_type {
> >  	MMAL_CONTROL_TYPE_CLUSTER, /* special cluster entry */
> >  };
> >  
> > -struct bm2835_mmal_v4l2_ctrl;
> > -
> > -typedef	int(bm2835_mmal_v4l2_ctrl_cb)(
> > -				struct bm2835_mmal_dev *dev,
> > -				struct v4l2_ctrl *ctrl,
> > -				const struct bm2835_mmal_v4l2_ctrl *mmal_ctrl);
> 
> Function pointer typedefs are ok, if they are needed.
> 
> > -
> >  struct bm2835_mmal_v4l2_ctrl {
> >  	u32 id; /* v4l2 control identifier */
> >  	enum bm2835_mmal_ctrl_type type;
> > @@ -84,7 +77,8 @@ struct bm2835_mmal_v4l2_ctrl {
> >  	u64 step; /* step size of the control */
> >  	const s64 *imenu; /* integer menu array */
> >  	u32 mmal_id; /* mmal parameter id */
> > -	bm2835_mmal_v4l2_ctrl_cb *setter;
> > +	int (*bm2835_mmal_v4l2_ctrl_cb)(struct bm2835_mmal_dev *dev, struct v4l2_ctrl *ctrl,
> > +					const struct bm2835_mmal_v4l2_ctrl *mmal_ctrl);
> 
> No need to rename this function pointer, why not keep it at "setter"?
> That would make this patch much smaller and more obvious.
> 

Ok, will do that in v2.

thanks,

Gaston


> thanks,
> 
> greg k-h
> 
