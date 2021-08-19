Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FF2FAE
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 07:07:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id bt14so10733431ejb.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 00:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e4OwX74q04U3Z64KJiTep2sFvtc+gcgTGZYkPI+IqrI=;
        b=XYpAm1TDfcahj17G3zDPV13rG/lwi0wRw+zNG6iNmaZaEJmnTxw/YN63HmdUIeXWe+
         memsdOb1/I1LbtuYTGoBiBMc5G3eex6PVOs5kO0BlIumEKc5WgxJ8jwcRJzxWDP9Gkxz
         WuCu3cWHGiIG8dAl6J8++KiNQQbuZpLfMkUPx4VhcN+vYoYkGsKyPT8tgm7vY8a8fnOj
         s7mAL4er5lSfmWwf8Z6VVdhKAPL7Ag/zgPzBVw3Sa3w9JjEszWg6iuupLX2UhUDz5uHb
         dsAlt8TcbzmdpAp2RqN7ciGAZXd4FteNI3Cm81NoUyxVoGEB1BZj3bfB6odTkUqjFsoy
         bNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e4OwX74q04U3Z64KJiTep2sFvtc+gcgTGZYkPI+IqrI=;
        b=isnD+UeOB1E3HAqBQveGwhW2aT4xBkvwby5pikHw/cjialUw1ilPEaE7rqqzPrHRMF
         AXUpdaHyJ7AYZ+i/6O+dPCtW3D+qlB+wtQ0KAVkZZ4UbqRr6vzLlIu+Y43gCsh4al3K3
         9qUcYNakbJrCMpxUGyaPlkb9rDdkPIdr/LA1ZNPL5Ggoq/Wo5c9BQ70gV14/EAVqMYME
         qvARhUZk+wpAC/TE2M/bOU/NBRkn+VUaqdT0TlqunFahemWEGj9QpRaesY8OMgT2toou
         SIHIEx9/usFVNAW83zVx7FPxm2pUWJBIGNhL2HoLed+h1v3ae54FGqnHBSgFdRsLtJc/
         BvFA==
X-Gm-Message-State: AOAM530dvbQC4VTyTvr1ZYIp4m4k0QIoX5Q7baK8iAFlpHZUlXw49CWY
	2vWhO00CpVhVZYfC+zXvL1M=
X-Google-Smtp-Source: ABdhPJxKHzB2gzrDkRztDR+AfUQswsotL6A7IMyAynCQCLHUaNAbpJT1CIhl3DrYABQYItou95nZJw==
X-Received: by 2002:a17:906:779a:: with SMTP id s26mr14364159ejm.106.1629356842416;
        Thu, 19 Aug 2021 00:07:22 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id q6sm826752ejm.106.2021.08.19.00.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 00:07:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Thu, 19 Aug 2021 09:07:20 +0200
Message-ID: <4394431.3q0Da8apZE@localhost.localdomain>
In-Reply-To: <YR36fT6bpiVoo2lM@kroah.com>
References: <20210819060837.23983-1-fmdefrancesco@gmail.com> <YR36fT6bpiVoo2lM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 8:30:21 AM CEST Greg Kroah-Hartman wrote:
> On Thu, Aug 19, 2021 at 08:08:37AM +0200, Fabio M. De Francesco wrote:
> > Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> > unnecessary wrappers, respectively to mutex_lock_interruptible and to
> > mutex_unlock(). They also have an odd interface that takes an unused
> > second parameter "unsigned long *pirqL".
> > 
> > Use directly the in-kernel API; check and manage the return value of
> > mutex_lock_interruptible().
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_mlme_ext.c     |  5 +++--
> >  drivers/staging/r8188eu/hal/usb_ops_linux.c     |  7 +++++--
> >  drivers/staging/r8188eu/include/osdep_service.h | 13 -------------
> >  drivers/staging/r8188eu/os_dep/os_intfs.c       |  5 +++--
> >  4 files changed, 11 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > index f6ee72d5af09..484083468ebb 100644
> > --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > @@ -4358,7 +4358,8 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
> >  	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
> >  		return -1;
> >  
> > -	_enter_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
> > +	if (mutex_lock_interruptible(&pxmitpriv->ack_tx_mutex))
> > +		return -EINTR;
> 
> But the code never would return this value if the lock function returned
> an error.  Why do that here now?

I read from the documentation that "[mutex_lock_interruptible()] Return: 0 if 
the lock was successfully acquired or -EINTR if a signal arrived.". 

After reading that, I thought that if I got -EINTR I should return it. Shouldn't I?

Now I've just checked its usage pattern in another file where we have exactly 12
times the same management of the error (the example I'm talking about is in
drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c):

"if (mutex_lock_interruptible(&instance->vchiq_mutex))
                return -EINTR;".

Unless you mean that I should return the "ret" variable, which is already set to 
"_FAIL", I am really confused. Please, can you further elaborate what I'm doing 
wrong?

Thanks,

Fabio



 
  
> 
> thanks,
> 
> greg k-h
> 




