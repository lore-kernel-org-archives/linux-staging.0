Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285116D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 06:25:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476F56113E;
	Thu,  8 Apr 2021 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617863115;
	bh=wlOGXqCKssxtPH36TQopvPgfvpmonDwdzwKo/YmJLmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQ84z8bKfgLO2YM0pn9THtvzzupPKAd5Las9PAvus3aVJ8irYn0UWia8J3DOJU6Sg
	 PYN/z7jmy2VQLe1ZkDgh96abPaWcon2MoeyaZWK7X/yTpsXdgOVTBwdiJbChpgPlkU
	 3cGokxwWnz1Q+SbH4qe5ONCuISRXNq0OADkKs9dw=
Date: Thu, 8 Apr 2021 08:25:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "tiantao (H)" <tiantao6@huawei.com>
Cc: Tian Tao <tiantao6@hisilicon.com>, hvaibhav.linux@gmail.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: move to use request_irq by
 IRQF_NO_AUTOEN flag
Message-ID: <YG6hyc8wWolwVbnQ@kroah.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
 <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
 <YG1wFcQvKmYsziLt@kroah.com>
 <ca0261a9-7968-c9c9-b286-a9770a6d5096@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca0261a9-7968-c9c9-b286-a9770a6d5096@huawei.com>

On Thu, Apr 08, 2021 at 08:51:09AM +0800, tiantao (H) wrote:
> 
> 在 2021/4/7 16:40, Greg KH 写道:
> > On Wed, Apr 07, 2021 at 04:29:59PM +0800, tiantao (H) wrote:
> > > 在 2021/4/7 16:22, Greg KH 写道:
> > > > On Wed, Apr 07, 2021 at 02:50:03PM +0800, Tian Tao wrote:
> > > > > disable_irq() after request_irq() still has a time gap in which
> > > > > interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> > > > > disable IRQ auto-enable because of requesting.
> > > > > 
> > > > > this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> > > > > is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> > > > Can you wait until that is merged before sending this out to us as we
> > > > can't do anything until then.
> > > this is already in linux-next.git.
> > > 
> > > cbe16f3 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()
> > That's great, but note that linux-next is a combined tree of all
> > subsystem trees.  It's impossible for a subsystem tree to include
> > linux-next :)
> Maybe you can referencethis tag https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/tag/?h=irq-no-autoen-2021-03-25

In what way?
