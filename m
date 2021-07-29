Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D93481
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 14:20:57 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id e5so7151357pld.6
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F1MJS4je1Oiq7mhlbgvshdM+wBGyXHC/8oJzd/GZ1Bg=;
        b=Ow6fkhcPEh5V54oLfWWwMO7N3w8hOXvUHnRCEDo6zEciRgrCaJsWFsAcGnHwmh2vzD
         FPMisuZ3FNXTf1ixYZPueZXd8SlW0Sz5U+WAicNuv3cCxFOuib10hY1RfAbe25NVplGQ
         cFbNTcFvibLllrPwkX1NyOUGsfubqOt4JDVkl6QEMBEexnkifJfcBERFxqsXLxDQlC6C
         sWvxUebaqrJx4zyMhNnHramYFQuvyDG0DUp+CZ8TnJsj2WONURIPg4QNHM4xLMgwjz4d
         aQIxu9xpzTPCVDDZQL0Apsap6Nh+R7+Z0NH4Xj2u0w2G5KRLYVz10F7gqa8OYyYtCME9
         Ig2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F1MJS4je1Oiq7mhlbgvshdM+wBGyXHC/8oJzd/GZ1Bg=;
        b=JQGIgla2gTz3qIrAwD1/ER7q/Sl+COd4g1ChzwBruzQ33x3yimtJl4qf6Oynq1+qKt
         pMbpZcAFDRyhWFyG00gwpocOLb1oLQoZOz/KSfsT5muLm+Y0mnOfTU9k3RDZMz/fO0Df
         1jAy8dIVFFmhOBOMF2KCN+1QaDx8uCxUEzbKueWxvt8izj8FmY1RueXf6haenMqTYR0w
         xRHpin2FlR56Zd6Wl541Z2Xui7VTVpdHMKaDnLaAvF9IWwGuJ3LOZxwOymOIP0ssqrJx
         tutSffsbLZOybQhn4wmD5bbFpVC3l8W4LpXsj9tvkPay06iVnumUG9WkbySJzZW/olpT
         s4vw==
X-Gm-Message-State: AOAM532pPJdZSMfGOF9BY3QQGfT+PYUMWPTtiNU5cSWKdlXNmi9vr5I0
	mQPcgWKGPMsJMBc0knGFb0E=
X-Google-Smtp-Source: ABdhPJwJqoUiFy7YXuGI7xJHhZ4oqQidNFSSfrsgUMREpiAhvQS66r555cMNOfkEqZZH73MivZZI6w==
X-Received: by 2002:a17:902:a9c3:b029:12c:31c7:9b81 with SMTP id b3-20020a170902a9c3b029012c31c79b81mr4901232plr.30.1627568456660;
        Thu, 29 Jul 2021 07:20:56 -0700 (PDT)
Received: from ojas ([122.161.51.5])
        by smtp.gmail.com with ESMTPSA id p3sm4091663pgi.20.2021.07.29.07.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 07:20:56 -0700 (PDT)
Date: Thu, 29 Jul 2021 19:50:43 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, nsaenz@kernel.org,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: vchiq: Set $CONFIG_VCHIQ_CDEV to be enabled
 by default
Message-ID: <20210729142043.GA25192@ojas>
References: <cover.1627495116.git.ojaswin98@gmail.com>
 <70d91b0482e19d7551d3258ea54c970c1b996317.1627495116.git.ojaswin98@gmail.com>
 <YQGl47Wpu7+SHIW+@kroah.com>
 <20210728200607.GB17046@ojas>
 <ddcc0ba2-edc0-89a9-b20d-ce58b3e548fc@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcc0ba2-edc0-89a9-b20d-ce58b3e548fc@i2se.com>

On Wed, Jul 28, 2021 at 10:21:41PM +0200, Stefan Wahren wrote:
> Am 28.07.21 um 22:06 schrieb Ojaswin Mujoo:
> > On Wed, Jul 28, 2021 at 08:45:55PM +0200, Greg KH wrote:
> >> On Thu, Jul 29, 2021 at 12:07:16AM +0530, Ojaswin Mujoo wrote:
> >>> Before this config was defined, the cdev used to be created
> >>> unconditionally. When an earlier commit introduced this config, the
> >>> default behavior was set to disabled, which might surprise some
> >>> unsuspecting users.  Hence, make this config default to 'Y' to be more
> >>> backward consistent.
> >>>
> >>> Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> >>> ---
> >>>  drivers/staging/vc04_services/Kconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> >>> index 63caa6818d37..2b70c37cdd09 100644
> >>> --- a/drivers/staging/vc04_services/Kconfig
> >>> +++ b/drivers/staging/vc04_services/Kconfig
> >>> @@ -23,6 +23,7 @@ if BCM2835_VCHIQ
> >>>  
> >>>  config VCHIQ_CDEV
> >>>  	bool "VCHIQ Character Driver"
> >>> +	default y
> >>
> >> default y is only if the machine will not work without this option.
> >> Is that the case here?  If not, then please do not have this as the
> >> default.
> > Got it Greg. 
> >
> > From my testing, the Raspberry Pi does seem to boot correctly without
> > this although some userspace libraries might not work. 
> >
> > Since the machine itself works, I guess I'll drop this patch.
> 
> The idea is good, but the patch needs improvement :)
> 
> Acceptable solution might be that BCM2835_VCHIQ selects VCHIQ_CDEV.
Thanks for the suggestion, Stefan. 

So on testing with select, it seems like select defines a hard reverse
dependency i.e if BCM2835_VCHIQ=y then VCHIQ_CDEV=y and it can't be set
to n.

Checking the Kconfig launguae doc, I found that we could use "imply" to
define weak reverse dependencies, such that BCM2835_VCHIQ=y auto selects
VCHIQ_CDEV=y but we can also change it back to n if required. I tested
this out and it seems to work fine. I believe we can se imply here as it
better suits the use case.

Thank you,
Ojaswin
> 
> >
> > Thank you!
> > Ojaswin
> >> thanks,
> >>
> >> greg k-h
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
