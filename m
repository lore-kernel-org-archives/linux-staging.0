Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D963481
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 13:48:03 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d1so7079891pll.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YxDl0EJtEuevrE5fofbeNq+CYZb2RNB0hzvmFi+D3+8=;
        b=VVYQWyDfexTZ8+hbjdrXcso8HsN0LxWI8d3EnEupkmGdjIekJNRNOUnHbFvjHQDSTL
         sZoJ3mohHFdq5D2OsrU4VkIxYb/jwD1NqYsCFKcuiaJsDikdI1VcNWref2GZYaczSIcC
         NOTsJIA8uiNJpcfNMMN1iXroctoHxObztJZabghMQl6xFYmo4Qlzughg4rtXT18uK6KM
         d0aPBsBM8+KsN368qpHnjjYYnNTZzox1aN8Q6rLKlpCpYG9RgA0oDbQHV+KErlpqWAk+
         IA20Mz8OUyk7fSs7EtQl+Hi52so/NY/jNIRcLNuRaTqXyR5Xofhh3dpX1NReIcRUQG2i
         JcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YxDl0EJtEuevrE5fofbeNq+CYZb2RNB0hzvmFi+D3+8=;
        b=lKuYXT3aiyFxLqujGmCyaeqMWy3c1UOr7CUsgXbXZGP4rgYeKQ9vG4BF4ew/xiXRWd
         /QBeHA/+aELrDuCbnqmsXPG9PjRCi06dTCep8XDJj712ZREADY9g2r/lqDUoXqGMymoX
         nnFsL1+HeSCeA/V2Ya0RI/c55GoyQpCJPveWQ5ZtHa8r0b7lDPfhN6lmC1Q2fG+YVJPc
         fEa8Rt7S54NeJBjRDNKN9aB/LEE+o2gHKUuKgv+KTAdqZcisY6X8eYRHl0qP6pPpBZpC
         TPNc4By27+WfKkFj1kflP+A9/oknOKSwy5vn7oMwDkXK4meTvhpMG14bDAQFCPQmxJBb
         Z4BQ==
X-Gm-Message-State: AOAM530Qxxe6Uwu9JlW6PLKwr50UjDzVKueHu/khpaWfgmbie63WrVip
	1V1wsDAVI19RKLsfLSycCqQ=
X-Google-Smtp-Source: ABdhPJwehJhh8ZtlX4s5039UfLl8M70E/Prup4jVkYNGctW420GGbrH/QI/TZ7Pczmv/94fnJzaTHg==
X-Received: by 2002:a17:90a:b893:: with SMTP id o19mr5325862pjr.114.1627566483247;
        Thu, 29 Jul 2021 06:48:03 -0700 (PDT)
Received: from ojas ([122.161.51.5])
        by smtp.gmail.com with ESMTPSA id f3sm3887725pfe.123.2021.07.29.06.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 06:48:02 -0700 (PDT)
Date: Thu, 29 Jul 2021 19:17:52 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, nsaenz@kernel.org,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vchiq: Add details to $CONFIG_VCHIQ_CDEV
 help text
Message-ID: <20210729134739.GA19228@ojas>
References: <cover.1627495116.git.ojaswin98@gmail.com>
 <9c9c128b41e31d6bebe646e052aa05c44b19eb83.1627495116.git.ojaswin98@gmail.com>
 <YQGmG6nwk+pOyAdu@kroah.com>
 <20210728200039.GA17046@ojas>
 <fa20cb94-ed73-ea6e-d128-cfb930399af6@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa20cb94-ed73-ea6e-d128-cfb930399af6@i2se.com>

On Wed, Jul 28, 2021 at 10:39:38PM +0200, Stefan Wahren wrote:
> Am 28.07.21 um 22:00 schrieb Ojaswin Mujoo:
> > On Wed, Jul 28, 2021 at 08:46:51PM +0200, Greg KH wrote:
> >> On Thu, Jul 29, 2021 at 12:07:17AM +0530, Ojaswin Mujoo wrote:
> >>> Add some details to the Kconfig definition of $CONFIG_VCHIQ_CDEV to help
> >>> make the motive behind it a bit more clear.
> >>>
> >>> Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> >>> ---
> >>>  drivers/staging/vc04_services/Kconfig | 8 ++++++--
> >>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> >>> index 2b70c37cdd09..cb02d8a4cb74 100644
> >>> --- a/drivers/staging/vc04_services/Kconfig
> >>> +++ b/drivers/staging/vc04_services/Kconfig
> >>> @@ -25,8 +25,12 @@ config VCHIQ_CDEV
> >>>  	bool "VCHIQ Character Driver"
> >>>  	default y
> >>>  	help
> >>> -		Enable the creation of VCHIQ character driver to help
> >>> -		communicate with the Videocore platform.
> >>> +		Enable the creation of VCHIQ character driver to help communicate
> >>> +		with the VideoCore platform. The cdev exposes ioctls used by
> >>> +		userspace libraries and testing tools to interact with VideoCore.
> >>> +		This can be set to 'N' if the VideoCore communication is not needed
> >>> +		by userspace but only by other kernel modules (like bcm2835-audio).
> >>> +		If not sure, set this to 'Y'.
> >> I still do not understand if I need this driver or not, and I have this
> >> hardware!  What functionality does this driver accomplish?  What is
> >> VideoCore?
> > Hey Greg,
> >
> > I believe I can add this under the CONFIG_BCM2835_VCHIQ config option,
> > as that enables the core driver that implements the functions to
> > communicate with VideoCore platform? 
> 
> Sorry, today i'm too tired to give a good explanation. VideoCore is the
> VPU inside the BCM283x SoC. It runs a firmware and VCHIQ provides a way
> to communicate with this firmware / VPU. The VCHIQ driver is required to
> get access to the audio jack and camera interface (see depending drivers).
> 
> Unfortunately i don't have an application list by the hand which uses
> the CDEV interface for VCHIQ, please use this link [1] as a starting point.
> 
> [1] - https://github.com/raspberrypi/userland
> 
Hi Stefan

Thanks for the brief, its good enough to help me get started. I've also
been looking more closely into this driver in my free time lately and I
can try to come up with a small summary to use as the help text. I'll
add it in v2 of this patch.

Regards,
Ojaswin
> >
> > This config option merely adds a cdev which exposes the the core
> > driver's functionality to userspace. 
> >
> > Regards,
> > Ojaswin
> >> thanks,
> >>
> >> greg k-h
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
