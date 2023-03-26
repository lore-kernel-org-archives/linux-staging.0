Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD136A;
	Sun, 26 Mar 2023 06:38:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id q102so5027583pjq.3;
        Sat, 25 Mar 2023 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679812706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpnznd8HIBj/YyF7nBj1pjhAkQmyxPKeuTzOkbCCpVY=;
        b=MnBT6y2yik85UnuTYFGwPL7lzLIfWSQes5d4v/idNXpl9OmxO/y9EmQWgHOpZwmfCu
         T9pIsU/rSwKQn3A7Xprx7EKALM8Xjo+jNcQracBGR+J1KNKzEbKkaHhRu4f9MlDWWqDK
         af96g/Pn17A7VWds2dECE/EnQswIaksYNYFdK/wj7Pezl0RwcwNwgPS03aIA+jHfq3u9
         fYmzFFsXBsrdVXYCzO2TKMQOcallDoftVKKwipsWtaNmQd3Ls8xeNEEudO0tUiTbzBlM
         NcmH1N0qAncy++npDmMZfxmrX6T+iCLSChKoBRdEUb1piPDLSa++vBoL2311ELj+Sfrg
         GEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679812706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpnznd8HIBj/YyF7nBj1pjhAkQmyxPKeuTzOkbCCpVY=;
        b=u87rMRqc6RY2Da8F3pZH5g7ZmSgOv7dY+2Zy1jqcu+amG0+6Lmvn4zgALfbcE/r47T
         ANOrp45ypBkI5Q4HGyEVK99/onWuGGwzuS6dBgkasQ9j0Pup+cgkm/U34AviWQnGPlGE
         rsRd0WP39/0eP7fGd2QPtycR+S8KCV+640Fn77NGRPE9/U5QxgLGWBgntK/2x6GmOL3N
         NHMBpwDODxDLfp0VeQvZ+8gIhZF5vMUJmJqR2uPX7itGDw3BPYIeCD6LOrBLF+/Xewej
         tBe6fht0S7X4l4EbgaGKpKmIdseivOCTflDAESJajSM5y6615yr5S3H3dmE3MzbL6AjQ
         8QiQ==
X-Gm-Message-State: AAQBX9exs3DPoF1giSHrmoy24mpuryK/unT7Y9VADvEnaVlQy3gHvwae
	HBkcMEiN5j7K/P8yXg3WZ1Q=
X-Google-Smtp-Source: AKy350ZQTAKWUVqZbn1jWD7iQjFbevcIgu9cZUcwBEJCkqMtLL4syvXldrH8UlzaHVEFZdXQtqye2A==
X-Received: by 2002:a17:903:228f:b0:1a2:185f:f199 with SMTP id b15-20020a170903228f00b001a2185ff199mr8976293plh.63.1679812705804;
        Sat, 25 Mar 2023 23:38:25 -0700 (PDT)
Received: from sumitra.com ([117.212.89.150])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709028a8600b00194c2f78581sm16847621plo.199.2023.03.25.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 23:38:25 -0700 (PDT)
Date: Sat, 25 Mar 2023 23:38:19 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
Message-ID: <20230326063819.GC179105@sumitra.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
 <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
 <ZB63EVLK6/29UUi0@kroah.com>
 <20230326052420.GA179105@sumitra.com>
 <alpine.DEB.2.22.394.2303260751290.3294@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303260751290.3294@hadrien>

On Sun, Mar 26, 2023 at 07:51:50AM +0200, Julia Lawall wrote:
> 
> 
> On Sat, 25 Mar 2023, Sumitra Sharma wrote:
> 
> > On Sat, Mar 25, 2023 at 09:55:45AM +0100, Greg KH wrote:
> > > On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> > > > Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> > > > inline function, to make the relevant types apparent in the
> > > > definition and to benefit from the type checking performed by
> > > > the compiler at call sites.
> > > >
> > > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/pwm.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> > > > index 3fda172239d2..88da1d796f13 100644
> > > > --- a/drivers/staging/greybus/pwm.c
> > > > +++ b/drivers/staging/greybus/pwm.c
> > > > @@ -21,9 +21,11 @@ struct gb_pwm_chip {
> > > >  	struct pwm_chip		chip;
> > > >  	struct pwm_chip		*pwm;
> > > >  };
> > > > -#define pwm_chip_to_gb_pwm_chip(chip) \
> > > > -	container_of(chip, struct gb_pwm_chip, chip)
> > > >
> > > > +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> > > > +{
> > > > +	return container_of(chip, struct gb_pwm_chip, chip);
> > > > +}
> > > >
> > > >  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
> > > >  {
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > >
> > > This patch didn't apply due to changes made in my tree by a patch from
> > > someone else before yours.  Can you rebase it and resend?
> > >
> >
> > Hi greg,
> >
> > I am confused, will that be a totally new patch or a new version(v4 in
> > this case)?
> 
> New version.
>

Thank you julia.

Regards
Sumitra

> julia
> 
> >
> > Regards,
> >
> > Sumitra
> >
> > > thanks,
> > >
> > > greg k-h
> >
> >
