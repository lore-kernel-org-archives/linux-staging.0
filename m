Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A815C92
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 18:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C71C433D6;
	Fri,  9 Sep 2022 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662746481;
	bh=xfbOxDMrBC+FLEHLKPnZtY1D4mafiObgMUwlegIp9tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPKiCmZhdjpHrlMw8iB5JZku3rbdbxwk3JBzC76PbqNcXua+sHecFwMwli+3iYxH+
	 NcXMGAA5xqfNSVkDYVzAEstK61VL2iQUivdcudhteOu4AtEKij+oByPEf7DnbPdmMV
	 BCY3d+mgi0yqIcZosc2y0ETX1PtZyPB/E5dmA3VA=
Date: Fri, 9 Sep 2022 20:01:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>, GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH] staging: rtl8192e: Fix return type for implementation of
 ndo_start_xmit
Message-ID: <Yxt/bjvVgC3H8mr6@kroah.com>
References: <20220908203243.GA23048@matrix-ESPRIMO-P710>
 <YxrxywN9wDypohyY@kroah.com>
 <YxryqJs4k3B26/7o@kroah.com>
 <a0c8fa9d-cc86-b39b-e65f-e8a0ccf12a15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0c8fa9d-cc86-b39b-e65f-e8a0ccf12a15@gmail.com>

On Fri, Sep 09, 2022 at 07:20:09PM +0200, Philipp Hortmann wrote:
> On 9/9/22 10:00, Greg Kroah-Hartman wrote:
> > On Fri, Sep 09, 2022 at 09:56:59AM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Sep 08, 2022 at 10:32:43PM +0200, Philipp Hortmann wrote:
> > > > CFI (Control Flow Integrity) is a safety feature allowing the system to
> > > > detect and react should a potential control flow hijacking occurs. In
> > > > particular, the Forward-Edge CFI protects indirect function calls by
> > > > ensuring the prototype of function that is actually called matches the
> > > > definition of the function hook.
> > > > 
> > > > Since Linux now supports CFI, it will be a good idea to fix mismatched
> > > > return type for implementation of hooks. Otherwise this would get
> > > > cought out by CFI and cause a panic.
> > > > 
> > > > Use enums from netdev_tx_t as return value instead, then change return
> > > > type to netdev_tx_t.
> > > > 
> > > > Suggested-by: Dan Carpenter <error27@gmail.com>
> > > > Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> > > > ---
> > > > Tested with rtl8192e
> > > > Transferred this patch over wlan connection of rtl8192e
> > > > ---
> > > >   drivers/staging/rtl8192e/rtllib.h    |  2 +-
> > > >   drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
> > > >   2 files changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > Someone sent the same patch before you did:
> > > 	https://lore.kernel.org/r/20220905130053.10731-1-guozihua@huawei.com
> > > 
> > 
> > This patch does not apply to my tree either :(
> > 
> > Please rebase and resubmit.
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> Sorry Greg,
> 
> I cannot find my error.
> I just downloaded the patch and applied it to the staging-next branch and
> that worked fine.

Try the staging-testing branch please.

thanks,

greg k-h
