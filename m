Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B070
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 20:00:49 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id a20so4120409plm.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 13:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TJBawUD1aFfD+dzRqdwJ1MPEWpORtq7Fvvwh0fqmN4w=;
        b=U5xnZ2ApxaMWnn7gJYnJAR8u59w7nGyYjuMteJJ5vh2utJ4V+34Hki0luScN94y1q5
         NY7LJKxP0vdSs/BkhP4DvbU7p6TW8iGGLqYrsAgsXtFXw3z4kD6jfWlLcSNJq1dwldXH
         csVkvbMVSaBdzCzmn4y28pFJJ6R7MAveCAHYupzmC5jABC4uID9rD1tNvWsHFP6EuitP
         zz9zn2HchfkHh/FwP/LwNVEERNucc53wq7+yJRc3x98OP4+PY9iNN7tyJPbQ/rAj6XF4
         LtutpaEF6eqyZtY0HfbHWNEuwDt0yVaHLSFCpzTkNwcr15QBhOkGoIRO60MThiEhkT1e
         OyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TJBawUD1aFfD+dzRqdwJ1MPEWpORtq7Fvvwh0fqmN4w=;
        b=k7b+Usz9LLcYR7sRL6RjnO0ZhI4MQTcTg4vTHOuoa1AhTG3fMkfAhBSD9fTrWhXdiZ
         Wq4sKpviZXmd2mFy5UeyawZymMvJxVp+Y1ZjIgOzlvhrwWXZ3WOPHHTwmIzCsDUTYyRm
         +IDVtDQ6eYjeXZ1z2R3U2obLt01SSJtmxdKqESc4AOL02YQfbz+g0FAxQTOuQ1xInwbh
         VzxzOZsFhKVy2PTDKHVugjRJiSGQidef3eFcY3d1xJMiGtoHEUea1y91hxsD4kqZ7uTG
         SPA3nK5kdUqP1rrS0o70yXHXNfk+odtNs9OG4/HZbE4xujJCqOBz0Zvyvo0QKPGHl0rJ
         HXQA==
X-Gm-Message-State: AOAM530+yZrcj3uohMzQCBAqB5juZMSvXus5+Sd2cqEwyslUQRRUymtE
	S2eeLAL2u/4I1GuJV/v200U=
X-Google-Smtp-Source: ABdhPJxglSz5HVVd1rwyBjzRsuioP4LKmTyej4fYd6rxpo5LXhgxwUrQNYu6edeKN6oVLP3h57Ocvg==
X-Received: by 2002:a17:90a:7505:: with SMTP id q5mr9437802pjk.64.1627502449011;
        Wed, 28 Jul 2021 13:00:49 -0700 (PDT)
Received: from ojas ([122.161.51.5])
        by smtp.gmail.com with ESMTPSA id b13sm808153pfl.49.2021.07.28.13.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:00:48 -0700 (PDT)
Date: Thu, 29 Jul 2021 01:30:39 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vchiq: Add details to $CONFIG_VCHIQ_CDEV
 help text
Message-ID: <20210728200039.GA17046@ojas>
References: <cover.1627495116.git.ojaswin98@gmail.com>
 <9c9c128b41e31d6bebe646e052aa05c44b19eb83.1627495116.git.ojaswin98@gmail.com>
 <YQGmG6nwk+pOyAdu@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQGmG6nwk+pOyAdu@kroah.com>

On Wed, Jul 28, 2021 at 08:46:51PM +0200, Greg KH wrote:
> On Thu, Jul 29, 2021 at 12:07:17AM +0530, Ojaswin Mujoo wrote:
> > Add some details to the Kconfig definition of $CONFIG_VCHIQ_CDEV to help
> > make the motive behind it a bit more clear.
> > 
> > Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> > ---
> >  drivers/staging/vc04_services/Kconfig | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> > index 2b70c37cdd09..cb02d8a4cb74 100644
> > --- a/drivers/staging/vc04_services/Kconfig
> > +++ b/drivers/staging/vc04_services/Kconfig
> > @@ -25,8 +25,12 @@ config VCHIQ_CDEV
> >  	bool "VCHIQ Character Driver"
> >  	default y
> >  	help
> > -		Enable the creation of VCHIQ character driver to help
> > -		communicate with the Videocore platform.
> > +		Enable the creation of VCHIQ character driver to help communicate
> > +		with the VideoCore platform. The cdev exposes ioctls used by
> > +		userspace libraries and testing tools to interact with VideoCore.
> > +		This can be set to 'N' if the VideoCore communication is not needed
> > +		by userspace but only by other kernel modules (like bcm2835-audio).
> > +		If not sure, set this to 'Y'.
> 
> I still do not understand if I need this driver or not, and I have this
> hardware!  What functionality does this driver accomplish?  What is
> VideoCore?
Hey Greg,

I believe I can add this under the CONFIG_BCM2835_VCHIQ config option,
as that enables the core driver that implements the functions to
communicate with VideoCore platform? 

This config option merely adds a cdev which exposes the the core
driver's functionality to userspace. 

Regards,
Ojaswin
> 
> thanks,
> 
> greg k-h
