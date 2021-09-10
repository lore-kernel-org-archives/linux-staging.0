Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7AE3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 12:05:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD3E6611B0;
	Fri, 10 Sep 2021 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631275522;
	bh=lo2aOgUu8i2IXymgSrn5Kz5J1tyA122xdztr2JIZ5fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/rdZQhbAMlsIVc0eP/AjVxrFMAAyCpf/J/GxF5TA+st6T1LzqSF3VwbYCkBmbOq5
	 6LRYK3duv4bDWdKwqGB0V/iWyjIAVp+oiZEXIUNks5AwtAd8hLfCax/4XVGw48RxZc
	 2TPP6yeZKdd6Np8U4+k7cCJXIyC+VCQxAarIWDHQ=
Date: Fri, 10 Sep 2021 14:05:19 +0200
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
Message-ID: <YTtJ/wFxaW1UiMqQ@kroah.com>
References: <20210907115045.2206083-1-gregkh@linuxfoundation.org>
 <20210910114004.GA23656@ojas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910114004.GA23656@ojas>

On Fri, Sep 10, 2021 at 05:10:04PM +0530, Ojaswin Mujoo wrote:
> On Tue, Sep 07, 2021 at 01:50:45PM +0200, Greg Kroah-Hartman wrote:
> > Using a struct class, a cdev, and another device just for a single minor
> > device is total overkill.  Just use a dynamic misc device instead,
> > saving lots of logic and memory.
> 
> Hello Greg,
> 
> I got some time to test this out at my end. This seems to work correctly
> however there's a small change in permissions applied to /dev/vchiq that
> is causing tests to break.
> 
> * Permissions before the patch *
> $ ls -l /dev/vchiq 
> crw-rw---- 1 root video 235, 0 May  7 17:33 vchiq
> 
> * Permissions after the patch *
> $ ls -l /dev/vchiq 
> crw------- 1 root root 10, 125 May  7 17:30 vchiq
> 
> As seen above, after the patch, the cdev is only accessible by root user,
> which is causing the tests ($ vchiq_test -f 10) to fail when run as
> non-root.

Ah, that's not under the kernel's control, but as you point out, it's a
udev issue.

> I believe assigning the permission and "video" group to /dev/vchiq is
> handled by udev, in the downstream pi OS, as seen in this line in
> /lib/udev/rules.d/10-local-rpi.rules file:
> 
> SUBSYSTEM=="vchiq", GROUP="video", MODE="0660" 
> 
> I'm not completely sure how the SUBSYSTEM part is passed to udev from
> the kernel modules, however seems like the miscdevice is not notifying
> udev correctly (?).

No, the SUBSYSTEM for this device has changed from "vchiq" to "misc".

Having a whole subsystem for just one character device is crazy, which
is why I did the kernel change.

Try changing the line in the udev file to:

	NAME=="vchiq", GROUP="video", MODE="0660"

(SUBSYSTEM changes to NAME) and see if that works both on the newer
kernel, and on the older ones as
well.

thanks,

greg k-h
