Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790653FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 11:56:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42D0F611F0;
	Sat, 11 Sep 2021 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631361370;
	bh=lGmgTFSbG/Gs9rf2FxKe3GG+QgffwmnxvoctnWxBkSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oB5WBiiNonBBZGsNVxgo4N7rahKgzeSZz+0DCcOUqo3s11ypdJS09AMk+uJh6Wh3L
	 cbdHirmyPp/EbQoe8rbIT27/P6lHyzXSYLR4T+KdLgKwbh9zEVo2LZdWHDW69pSSs/
	 awBUsNUvYuqrj8knGWtm+RXO27LkmTULlhim1ruU=
Date: Sat, 11 Sep 2021 13:56:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ojaswin Mujoo <ojaswin98@gmail.com>
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
Message-ID: <YTyZWK2tRRQ73poZ@kroah.com>
References: <20210907115045.2206083-1-gregkh@linuxfoundation.org>
 <20210910114004.GA23656@ojas>
 <YTtJ/wFxaW1UiMqQ@kroah.com>
 <20210911112911.GA17777@ojas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911112911.GA17777@ojas>

On Sat, Sep 11, 2021 at 04:59:11PM +0530, Ojaswin Mujoo wrote:
> On Fri, Sep 10, 2021 at 02:05:19PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 10, 2021 at 05:10:04PM +0530, Ojaswin Mujoo wrote:
> > > On Tue, Sep 07, 2021 at 01:50:45PM +0200, Greg Kroah-Hartman wrote:
> > > > Using a struct class, a cdev, and another device just for a single minor
> > > > device is total overkill.  Just use a dynamic misc device instead,
> > > > saving lots of logic and memory.
> > > 
> > > Hello Greg,
> > > 
> > > I got some time to test this out at my end. This seems to work correctly
> > > however there's a small change in permissions applied to /dev/vchiq that
> > > is causing tests to break.
> > > 
> > > * Permissions before the patch *
> > > $ ls -l /dev/vchiq 
> > > crw-rw---- 1 root video 235, 0 May  7 17:33 vchiq
> > > 
> > > * Permissions after the patch *
> > > $ ls -l /dev/vchiq 
> > > crw------- 1 root root 10, 125 May  7 17:30 vchiq
> > > 
> > > As seen above, after the patch, the cdev is only accessible by root user,
> > > which is causing the tests ($ vchiq_test -f 10) to fail when run as
> > > non-root.
> > 
> > Ah, that's not under the kernel's control, but as you point out, it's a
> > udev issue.
> > 
> > > I believe assigning the permission and "video" group to /dev/vchiq is
> > > handled by udev, in the downstream pi OS, as seen in this line in
> > > /lib/udev/rules.d/10-local-rpi.rules file:
> > > 
> > > SUBSYSTEM=="vchiq", GROUP="video", MODE="0660" 
> > > 
> > > I'm not completely sure how the SUBSYSTEM part is passed to udev from
> > > the kernel modules, however seems like the miscdevice is not notifying
> > > udev correctly (?).
> > 
> > No, the SUBSYSTEM for this device has changed from "vchiq" to "misc".
> > 
> > Having a whole subsystem for just one character device is crazy, which
> > is why I did the kernel change.
> > 
> > Try changing the line in the udev file to:
> > 
> > 	NAME=="vchiq", GROUP="video", MODE="0660"
> > 
> > (SUBSYSTEM changes to NAME) and see if that works both on the newer
> > kernel, and on the older ones as
> > well.
> Hello, thanks for the explanation and pointers.
> 
> The "NAME==vchiq" change doesn't seem to work but I was able to get it
> correctly working by using "KERNEL=vchiq" instead:
> 
>    KERNEL=="vchiq", GROUP="video", MODE="0660"
> 
> I tested this with and without this patch and it works as expected. 

Ah, yes, you are right, I was just guessing, I should have read the udev
documentation :)

Any chance you can send a patch for this to whatever package that file
comes from?

thanks,

greg k-h
