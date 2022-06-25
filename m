Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C774A09
	for <linux-staging@lists.linux.dev>; Sat, 25 Jun 2022 09:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACFFC3411C;
	Sat, 25 Jun 2022 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656149417;
	bh=tcU5XmpCJeuUxNJXmTWn3A1u75vW01b3kSYZ+naAcsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOmHi7oQJ6OFaFx7aKCd8NgDtKCV6VLOAIL9AWuEu/u7hYKvPYWjQmFj3WqjV5FWq
	 A49KIWkAbfaPKwK2XUu5b753elpYaaeCgaN5cyY4JWaIBE0XXwo7qBVFIC/NuzkJlP
	 X8ROhvLSCNaQFKXFNig7yjQrs+byKda8pUet+79A=
Date: Sat, 25 Jun 2022 11:30:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: duoming@zju.edu.cn
Cc: linux-staging@lists.linux.dev, davem@davemloft.net,
	alexander.deucher@amd.com, kuba@kernel.org, broonie@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192u: Fix sleep in atomic context bug in
 dm_fsync_timer_callback
Message-ID: <YrbVpbKvqdYuY84C@kroah.com>
References: <20220623055912.84138-1-duoming@zju.edu.cn>
 <YrQ2gXtX2FOkyNgu@kroah.com>
 <1ddff589.e0f1.181944e6c1a.Coremail.duoming@zju.edu.cn>
 <482a0dc6.10f76.1819a2a3546.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <482a0dc6.10f76.1819a2a3546.Coremail.duoming@zju.edu.cn>

On Sat, Jun 25, 2022 at 05:21:06PM +0800, duoming@zju.edu.cn wrote:
> Hello,
> 
> > > On Thu, Jun 23, 2022 at 01:59:12PM +0800, Duoming Zhou wrote:
> > > > There are sleep in atomic context bugs when dm_fsync_timer_callback is
> > > > executing. The root cause is that the memory allocation functions with
> > > > GFP_KERNEL or GFP_NOIO parameters are called in dm_fsync_timer_callback
> > > > which is a timer handler. The call paths that could trigger bugs are
> > > > shown below:
> > > > 
> > > >     (interrupt context)
> > > > dm_fsync_timer_callback
> > > >   write_nic_byte
> > > >     kzalloc(sizeof(data), GFP_KERNEL); //may sleep
> > > >     usb_control_msg
> > > >       kmalloc(.., GFP_NOIO); //may sleep
> > > >   write_nic_dword
> > > >     kzalloc(sizeof(data), GFP_KERNEL); //may sleep
> > > >     usb_control_msg
> > > >       kmalloc(.., GFP_NOIO); //may sleep
> > > > 
> > > > This patch uses delayed work to replace timer and moves the operations
> > > > that may sleep into the delayed work in order to mitigate bugs.
> > > > 
> > > > Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
> > > > Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> > > > ---
> > > > Changes in v2:
> > > >   - Use delayed work to replace timer.
> > > 
> > > Did you test this with real hardware to verify it still works?
> > 
> > I am testing this and I will give you feedback within one or two days.
> 
> Do you know what vendor id and device id use the r8192u_usb driver?

The vendor/device ids are in the driver itself.  Also in the output of
modinfo:
	❯ modinfo drivers/staging/rtl8192u/r8192u_usb.ko | grep alias
	alias:          usb:v043Ep7A01d*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v5A57p0290d*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v2001p3301d*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v1740p9201d*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v0DF6p0031d*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v050Dp805Ed*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v07AAp0043d*dc*dsc*dp*ic*isc*ip*in*
	alias:          usb:v0BDAp8709d*dc*dsc*dp*ic*isc*ip*in*

see the "v" and "p" portions of the alias string.

thanks,

greg k-h
