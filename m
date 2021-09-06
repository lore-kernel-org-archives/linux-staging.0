Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41B3FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 23:05:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id g14so6623588pfm.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 16:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RsnUjT2+lUd00F759XigVRFI1hNrAY0fPM7J0dBz5Ak=;
        b=kf8ERraXpY7/9DjZhN2LY8R3OBm2l4f4d41PW8s3L2lEqxeGjqwzu2Qjt/stfq8cgL
         56qKqdFX6vfgJ5Y4h0AKSrTYyQOtLs0m11njbI/0hI48xw+JkeVRU2/WlsWtDtqwG8fQ
         C+VFDvrF9zOmVJWV74mKVg4KXCMnEPXO3oESxojPsZX+ULrmKhpQJEG3QwrfCC7Ba31H
         GuRm9DXurfxNFTW60Q0p8XIbzE5LK21LhdCPQU2NJhy6XOXx8I+5L82rlNSmmdT21l1c
         IOYq8ggVaZTOJBj7D140CRwfzMNGYOsNyKs5UMS7aAmozHfOiQia19JeHJ/KrOwFbe+L
         c69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RsnUjT2+lUd00F759XigVRFI1hNrAY0fPM7J0dBz5Ak=;
        b=H3df5lAAQfUQzKwuDt3c/lDHKKY0+3rXH0QuRDB2BSY4lbi9zxcs4E4QJqH6ewQS/m
         Mj0ZuWDxPbnFEJdm0OwwoTOHU1t/vN+szOcrofwDLuTV75V8x7/BvNeNl7xZy+F/y1ch
         ncwj3WOkWZjmRAucxZ+0njUY9f7QGddRXju9voPg91pe4M1eZg9ZhMrPy8aQdiVJNcSn
         77veR/3mp46/NMe0GH2RkhV0HCT1QUZ/LwISn/U91OcJWqvb8fnX9WccSzWGrmBga+i+
         sFbnbP1+g8WbiAZS1pKfcVwvJXTAdx//YfwtugqAYF+V+B8va78rCi101E3/058O57AS
         FcLw==
X-Gm-Message-State: AOAM531/QOWS/VuUEkH/appk8y3ZWkA/hOSM25nPTacb35Jpql4tfDrG
	eYHBUG0xPf5ln/aFMTGWpao2jnmSguxmOiUvlzx+kLC26Lk=
X-Google-Smtp-Source: ABdhPJx5QMGl5O2ZTDIzcGZe6FnwUGR+4uvnqa4pSiPXomY+JNiWgpEPk42WblCceXMK5OcHIFzFWnYGwEYWTLFo/a4=
X-Received: by 2002:a63:ef58:: with SMTP id c24mr14002991pgk.299.1630969529846;
 Mon, 06 Sep 2021 16:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210906010106.898-1-phil@philpotter.co.uk> <20210906010106.898-3-phil@philpotter.co.uk>
 <20210906082535.GK1957@kadam>
In-Reply-To: <20210906082535.GK1957@kadam>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 7 Sep 2021 00:05:18 +0100
Message-ID: <CAA=Fs0mxo5Ty9RfrWBuq53ycaay5xuw9_wk=Z11J18gpeGnW7g@mail.gmail.com>
Subject: Re: [PATCH 02/14] staging: r8188eu: remove hal_reset_security_engine
 from struct hal_ops
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Michael Straube <straube.linux@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Sept 2021 at 09:26, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Sep 06, 2021 at 02:00:54AM +0100, Phillip Potter wrote:
> > Remove hal_reset_security_engine function pointer from struct hal_ops,
> > as it is unused.
> >
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >  drivers/staging/r8188eu/include/hal_intf.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
> > index 5612274dea4d..3cbe6c277677 100644
> > --- a/drivers/staging/r8188eu/include/hal_intf.h
> > +++ b/drivers/staging/r8188eu/include/hal_intf.h
> > @@ -250,7 +250,6 @@ struct hal_ops {
> >                                 u32 bndy_cnt);
> >
> >       void (*hal_notch_filter)(struct adapter *adapter, bool enable);
> > -     void (*hal_reset_security_engine)(struct adapter *adapter);
> >       c2h_id_filter c2h_id_filter_ccx;
> >  };
>
> I love these patchsets which are removing the HAL layer, but it would
> be better if you folded patches 1 and 2 together because it would be
> easier to review.  That way we can just say "Well, if this patch isn't
> correct it will cause a compile error so let's assume it's correct
> unless the kbuild-bot complains."
>
> There are other pairs in this patchset which are the same way where they
> would be easier to review if they were merged. 3 & 4.  5 & 6.  Etc.
>
> The patcheset is fine but for future reference please fold them together.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> regards,
> dan carpenter
>

Dear Dan,

Thank you for the review, much appreciated. I will endeavour to do
this in future.

Regards,
Phil
