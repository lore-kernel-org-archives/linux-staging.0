Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B611372
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 16:07:15 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c7so38923707qka.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JR0eY503IkHJjk9jTmWA+lRcED24SP8xeTX1ZCjwatw=;
        b=F0o/6n6KN+ekB/ZkFTt9D3rjV8YW/1lrBw73xIsa9IvuPtDwj0uwMmPtuXgY+QvKHa
         HdSxdEjZdaxIG1wjaMScQzwLefU3zRrfSwhJ1bg6iPVe7xXF8UPkajxbuWR0dKamuivS
         DNo2Fb6k47ZXUoJSFOQQa5TJK0Te5Dgpsgrvr96TY/Oalo6BX8efPVQLyMJFs3mfOuAU
         97Uqm2Fm+cnXccDungqscRAOjf1HPrJ2tgQDfW9btTqwJ8LbXcxXe0i3yOl5k/b5WZ/l
         cdW00uPceGN1O7sMVG3gkm95dhN2mrHt931s34OdNwPCBuPzsaizw2dkcbnCY4THIPDr
         gRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JR0eY503IkHJjk9jTmWA+lRcED24SP8xeTX1ZCjwatw=;
        b=Ywg8s1GhlidrNwGzMoKPEtd2M4fPIFt3mfEz6fP7dSE17UocFYUxe10tTXjPqjSwFH
         KMJvHzGV7gLmOppmFiSsrWu/BteLfsWtMad8lIllFEmS852fStXfK/57sEWE4g6P015h
         8YcUVx9XLWWE77ugFy8hd8i15tS2Dr1keu+Uel1Vf4TqmTRcxVBv9aS735Blp3k7MP59
         WLYPI8/fZjpBHVLQD+cClb7c/b+tPKgVIRxTQnlF0VyQsmIc5WzDOKPqzdm3qXcOkiuA
         AR1Kc+Jcca2Gl7uNTGS5jRXKT6FqWD9/KmELxlpGtpFewp95aj9Z/pD9cXmVcmKV8BGq
         VHFA==
X-Gm-Message-State: AOAM533LIXALIEGzQLndn6x+rkkz6MKZktpUEN4u2D3ipmjdw2K1eUAp
	wEV5Sn3U0S15nR+ntZBFzpE=
X-Google-Smtp-Source: ABdhPJzH7fvxRNhTIJY6Fa1bhJ6FfAhbXKwduBasI9xtxCION+BPW7g4JPtBNgY3xnuUSpyTsTkIkw==
X-Received: by 2002:a37:9244:: with SMTP id u65mr25338431qkd.46.1632154034728;
        Mon, 20 Sep 2021 09:07:14 -0700 (PDT)
Received: from Zachary-Arch ([128.211.185.212])
        by smtp.gmail.com with ESMTPSA id p12sm3180353qkj.54.2021.09.20.09.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:07:14 -0700 (PDT)
Date: Mon, 20 Sep 2021 09:07:13 -0700
From: Zachary Mayhew <zacklukem.kernel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@lists.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
Message-ID: <YUixsZQ/J0dPfJqj@Zachary-Arch.localdomain>
References: <20210920152601.170453-1-zacklukem.kernel@gmail.com>
 <YUiq9iDGLN6+5+rd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUiq9iDGLN6+5+rd@kroah.com>

On Mon, Sep 20, 2021 at 05:38:30PM +0200, Greg KH wrote:
> On Mon, Sep 20, 2021 at 08:26:03AM -0700, Zachary Mayhew wrote:
> > Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
> 
> Odd, this shouldn't be in the body of the email :(
> 
> > 
> > This patch adds documentation for fbtft_write_spi() to make its
> > calling context clear and explain what it does.
> > 
> > Signed-off-by: Zachary Mayhew <zacklukem.kernel@gmail.com>
> > ---
> >  drivers/staging/fbtft/fbtft-io.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
> > index de1904a443c2..985d7cf8c774 100644
> > --- a/drivers/staging/fbtft/fbtft-io.c
> > +++ b/drivers/staging/fbtft/fbtft-io.c
> > @@ -5,6 +5,19 @@
> >  #include <linux/spi/spi.h>
> >  #include "fbtft.h"
> >  
> > +/**
> > + * fbtft_write_spi() - write data to current spi
> > + * @par: Driver data including driver &struct spi_device
> > + * @buf: Buffer to write to spi
> > + * @len: Length of the buffer
> > + * Context: can sleep
> > + *
> > + * Builds an &struct spi_transfer and &struct spi_message object based on the
> > + * given @buf and @len.  These are then used in a call to spi_sync() which will
> > + * write to the spi.
> > + *
> > + * Return: zero on success or else a negative error code
> > + */
> >  int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
> >  {
> >  	struct spi_transfer t = {
> > -- 
> > 2.33.0
> > 
> > 
> 
> Is this file being imported into the kernel doc tools?  If so, great, if
> not, this isn't going to help out all that much, right?

It doesn't appear to be imported at this time, as such it may not be
necessary.

> 
> thanks,
> 
> greg k-h

Thanks,
-Zachary Mayhew
