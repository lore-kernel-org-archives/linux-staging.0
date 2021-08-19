Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B972
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 10:16:06 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u3so11839681ejz.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OObiD9tfxs+s0iJrcszx/14HnrEBww2v71TAAgjIBnY=;
        b=fbehOLG3kvr6qqkot/u6Oufc9xBr2WwKQBpnfDVd5gxR8ORjn65b1Gqp5D70M2QZzB
         h9uh8M5WI5+3QrbtBjb1WGeSj0EMKzHNyx4dh4AnvdmKicPclg7wXUXOQrfWmKt5iqva
         ghmf8o4qzk15CBvOS4mJVGc+g0bcqyH2rd4xL3epMqsZm/CPYbAk9l09ORkJ8NJBdpmy
         20pd8UJSyxTs12vYtfqAOcfPQKtBhSf9bAiz/E99zqf6FA/qgiLDCvbro4YPhx7IBBiw
         z2PlwC18ub9u7XUjGR/0iXCqgaPWcRzaeQeeiBMVxCJyZ8WoADYMxSQxj6+1pG+lT9Wo
         /FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OObiD9tfxs+s0iJrcszx/14HnrEBww2v71TAAgjIBnY=;
        b=dzVk8dUPfm5YjAHCVvaVixst2GUTe3x42axH5HxX0QICZNikRV5LKJhwcvaEBm9OSK
         zIPhX+19x47hRJf/SZQYr9OOurw1lTtkFoiWCz1E6mfbOGJrLMsX7xa9ON/rJqi8+zyp
         DZVKCI5OXPEZDZyzuBj1IwS+x51Q12hIUIvOC7w6SLtJIa0XqBm12ExgdailRPFrOkpa
         OELdoWmUFN5eUWafybK5pWMYfQpU8RT+wXmDmV8OYR/p5ctBzTH4RTIufu3yP2/uuWeM
         Uc4EKl6IvpgaoTixImMUE7lu13zO7b6p5R7j6tlOsOUmbzYiEYrETOTabvtTv8cdxIbr
         a6Vg==
X-Gm-Message-State: AOAM530tQ1qOmET4qagbvrOz353MoOtzFIN9LXXO19CE/zOyau6/+KHv
	q51X35nFxg+CWnuBV4NhQ8U=
X-Google-Smtp-Source: ABdhPJwqFE3r/g7wpG5lgxYD34pDQhp9o+vfOXzd8BR7z69QZ8n26RhlItY/M+EBM4ObnLuO4p/2Hw==
X-Received: by 2002:a17:907:3f14:: with SMTP id hq20mr14847440ejc.370.1629368165250;
        Thu, 19 Aug 2021 03:16:05 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id br16sm1068789ejb.34.2021.08.19.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 03:16:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Thu, 19 Aug 2021 12:16:03 +0200
Message-ID: <2072985.qfodHclbUl@localhost.localdomain>
In-Reply-To: <4394431.3q0Da8apZE@localhost.localdomain>
References: <20210819060837.23983-1-fmdefrancesco@gmail.com> <YR36fT6bpiVoo2lM@kroah.com> <4394431.3q0Da8apZE@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 9:07:20 AM CEST Fabio M. De Francesco wrote:
> On Thursday, August 19, 2021 8:30:21 AM CEST Greg Kroah-Hartman wrote:
> > On Thu, Aug 19, 2021 at 08:08:37AM +0200, Fabio M. De Francesco wrote:
> > > Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> > > unnecessary wrappers, respectively to mutex_lock_interruptible and to
> > > mutex_unlock(). They also have an odd interface that takes an unused
> > > second parameter "unsigned long *pirqL".
> > > 
> > > Use directly the in-kernel API; check and manage the return value of
> > > mutex_lock_interruptible().
> > > 
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > >  drivers/staging/r8188eu/core/rtw_mlme_ext.c     |  5 +++--
> > >  drivers/staging/r8188eu/hal/usb_ops_linux.c     |  7 +++++--
> > >  drivers/staging/r8188eu/include/osdep_service.h | 13 -------------
> > >  drivers/staging/r8188eu/os_dep/os_intfs.c       |  5 +++--
> > >  4 files changed, 11 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > > index f6ee72d5af09..484083468ebb 100644
> > > --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > > +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> > > @@ -4358,7 +4358,8 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
> > >  	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
> > >  		return -1;
> > >  
> > > -	_enter_critical_mutex(&pxmitpriv->ack_tx_mutex, NULL);
> > > +	if (mutex_lock_interruptible(&pxmitpriv->ack_tx_mutex))
> > > +		return -EINTR;
> > 
> > But the code never would return this value if the lock function returned
> > an error.  Why do that here now?

Ah, now I think I understand what you asked me ... sorry for not having 
immediately grasped the meaning of your objection. :(

I guess you wanted to know why I decided to check and handle the 
return values of mutex_lock_interruptible (), as the original code didn't. 
Did I understand the correct meaning of your question?

If so, now I can explain why I did it ...

A few months ago I did the conversion of the visorhba (Unisys) driver from 
IDR to XArray. Since the old code did not check IDR API return values, I had 
decided not to check for XArray API return values as well.

Then Dan C. asked me to implement the checks that were missing in the 
original code. So, today I decided to implement them before I was asked 
to do it. Now it's clear that in this case they are not needed.

That's all. :-)

I'm about to send a v2 without those unnecessary checks.

Thanks,

Fabio

> I read from the documentation that "[mutex_lock_interruptible()] Return: 0 if 
> the lock was successfully acquired or -EINTR if a signal arrived.". 
> 
> After reading that, I thought that if I got -EINTR I should return it. Shouldn't I?
> 
> Now I've just checked its usage pattern in another file where we have exactly 12
> times the same management of the error (the example I'm talking about is in
> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c):
> 
> "if (mutex_lock_interruptible(&instance->vchiq_mutex))
>                 return -EINTR;".
> 
> Unless you mean that I should return the "ret" variable, which is already set to 
> "_FAIL", I am really confused. Please, can you further elaborate what I'm doing 
> wrong?
> 
> Thanks,
> 
> Fabio



