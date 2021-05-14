Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DB71
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 15:12:22 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so1813660pjb.2
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ord6fAEI5pa3vLbCAlTEL5Ixb9JiPvq2Xdqyi33y9BI=;
        b=M/sHzds9a8295wb+vFFMV/JUqeIeU+vUJS1sX4FZqx4DzvwwhQ33d1zi+htfC8NCNF
         SpnU6vs7wc0Lib+RMVXDsvOOcqPPSCIKSa8dvQ51vbMmHcRvMnf3zxMYiDNWncBSDCrC
         gDbEqu2GU6WKGM8cBv7Kb9bDoeSjggxzOjldr38mqn9u1bmnFCqdJISQT7TPkfHHSSwF
         kMBqUZkyLsyRywNb7PDwGD57V+0/SYijvWKpaPvD1VKbVyTJlPqo+19RLktqM1lVvVMs
         nHuOgsQoBW9XC+iEWpmOQuvyZ8h+PK0eGDPacAZTgNcBetPPsXCPxcZgG6+lXA7mnPcE
         3K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ord6fAEI5pa3vLbCAlTEL5Ixb9JiPvq2Xdqyi33y9BI=;
        b=Sv36oDPAIUyxPl2biuCgd0qg5rpRXudq2ObdvicvdRheOVIi+bOQ/+UHDImUehSi1V
         YHZqOMsnY6vvQQiiOMiaeOnpO2j4MEfYq3UvIQBDUmoV3RiPZ1aGwfrpMOmhsc8HdRpO
         P7nt9MqJ3jKfe8MlErHGzcXj3C84n3c7HonYLJcvgbcNHXPe3khpoxJsduxxkSZkybsd
         oydT96C6xN0qsemph6qaclRtQIyt4rhT5yaZmqJc7E07PDbpymwNqWXcR096rYjGyc/S
         82ra2NTej478BZZNzGAHtIxoDALWXEmNyGOPa8iZKmv8+vN9sX93q5WMDZTKmtF/bFbA
         bT5g==
X-Gm-Message-State: AOAM532c0QFCDLPFg+LiL+5R/VHJe+YgnE78KIY1T9IMHazUqIlDC44j
	tkgCatlPnudSqwsel+lH5ROqT/8huKQfi+qH
X-Google-Smtp-Source: ABdhPJyWlZKIT6VersxrGK0t+xRw+CdJKziO3ciPN0f1GkGTrAmwmxwmfO9DkCNLLx05FOdUqOi9cA==
X-Received: by 2002:a17:902:e804:b029:ed:5748:9047 with SMTP id u4-20020a170902e804b02900ed57489047mr46158767plg.36.1621005142477;
        Fri, 14 May 2021 08:12:22 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.gmail.com with ESMTPSA id f14sm7624439pjj.53.2021.05.14.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 08:12:21 -0700 (PDT)
Date: Fri, 14 May 2021 20:42:16 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Message-ID: <YJ6TUAowTI75h/sl@fedora>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com>
 <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com>
 <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ6Jf+Z1ReVgDt64@kroah.com>

On Fri, May 14, 2021 at 04:30:23PM +0200, Greg KH wrote:
> On Fri, May 14, 2021 at 07:53:57PM +0530, Shreyansh Chouhan wrote:
> > On Fri, May 14, 2021 at 04:05:32PM +0200, Greg KH wrote:
> > > On Fri, May 14, 2021 at 07:18:38PM +0530, Shreyansh Chouhan wrote:
> > > > On Fri, May 14, 2021 at 03:36:25PM +0200, Greg KH wrote:
> > > > > On Fri, May 14, 2021 at 07:00:39PM +0530, Shreyansh Chouhan wrote:
> > > > > > The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
> > > > > > multiline macro whose statements were not enclosed in a do while
> > > > > > loop.
> > > > > >
> > > > > > This patch adds a do while loop around the statements of the said
> > > > > > macro.
> > > > > >
> > > > > > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/greybus/loopback.c | 10 ++++++----
> > > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > > > > index 2471448ba42a..c88ef3e894fa 100644
> > > > > > --- a/drivers/staging/greybus/loopback.c
> > > > > > +++ b/drivers/staging/greybus/loopback.c
> > > > > > @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > > > > >  }									\
> > > > > >  static DEVICE_ATTR_RO(name##_avg)
> > > > > >
> > > > > > -#define gb_loopback_stats_attrs(field)				\
> > > > > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > > > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > > > > -	gb_loopback_ro_avg_attr(field)
> > > > > > +#define gb_loopback_stats_attrs(field)					\
> > > > > > +	do {								\
> > > > > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > > > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > > > > +		gb_loopback_ro_avg_attr(field);				\
> > > > > > +	} while (0)
> > > > > >
> > > > > >  #define gb_loopback_attr(field, type)					\
> > > > > >  static ssize_t field##_show(struct device *dev,				\
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > > > >
> > > > >
> > > > > Did you test build this change?
> > > >
> > > > I built the module using make -C . M=drivers/staging/greybus to test
> > > > build it. I didn't get any errors.
> > >
> > > Really?  Can you provide the full build output for this file with your
> > > change?  I don't think you really built this file for the obvious
> > > reasons...
> >
> > I ran make -C . M=drivers/staging/greybus
> >
> > I got a three line output saying:
> > make: Entering directory '/work/linux'
> >   MODPOST drivers/staging/greybus//Module.symvers
> > make: Leaving directory '/work/linux'
> >
> > I just tried rebuilding the kernel with CONFIG_GREYBUS=m, and now I can
> > see what you are talking about. Why weren't these errors reported when I
> > ran the previous make command? Does that too check for the config
> > variables even when I specifically asked it to build a module?
>
> You were just asking it to build a subdirectory, not a specific
> individual file, and when you do that it looks at the configuration
> settings.
>

I see.

> It's always good to ensure that you actually build the files you modify
> before sending patches out.

Sorry, I googled about building a single module, and thought running
that command would have built it. Moreover, since the change was so
simple I didn't suspect anything when it got built correctly the first
time around.

I didn't look at how/where was the macro called and missed a very
obvious error. Now that I have looked at it, the only way I can think of
fixing this is changing the macro to a (inline?) function. Will
that be a desirable change?

And yes, I will definitely be more careful in the future.

>
> thanks,
>
> greg k-h
