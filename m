Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A203FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 11:29:18 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id j16so4350229pfc.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nE6Vpn2ifraVOUHXGmEpuLZh+Ikao8iz2hSDRjcDdNI=;
        b=VX+XTfVBN4HIOzLzKYjvnziCEiqpZ5gaTBn+PaJkv34akMtiFiEAIYt2k+7sKh3piV
         iMcdTCd6WKHuA5iAVDwRngLZIoXugdar1femUuyIpYC1f7RKlsbNJyesm2s2IMzFNPTC
         yBVwYf9nnATqvbo9UUQPGz/7C5G0fJJtsJPNn49zH895MtXqboiZTGhMHq7scP19wLVW
         4wQOT4a1ykOdBGVOsr1uqRLEABMfI3jEDtkqBf6bK9Ij15jHnFQAYDzUCWylRB5OZyOb
         iLIOBILDRlQHw7+jutgjHbDKStgcMV0wuLzUzIIkO9XVOww8QiGGJLWZ2yPPhFYlxC6x
         I71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nE6Vpn2ifraVOUHXGmEpuLZh+Ikao8iz2hSDRjcDdNI=;
        b=OsERVFtZegQKB/PHDqUnJ1kXrl5H4Qlrslk7Mx/AAu1facXiakvpjqCDDRM4r2wP5P
         WuuXZAqCjALsoYDYtRmAtLXOOff3r21b/FSegQJ1RdRnfB+Iz2uohN9QComcknvuXvap
         Hr3l3zz5rbDXNH79eYRIAqrs8+RtWsacSZ2pC0BGFm6UQh5x16NBHknDqkBLR46YB3Jw
         znQdwNyRXj1WlJxtIzhxr0kNuudht7Aepq7lOxt5CEZw1I+RRUdtmMwgIA2uk+6TWIsu
         4fuKL2f1Ej1SLukSIad1pK/GbZoB/jh4IHfqEKJC8s8poXDIYclKeDn815FY5qSzisDr
         ZweQ==
X-Gm-Message-State: AOAM532k8a25wykB6MgV6MbkWETulX+sRSSWDt3gHIZANChzW5+NWn1L
	+BirR9+XmNldizU5k7h7u5A=
X-Google-Smtp-Source: ABdhPJz3FdAEaCj7tJJNY31BmDCvgnxcHybUr0YzUiI9N/Qa0F32mc6/ynsC5sQX9aV6iya0MEwBIg==
X-Received: by 2002:a63:1309:: with SMTP id i9mr2179080pgl.192.1631359758380;
        Sat, 11 Sep 2021 04:29:18 -0700 (PDT)
Received: from ojas ([122.161.51.62])
        by smtp.gmail.com with ESMTPSA id m21sm1570271pjl.14.2021.09.11.04.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 04:29:18 -0700 (PDT)
Date: Sat, 11 Sep 2021 16:59:11 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Phil Elwell <phil@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: vchiq: convert to use a miscdevice
Message-ID: <20210911112911.GA17777@ojas>
References: <20210907115045.2206083-1-gregkh@linuxfoundation.org>
 <20210910114004.GA23656@ojas>
 <YTtJ/wFxaW1UiMqQ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTtJ/wFxaW1UiMqQ@kroah.com>

On Fri, Sep 10, 2021 at 02:05:19PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 10, 2021 at 05:10:04PM +0530, Ojaswin Mujoo wrote:
> > On Tue, Sep 07, 2021 at 01:50:45PM +0200, Greg Kroah-Hartman wrote:
> > > Using a struct class, a cdev, and another device just for a single minor
> > > device is total overkill.  Just use a dynamic misc device instead,
> > > saving lots of logic and memory.
> > 
> > Hello Greg,
> > 
> > I got some time to test this out at my end. This seems to work correctly
> > however there's a small change in permissions applied to /dev/vchiq that
> > is causing tests to break.
> > 
> > * Permissions before the patch *
> > $ ls -l /dev/vchiq 
> > crw-rw---- 1 root video 235, 0 May  7 17:33 vchiq
> > 
> > * Permissions after the patch *
> > $ ls -l /dev/vchiq 
> > crw------- 1 root root 10, 125 May  7 17:30 vchiq
> > 
> > As seen above, after the patch, the cdev is only accessible by root user,
> > which is causing the tests ($ vchiq_test -f 10) to fail when run as
> > non-root.
> 
> Ah, that's not under the kernel's control, but as you point out, it's a
> udev issue.
> 
> > I believe assigning the permission and "video" group to /dev/vchiq is
> > handled by udev, in the downstream pi OS, as seen in this line in
> > /lib/udev/rules.d/10-local-rpi.rules file:
> > 
> > SUBSYSTEM=="vchiq", GROUP="video", MODE="0660" 
> > 
> > I'm not completely sure how the SUBSYSTEM part is passed to udev from
> > the kernel modules, however seems like the miscdevice is not notifying
> > udev correctly (?).
> 
> No, the SUBSYSTEM for this device has changed from "vchiq" to "misc".
> 
> Having a whole subsystem for just one character device is crazy, which
> is why I did the kernel change.
> 
> Try changing the line in the udev file to:
> 
> 	NAME=="vchiq", GROUP="video", MODE="0660"
> 
> (SUBSYSTEM changes to NAME) and see if that works both on the newer
> kernel, and on the older ones as
> well.
Hello, thanks for the explanation and pointers.

The "NAME==vchiq" change doesn't seem to work but I was able to get it
correctly working by using "KERNEL=vchiq" instead:

   KERNEL=="vchiq", GROUP="video", MODE="0660"

I tested this with and without this patch and it works as expected. 

Regards,
Ojaswin
> 
> thanks,
> 
> greg k-h
