Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A343E70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 07:51:38 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id l1so1205331edr.11
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OviwxmQXhJdo0TloNvGVegugc9cROp3g9iBnuBkT8bE=;
        b=d6tocUcKm9pxZrf2i3DUgWZhK0a7b0w7sMiUQFZ0c+0rC1c4k2WU8dN6Vfpr490v9A
         IjbVlcw/aKsjPigaK9dLLKJEyT6vy6AH/oGxKvGRaJYBOyVpNHEL/dT2Ws+rfqQuDrCT
         ApGvbR9E4lbM5dE4F+igOaOLZ/MpReJfDLbtIWjnR1Y2HRRQKkQt3/IHqDr2d4D20fhR
         yqz7Y4J22jfuwhJ/Q8j5DYdFcyX76fvs37mOunvYEGFoZApmp+tPSoi/9Qb3EJWhqIIG
         xHdLalO1v6n1ICe3EhF4/PocgD4hKqcAHnbV4jFqyH2QzrwBf4VuqtGJWlHgrj/pWPkI
         RyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OviwxmQXhJdo0TloNvGVegugc9cROp3g9iBnuBkT8bE=;
        b=k8pdeehN9GXhT/YQcimLEqUZ0/UXxuHLFZ8/eRTJTwtFYshx3vpKB0HyFSYI546Bb5
         ZnLhq3vAy+28+hD84+5RImS2naysBlqHtO7JW1Wd55m7qu7VFUDD4+RWuIcrt11nzuKA
         cOkf8TYwHsPQ2qHHlQNm5kDDGm6a2RCiCcIBIFzWLbOj3xJaeI/IDSeahvKvhlomD0fv
         j6O0a3RgSrMbE/BejMRq72rwmmr21mqy/zPJlPY1e1UwMyEJnfjbujbzIvJnD7dCcGQI
         BfaQuTG8nTruUVYRUROkvrStrtoqtb81w9wgqEHMD4/dsLvWYHP613G5SQkPMPJstxze
         vfHw==
X-Gm-Message-State: AOAM530SSTnW2Ase0/0DtIsEOCqyh5AHXV3dQpGRwLuSQx1QnaRXwCuR
	8Y+G0r6chY19sqzbO3YF6+I=
X-Google-Smtp-Source: ABdhPJyzHMCIX7uNIYHsYLT7QeR+KYXwZDlY7DRyPamhotr/8BW1nhXIHdg9mMwK1x3OmcUYxkj0zw==
X-Received: by 2002:a05:6402:d54:: with SMTP id ec20mr48237987edb.41.1626853897163;
        Wed, 21 Jul 2021 00:51:37 -0700 (PDT)
Received: from agape.jhs ([5.171.80.208])
        by smtp.gmail.com with ESMTPSA id c28sm7979632ejc.102.2021.07.21.00.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 00:51:36 -0700 (PDT)
Date: Wed, 21 Jul 2021 09:51:34 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Larry.Finger@lwfinger.net
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
Message-ID: <20210721075133.GB1415@agape.jhs>
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
 <20210720090035.GB1406@agape.jhs>
 <YPdUM2Gi+tPKoJII@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPdUM2Gi+tPKoJII@equinox>
User-Agent: Mutt/1.10.1 (2018-07-13)

Dear Phillip,

On Tue, Jul 20, 2021 at 11:54:43PM +0100, Phillip Potter wrote:
> On Tue, Jul 20, 2021 at 11:00:36AM +0200, Fabio Aiuto wrote:
> > Hi all,
> > 
> > On Mon, Jul 19, 2021 at 06:46:16PM -0500, Larry Finger wrote:
> > > On 7/19/21 5:46 PM, Phillip Potter wrote:
> > > > Move all C source files from the core subdirectory to the root
> > > > folder of the driver, and adjust Makefile accordingly. The ultmate
> > > > goal is to remove hal layer and fold its functionalty into the main
> > > > sources. At this point, the distinction between hal and core will be
> > > > meaningless, so this is the first step towards simplifying the file
> > > > layout.
> > > > 
> > > > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > > > ---
> > > >   drivers/staging/rtl8188eu/Makefile            | 34 +++++++++----------
> > > >   drivers/staging/rtl8188eu/{core => }/rtw_ap.c |  0
> > > >   .../staging/rtl8188eu/{core => }/rtw_cmd.c    |  0
> > > >   .../staging/rtl8188eu/{core => }/rtw_efuse.c  |  0
> > > >   .../rtl8188eu/{core => }/rtw_ieee80211.c      |  0
> > > >   .../rtl8188eu/{core => }/rtw_ioctl_set.c      |  0
> > > >   .../staging/rtl8188eu/{core => }/rtw_iol.c    |  0
> >  > 
> > > 
> > > I think this is just source churning. The current setup with include. core.
> > > hal and os_dep subdirectories are not opressive.
> > > 
> > > Larry
> > > 
> > > 
> > 
> > maybe the information we will need one day is:
> > 
> > will the core/-os_dep/-hal/-include/-directory-structure be
> > welcomed in mainline wireless subsystem, when an rtl* driver
> > will be perfectly tuned?
> > 
> > At the moment I can't see such a directory organization
> > in any of the realtek wireless driver.
> > 
> > Sure there's time for that ;),
> > 
> > Thank you,
> > 
> > fabio
> > 
> > 
> Dear Fabio,
> 
> Certainly a good start is removing this 'hal' layer so for now I'll
> focus on that as much as I can. Perhaps the path forwards will become
> clearer without it there :-) Thank you for your feedback.

Agreed

> 
> Regards,
> Phil

thank you,

fabio
