Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249470
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 20:06:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so5931718pjd.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oOXvanqkJmFK42acZmBqNZo5yXMDDdF902WjpDqKC4A=;
        b=WnAwo5B+9Xwwuru6q9EGEhgLjvCcS6LlStfUh1WwP/Q5o3pUKz7vcGCwDWOMbHCf+y
         vwCvUj3gT/ytNsLCG8dg5cf09Qu1agFSi0hpKEXqg2yrh7+HTfbTLj0N7lTi+DwAUA+c
         wiR4zn4V2tQ14TJYRd7y2LPKBsbPk2OwmiRff/+J4AEDQGP5zEemUeX5fzPCV0DHnPEJ
         x7E6m68JxBw48tNnED7NLEn4yeWsOJrRPymcV3InL99jm6wiaqKPuC5cRewZ+ECj610+
         bTHswTQoEPjOzgkuA1cbYByHodXUmieFhfZQZTyrmxbT1QxE6ymTkLGJOmpwUyi5Rht+
         HcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oOXvanqkJmFK42acZmBqNZo5yXMDDdF902WjpDqKC4A=;
        b=DLNuuk4dolKR112Z+qvHWtZIFVxQma0JTD5gQiaodG0bUS87WEMMyu8QAlxyH2bO45
         KLFK7LEZ+AfAWhVRqm5lDjq7dagCm/OR4PUqApIFkohWE4j/FFYUxVOc/EvegkBPE6nt
         9sMhYJyZg/lXGy4BMLksiMyvLAqqSgR7nvs6zx3tJiL72y3rIcEjm5g+F5Adm6aPrgKR
         U09qW4S7B1Du4TDQCCEw+MUqhuyvj7+lky8CL/yb7/YDZ52E2L65fSrv9ylIPncHumBs
         yxHBvu29SryhI3iZyj/Vy7ZtIQxcvd78cN55v4QBY5lHM+Pe6XQjviTqMetlIicZ6TfF
         tcRg==
X-Gm-Message-State: AOAM533V8fpmovGE5YWMwwGprUlm7r7yD21dkFh2T4fhGg6SVnd1Zzj+
	DPCoI0yS/KNZltj5fEgGNqI=
X-Google-Smtp-Source: ABdhPJxlPnIoSUgxvNTqCOCrs1RLNXp7nKQOGGNqWBmMeOHJQEVlDU7Jpe2FJKzo2NYHKr+EBZjihA==
X-Received: by 2002:a17:90a:ead4:: with SMTP id ev20mr11244312pjb.65.1627502773141;
        Wed, 28 Jul 2021 13:06:13 -0700 (PDT)
Received: from ojas ([122.161.51.5])
        by smtp.gmail.com with ESMTPSA id m11sm759503pgn.56.2021.07.28.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:06:12 -0700 (PDT)
Date: Thu, 29 Jul 2021 01:36:07 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: vchiq: Set $CONFIG_VCHIQ_CDEV to be enabled
 by default
Message-ID: <20210728200607.GB17046@ojas>
References: <cover.1627495116.git.ojaswin98@gmail.com>
 <70d91b0482e19d7551d3258ea54c970c1b996317.1627495116.git.ojaswin98@gmail.com>
 <YQGl47Wpu7+SHIW+@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQGl47Wpu7+SHIW+@kroah.com>

On Wed, Jul 28, 2021 at 08:45:55PM +0200, Greg KH wrote:
> On Thu, Jul 29, 2021 at 12:07:16AM +0530, Ojaswin Mujoo wrote:
> > Before this config was defined, the cdev used to be created
> > unconditionally. When an earlier commit introduced this config, the
> > default behavior was set to disabled, which might surprise some
> > unsuspecting users.  Hence, make this config default to 'Y' to be more
> > backward consistent.
> > 
> > Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> > ---
> >  drivers/staging/vc04_services/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> > index 63caa6818d37..2b70c37cdd09 100644
> > --- a/drivers/staging/vc04_services/Kconfig
> > +++ b/drivers/staging/vc04_services/Kconfig
> > @@ -23,6 +23,7 @@ if BCM2835_VCHIQ
> >  
> >  config VCHIQ_CDEV
> >  	bool "VCHIQ Character Driver"
> > +	default y
> 
> 
> default y is only if the machine will not work without this option.
> Is that the case here?  If not, then please do not have this as the
> default.
Got it Greg. 

From my testing, the Raspberry Pi does seem to boot correctly without
this although some userspace libraries might not work. 

Since the machine itself works, I guess I'll drop this patch.

Thank you!
Ojaswin
> 
> thanks,
> 
> greg k-h
