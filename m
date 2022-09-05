Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88923AA
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 05:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353A3C433C1;
	Mon,  5 Sep 2022 05:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662354998;
	bh=CHW0t+DHInOV7nEGEJSX5j1DUY+0LavjNaSE0/vDXvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4I0NneLcHdL0uCAMzV12k7my9vPKdZlgaCr2LnSWVOMBntjZf+zVeJLdwjSWaCy8
	 277auevit1txA0xur/CmkcC+uX7Y7Qcien3QRpN2LrlAcFCH+nbFPOZ3h09G5mSyBl
	 uyz0vsRQOH/SW4r7MjSC9ovgtdoMDX9f5+RaXAyg=
Date: Mon, 5 Sep 2022 07:16:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Guozihua (Scott)" <guozihua@huawei.com>
Cc: linux-staging@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com
Subject: Re: [RESEND PATCH] staging: r8188eu: Fix return type for
 implementation of ndo_start_xmit
Message-ID: <YxWGM+f1d4+sCKMj@kroah.com>
References: <20220902081653.60682-1-guozihua@huawei.com>
 <YxG+DNzyUcPIjXZC@kroah.com>
 <2a5e1f33-45ee-2da7-19fb-f0ef66418e9e@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a5e1f33-45ee-2da7-19fb-f0ef66418e9e@huawei.com>

On Mon, Sep 05, 2022 at 09:23:15AM +0800, Guozihua (Scott) wrote:
> Hi Greg,
> 
> Sorry for the confusion.
> 
> On 2022/9/2 16:25, Greg KH wrote:
> > On Fri, Sep 02, 2022 at 04:16:53PM +0800, GUO Zihua wrote:
> > > Since Linux now supports CFI, it will be a good idea to fix mismatched
> > > return type for implementation of hooks. Otherwise this might get
> > > cought out by CFI and cause a panic.
> > > 
> > > Use enums from netdev_tx_t as return value instead, then change return
> > > type to netdev_tx_t.
> > > 
> > > Signed-off-by: GUO Zihua <guozihua@huawei.com>
> > > ---
> > >   drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
> > >   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > Why is this and the other commits, marked as RESEND?
> 
> The first version of the patch has a truncated subject, thus the resend. It
> might be better to send a v2 patches instead..

Yes please do that.

> > And any reason you didn't cc: the staging maintainer on this commit?
> 
> It's my first time sending patches to the staging maillist. When I run
> get_maintainer.pl on the patch I don't see a "maintainer", but only
> "supporters" and "reviewers". Is that for staging there are a group of
> maintainers for all modules?

See the MAINTAINERS file for what "supported" and "maintained" and the
rest mean and just include them all when you submit a patch.

thanks,

greg k-h
