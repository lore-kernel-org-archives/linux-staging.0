Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126F20E2
	for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 14:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2545DC433C8;
	Thu, 15 Jun 2023 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686839679;
	bh=EQOh51VjdnSVB1jEja9kzvDT2KtzLLOcPpFUeCtou3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6VE0KJYUyWs/AJpd/icaEkfLE2BmkcvUgrLcXtL99oZxvOw9Hv1TvdmQPtJVtlKQ
	 6wP1u1UA53NOP+nAbKoWwD0BzvsfDtbM8p35aGV7b006LDaQHiRzMh9j0/KbjXCep0
	 KBKxHCu7oCFBXWhsYY1wKyJfIvaPWy7xJ9N4ZpIQ=
Date: Thu, 15 Jun 2023 16:34:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH v2 0/5] Trivial code cleanup patches
Message-ID: <2023061520-gear-unwind-fbcc@gregkh>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <2023061532-fall-earthy-c429@gregkh>
 <20230615140908.GB37552@yogi-Zephyrus>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615140908.GB37552@yogi-Zephyrus>

On Thu, Jun 15, 2023 at 07:39:08PM +0530, Yogesh Hegde wrote:
> On Thu, Jun 15, 2023 at 12:36:45PM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jun 07, 2023 at 08:31:19PM +0530, Yogesh Hegde wrote:
> > > These patches remove variables in the struct rtllib_device that were 
> > > set only once throughout the driver. Instead of using these variables, 
> > > the patches modify the relevant code to directly call the corresponding 
> > > functions, eliminating unnecessary indirection and removing CamelCase.
> > > The patches are required to be applied in sequence.
> > > 
> > > Yogesh Hegde (5):
> > >   staging: rtl8192e: Remove variable SetWirelessMode
> > >   staging: rtl8192e: Remove variable SetBWModeHandler
> > >   staging: rtl8192e: Remove variable LeisurePSLeave
> > >   staging: rtl8192e: Remove variable InitialGainHandler
> > >   staging: rtl8192e: Remove DRV_NAME definition in rtllib_debug.h
> > > 
> > >  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
> > >  drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  4 ----
> > >  drivers/staging/rtl8192e/rtl819x_HTProc.c      |  8 ++++----
> > >  drivers/staging/rtl8192e/rtllib.h              |  6 ------
> > >  drivers/staging/rtl8192e/rtllib_debug.h        |  5 -----
> > >  drivers/staging/rtl8192e/rtllib_rx.c           |  3 ++-
> > >  drivers/staging/rtl8192e/rtllib_softmac.c      | 16 +++++++---------
> > >  drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  9 +++++----
> > >  8 files changed, 20 insertions(+), 35 deletions(-)
> > > 
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > 
> > These break the build, as reported by the test robot, please fix up.
> 
> Hi Greg,
> 
> These patches do not work because this driver is divided into two
> modules.
> 
> The driver is loaded in 2 different modules:
> sudo insmod drivers/staging/rtl8192e/rtllib.ko
> sudo insmod drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko
> 
> So this line is required:
> priv->rtllib->SetWirelessMode = rtl92e_set_wireless_mode;
> as one name is used in one module and one in the other module.
> 
> So when I suggested these fixes
> 1.  Patchset to combine both the modules into one module.
> 2.  Or resending v1 of the patchset.
> 
> to Dan Carpenter <dan.carpenter@linaro.org> and
> Philipp Hortmann <philipp.g.hortmann@gmail.com>, in their opinion both the
> suggested fixes are incorrect, which I agree with.
> 
> Link to conversation -
> https://lore.kernel.org/linux-staging/90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com/
> 
> I have yet to find a correct way to solve this problem. Please let me
> know if you have any suggestions. 

I don't know, sorry, that's up to you.  If a symbol is used in one
module, then of course you can't remove it :)

don't mess with the modules split for now, just get the existing code
cleaner, that's probably much easier, right?

thanks,

greg k-h
