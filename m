Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D96D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:40:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B3F1611CC;
	Wed,  7 Apr 2021 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617784856;
	bh=ArCApTSPQQIjlopJ4gguiMxnCzPzOxidZ1gZWuJzWNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrFrkmHyiuG4I0FT/2BIsTIf5XQBmuvPXHdVrcpvkFJsrvksEjr+yavZnLZ2/3WBP
	 Ik07ve8PAyw/O6vdCkkkkLba248D+tgaU0K9zGF8TwccQn5JmF6eYkNUclDJPq7q4U
	 yFY5RCk6Z7KFulCL3Cc9MMoKNuVPvGWiXuQFtdwk=
Date: Wed, 7 Apr 2021 10:40:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "tiantao (H)" <tiantao6@huawei.com>
Cc: Tian Tao <tiantao6@hisilicon.com>, hvaibhav.linux@gmail.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: move to use request_irq by
 IRQF_NO_AUTOEN flag
Message-ID: <YG1wFcQvKmYsziLt@kroah.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
 <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>

On Wed, Apr 07, 2021 at 04:29:59PM +0800, tiantao (H) wrote:
> 
> 在 2021/4/7 16:22, Greg KH 写道:
> > On Wed, Apr 07, 2021 at 02:50:03PM +0800, Tian Tao wrote:
> > > disable_irq() after request_irq() still has a time gap in which
> > > interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> > > disable IRQ auto-enable because of requesting.
> > > 
> > > this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> > > is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> > Can you wait until that is merged before sending this out to us as we
> > can't do anything until then.
> 
> this is already in linux-next.git.
> 
> cbe16f3 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()

That's great, but note that linux-next is a combined tree of all
subsystem trees.  It's impossible for a subsystem tree to include
linux-next :)

So how about we wait until this gets into Linus's tree so that we do not
all suddenly get problems in our individual subsystem trees.

thanks,

greg k-h
