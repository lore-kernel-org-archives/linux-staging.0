Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB917B
	for <linux-staging@lists.linux.dev>; Wed, 29 Jun 2022 09:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE516C34114;
	Wed, 29 Jun 2022 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656493568;
	bh=x2GCzecskcLtSCWQXoaVv3Na56ClXU+Y0k0Qh8E4oQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yvcAQrUYxKTNfIijL+ZbK08cAl5Ovfrl56tfBMJUV5aP+95TFNneNQFG2uM9frr6Q
	 f/NiB9B06ERHDYY4a7PtkKmS3mLJLn+PNDGHfgQqWK+WxYgwXx6SwcBDpVgVF65zJt
	 a013zE2RiSg82j4zz7P6Rse4H/JNl6MmT9ljsYzk=
Date: Wed, 29 Jun 2022 11:06:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: syzbot <syzbot+ce3408364c4a234dd90c@syzkaller.appspotmail.com>,
	aldas60@gmail.com, keescook@chromium.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, nathan@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING: locking bug in hfa384x_usbctlx_completion_task
Message-ID: <YrwV/bQBFg3lTFky@kroah.com>
References: <000000000000e3fc8905e2608d4f@google.com>
 <20220627170838.y7kbvazgpd52xd6d@offworld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627170838.y7kbvazgpd52xd6d@offworld>

On Mon, Jun 27, 2022 at 10:08:38AM -0700, Davidlohr Bueso wrote:
> It's nice to see this sort of stuff actually tested :)
> 
> On Sun, 26 Jun 2022, syzbot wrote:
> 
> > ------------[ cut here ]------------
> > DEBUG_LOCKS_WARN_ON(1)
> > WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 hlock_class kernel/locking/lockdep.c:231 [inline]
> > WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 hlock_class kernel/locking/lockdep.c:220 [inline]
> > WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 check_wait_context kernel/locking/lockdep.c:4727 [inline]
> > WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 __lock_acquire+0x1356/0x5660 kernel/locking/lockdep.c:5003
> > Modules linked in:
> > CPU: 1 PID: 21 Comm: kworker/1:0 Not tainted 5.19.0-rc3-syzkaller-00071-g105f3fd2f789 #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Workqueue: events hfa384x_usbctlx_completion_task
> 
> Sorry about that, the below should fix it. Thanks.
> 
> ---8<-------------------------------
> From: Davidlohr Bueso <dave@stgolabs.net>
> Subject: [PATCH] staging/wlan-ng: get the correct struct hfa384x in work callback
> 
> hfa384x_usbctlx_completion_task() is bogusly using the reaper BH when
> in fact this is the completion_bh. This was reflected when trying
> to acquire the hw->ctlxq.lock and getting a failed lockdep class
> initialized to it.
> 
> Reported-by: syzbot+ce3408364c4a234dd90c@syzkaller.appspotmail.com
> Fixes: 9442e81d7e7 (staging/wlan-ng, prism2usb: replace completion_bh tasklet with work)
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  drivers/staging/wlan-ng/hfa384x_usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Can you submit this properly so that I can accept it?

thanks,

greg k-h
