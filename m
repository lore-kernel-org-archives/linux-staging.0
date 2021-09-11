Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FC3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 12:51:05 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id oc9so3166565pjb.4
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AeTa6aOzDIVbRp/sWaiWKZXjaONihEK8RE+yBuFASuQ=;
        b=CKCDqshWJ/6nNLb+gim4MX4X0f+7cbzHAhjoErEJtQ+ZUglJ15mthPgRcePz5/ieD1
         9atrk882I46sQplwWJGnuShOknIdgVqShN40vcMtTeXHVoZmLlsw7H9dFzhNc6r2qNvg
         XoF4YuUm+vEC0gY2PA/toJvCx9GUpQgXDTwfN+iKeO4fBYN1/ChQxnXUyDeI3IVCeN80
         5vA7JphW7VeKC3ZB3EXRey0Y+xyK1xf/eI2/QfcxdVveGL2LvijrwL5drOsBZePZ0EvJ
         FHBuvA6nEkIkFJZXcAJ3wNFYfHVW5WvxnUzF6ZN1Tur6uDkxTTa1tzLPDp/Gb8nT9MPs
         SRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AeTa6aOzDIVbRp/sWaiWKZXjaONihEK8RE+yBuFASuQ=;
        b=BvsC1ZUgoNP6cccPNUJ1UwYAH38/zdvHQE9758sxTge7/1Mw9rDP8NgYmKbXMl7AkI
         2K3GzjNYGxGaVSpl747clq3J9IKUeaoXJ6HbkhT3Xk1cL95VmulSh6lgnXh4jbmtdCfz
         6bCaTsNF3S+hJTWDW5C0YW2WqhJLS3uvdF8CEzMg5OFKnce/oARd79r29RHc1aoLbBYL
         QcpxTbWHWVogCGxa9vHmmT8MxEbr4uyD26Cn+tMcwCb7kvicHEKPv1NIJ0IslRSVFiLy
         6uG8ad0x/biEPoyc7hyQ3j+Fnn3UeR3uxscWKxIKjg5GPQnXnXvt+/jMakq+cRqH/jI4
         0x6A==
X-Gm-Message-State: AOAM53195CHi54hTvYFborTx8Ctjhv6VOX/8g4+n6QpOPrims9NPCEeX
	VPeqJ/nc1f0Gpw7NlOxUrHM=
X-Google-Smtp-Source: ABdhPJxd4a+HYdW6Q4mBwfx4gQV3HNFFfkye0MPo0MYctkFa0tbM/8Py4WW7bhYkYzZI3CZHeTbKNQ==
X-Received: by 2002:a17:902:7246:b0:138:a6ed:66cc with SMTP id c6-20020a170902724600b00138a6ed66ccmr2341462pll.22.1631364665171;
        Sat, 11 Sep 2021 05:51:05 -0700 (PDT)
Received: from ojas ([122.161.51.62])
        by smtp.gmail.com with ESMTPSA id f6sm1769341pjo.0.2021.09.11.05.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 05:51:04 -0700 (PDT)
Date: Sat, 11 Sep 2021 18:20:58 +0530
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
Message-ID: <20210911125058.GA112075@ojas>
References: <20210907115045.2206083-1-gregkh@linuxfoundation.org>
 <20210910114004.GA23656@ojas>
 <YTtJ/wFxaW1UiMqQ@kroah.com>
 <20210911112911.GA17777@ojas>
 <YTyZWK2tRRQ73poZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTyZWK2tRRQ73poZ@kroah.com>

On Sat, Sep 11, 2021 at 01:56:08PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 11, 2021 at 04:59:11PM +0530, Ojaswin Mujoo wrote:
> > On Fri, Sep 10, 2021 at 02:05:19PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Sep 10, 2021 at 05:10:04PM +0530, Ojaswin Mujoo wrote:
> > > > On Tue, Sep 07, 2021 at 01:50:45PM +0200, Greg Kroah-Hartman wrote:
> > > > > Using a struct class, a cdev, and another device just for a single minor
> > > > > device is total overkill.  Just use a dynamic misc device instead,
> > > > > saving lots of logic and memory.
> > > > 
> > > > Hello Greg,
> > > > 
> > > > I got some time to test this out at my end. This seems to work correctly
> > > > however there's a small change in permissions applied to /dev/vchiq that
> > > > is causing tests to break.
> > > > 
> > > > * Permissions before the patch *
> > > > $ ls -l /dev/vchiq 
> > > > crw-rw---- 1 root video 235, 0 May  7 17:33 vchiq
> > > > 
> > > > * Permissions after the patch *
> > > > $ ls -l /dev/vchiq 
> > > > crw------- 1 root root 10, 125 May  7 17:30 vchiq
> > > > 
> > > > As seen above, after the patch, the cdev is only accessible by root user,
> > > > which is causing the tests ($ vchiq_test -f 10) to fail when run as
> > > > non-root.
> > > 
> > > Ah, that's not under the kernel's control, but as you point out, it's a
> > > udev issue.
> > > 
> > > > I believe assigning the permission and "video" group to /dev/vchiq is
> > > > handled by udev, in the downstream pi OS, as seen in this line in
> > > > /lib/udev/rules.d/10-local-rpi.rules file:
> > > > 
> > > > SUBSYSTEM=="vchiq", GROUP="video", MODE="0660" 
> > > > 
> > > > I'm not completely sure how the SUBSYSTEM part is passed to udev from
> > > > the kernel modules, however seems like the miscdevice is not notifying
> > > > udev correctly (?).
> > > 
> > > No, the SUBSYSTEM for this device has changed from "vchiq" to "misc".
> > > 
> > > Having a whole subsystem for just one character device is crazy, which
> > > is why I did the kernel change.
> > > 
> > > Try changing the line in the udev file to:
> > > 
> > > 	NAME=="vchiq", GROUP="video", MODE="0660"
> > > 
> > > (SUBSYSTEM changes to NAME) and see if that works both on the newer
> > > kernel, and on the older ones as
> > > well.
> > Hello, thanks for the explanation and pointers.
> > 
> > The "NAME==vchiq" change doesn't seem to work but I was able to get it
> > correctly working by using "KERNEL=vchiq" instead:
> > 
> >    KERNEL=="vchiq", GROUP="video", MODE="0660"
> > 
> > I tested this with and without this patch and it works as expected. 
> 
> Ah, yes, you are right, I was just guessing, I should have read the udev
> documentation :)
> 
> Any chance you can send a patch for this to whatever package that file
> comes from?

Sure Greg, I can do that.

Thanks,
ojaswin
> 
> thanks,
> 
> greg k-h
