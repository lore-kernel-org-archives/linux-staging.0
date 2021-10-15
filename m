Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CC2C82
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 17:47:29 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id i12so27745731wrb.7
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BK7npsUFAIp6FKMHAOrHdT/9NsQ/1+JS0jeDwR1u3YU=;
        b=1s4jH8l+/YtfwuznlhoYBXPwIBYapddXopzH4JdXmJWWljTmJrTxqf4CuFIY5nOUcU
         wik4dZ1HoOUZmZOSRS4AovDuSbh9h0N0OXq/q4S9+eUBhRmNHnkrxiAXJqzVhUXRD7t5
         cHBp7uLugfWpaWj7i0TUeTp3kkE87fqnsxB820wW3G4S6Ns30YeDiPyerXQTFas+yaGs
         WUsPVfnH2B4QfKuNHVUIIpqFZJvXd41l31kHsPqoHH/5jTKFAq4mQ0d8RZ6Z6Q3YqtSR
         AOHxd25dp40zKL7y9AeAZfPSvsgNG6mIqUtI1p1mpaiPLDzduMf6SMaM9nzPKJP0G5J0
         xhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BK7npsUFAIp6FKMHAOrHdT/9NsQ/1+JS0jeDwR1u3YU=;
        b=i7VOOGjqda7ZHZn6oEbhvVX1ZBLTha8oOsBhYrl6n14rANwJohmJqxPjd0sZ9wojiF
         DCA1frpTvOrHRW4AaZTencFqbxc/3Hq5rgwm/H1NXzuZOQfeN/YDTT7zBOuKL3o+gcRz
         lEn25vNlljDL//g2zZjKEPVEVUJqgduvS9QpvKVd6cEhVj/Tx4hn1DODDfKvAj1JXwwX
         dMWue3ihZRwsvrTJKDrL0FgDhMDYX9oyk5FBGTddVsPNGXMfTb3iw2eDSxfTfDuE6u5M
         nALwHrxy/03ppj0SE0FfGGeXFgH/D3q2VOg5HAQZStO/J0R5yVtEUq9YFtnIX+aIZDsa
         Ns2g==
X-Gm-Message-State: AOAM532SEH8UYAfxPKGeEYlrCkVXBSxqErIC3n965OLJzY2kcM3AfMnT
	jsMEpYrw80ethfEhwHBztJhAlpC3ImtWpA==
X-Google-Smtp-Source: ABdhPJw3D/2ovofi7SdVKSgyw3JUGeq1FSg0F9N93MOkgDpgR8PSlenC68jwceDCTTzy7C2dJ1A+GA==
X-Received: by 2002:a5d:4344:: with SMTP id u4mr16382641wrr.106.1634320048313;
        Fri, 15 Oct 2021 10:47:28 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id l13sm5446539wrn.79.2021.10.15.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:47:27 -0700 (PDT)
Date: Fri, 15 Oct 2021 18:47:26 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Martin Kaiser <lists@kaiser.cx>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove MSG_88E calls from
 hal/usb_halinit.c
Message-ID: <YWm+rug27J7fGSEI@equinox>
References: <20211015000233.842-1-phil@philpotter.co.uk>
 <20211015083211.ngbgtmhkh3lh5kzj@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015083211.ngbgtmhkh3lh5kzj@viti.kaiser.cx>

On Fri, Oct 15, 2021 at 10:32:11AM +0200, Martin Kaiser wrote:
> Thus wrote Phillip Potter (phil@philpotter.co.uk):
> 
> > Remove both MSG_88E calls from hal/usb_halinit.c, as these calls serve
> > no purpose other than to print the name of the function they are in
> > (_ReadAdapterInfo8188EU) on entry and on exit, with a timing of the
> > function, which is better accomplished by other means. Also remove
> > the jiffies assignment at the start of the function, as it is no
> > longer used.
> 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >  drivers/staging/r8188eu/hal/usb_halinit.c | 6 ------
> >  1 file changed, 6 deletions(-)
> 
> > diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> > index f6db5b05e6e7..abbd107ad3c1 100644
> > --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> > +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> > @@ -1073,15 +1073,9 @@ static void _ReadRFType(struct adapter *Adapter)
> 
> >  static int _ReadAdapterInfo8188EU(struct adapter *Adapter)
> >  {
> > -	u32 start = jiffies;
> > -
> > -	MSG_88E("====> %s\n", __func__);
> > -
> >  	_ReadRFType(Adapter);/* rf_chip -> _InitRFType() */
> >  	_ReadPROMContent(Adapter);
> 
> > -	MSG_88E("<==== %s in %d ms\n", __func__, rtw_get_passing_time_ms(start));
> > -
> >  	return _SUCCESS;
> >  }
> 
> Makes sense to me. We should get rid of the prints that show only the
> function name.
> 
> Acked-by: Martin Kaiser <martin@kaiser.cx>

Dear Martin,

Many thanks for the Acked-by :-)

Regards,
Phil
