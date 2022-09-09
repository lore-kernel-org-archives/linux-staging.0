Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46227E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 08:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBD0C433C1;
	Fri,  9 Sep 2022 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662711430;
	bh=UuyIVREuByJSc853kzK+3/0/hgMhWdMj++TiW4zG7T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOZyaI9aaekWQNyaA9v0CVWLn7h0Bn0QfiWjsyv6h7DW6h+HKdkfe2g/H9R4UDbpZ
	 lBfroimdVT23S4rIjVAayAAmMjPo7nug4nRWAx+OBftEaunRE4fvv/DBgOOurBdntu
	 q0oJrRsII6yYLvnafV4tv9nhwZhbavIsVVrY4ntE=
Date: Fri, 9 Sep 2022 10:17:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Guozihua (Scott)" <guozihua@huawei.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: r8188eu: Fix return type for implementation
 of ndo_start_xmit
Message-ID: <Yxr2hCsMuVrQ17UW@kroah.com>
References: <20220908011323.22186-1-guozihua@huawei.com>
 <88f8c741-525d-fe3e-5fbd-3d7b16ca3254@gmail.com>
 <12f2b845-7450-bc29-9b81-624804c0e3e4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12f2b845-7450-bc29-9b81-624804c0e3e4@huawei.com>

On Fri, Sep 09, 2022 at 04:05:02PM +0800, Guozihua (Scott) wrote:
> On 2022/9/9 3:22, Philipp Hortmann wrote:
> > On 9/8/22 03:13, GUO Zihua wrote:
> > > CFI (Control Flow Integrity) is a safety feature allowing the system to
> > > detect and react should a potential control flow hijacking occurs. In
> > > particular, the Forward-Edge CFI protects indirect function calls by
> > > ensuring the prototype of function that is actually called matches the
> > > definition of the function hook.
> > > 
> > > Since Linux now supports CFI, it will be a good idea to fix mismatched
> > > return type for implementation of hooks. Otherwise this would get
> > > cought out by CFI and cause a panic.
> > > 
> > > Use enums from netdev_tx_t as return value instead, then change return
> > > type to netdev_tx_t.
> > > 
> > > Fixes: cf68fffb66d6 ("add support for Clang CFI")
> > > Signed-off-by: GUO Zihua <guozihua@huawei.com>
> > > ---
> > > 
> > > v4:
> > >    Added Fixes tag.
> > > 
> > > v3:
> > >    Provide detail on CFI.
> > > 
> > > v2:
> > >    Fix truncated subject.
> > > 
> > > ---
> > >   drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
> > >   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h
> > > b/drivers/staging/r8188eu/include/xmit_osdep.h
> > > index 00658681fef9..947242486144 100644
> > > --- a/drivers/staging/r8188eu/include/xmit_osdep.h
> > > +++ b/drivers/staging/r8188eu/include/xmit_osdep.h
> > > @@ -28,7 +28,7 @@ struct sta_xmit_priv;
> > >   struct xmit_frame;
> > >   struct xmit_buf;
> > > -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
> > > +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device
> > > *pnetdev);
> > >   void rtw_os_xmit_schedule(struct adapter *padapter);
> > > diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> > > b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> > > index 91a1e4e3219a..0b04010d6d82 100644
> > > --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> > > +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> > > @@ -198,7 +198,7 @@ static int rtw_mlcst2unicst(struct adapter
> > > *padapter, struct sk_buff *skb)
> > >       return true;
> > >   }
> > > -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
> > > +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device
> > > *pnetdev)
> > >   {
> > >       struct adapter *padapter = (struct adapter
> > > *)rtw_netdev_priv(pnetdev);
> > >       struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> > > @@ -233,5 +233,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct
> > > net_device *pnetdev)
> > >   exit:
> > > -    return 0;
> > > +    return NETDEV_TX_OK;
> > >   }
> > 
> > Hi,
> > 
> > I cannot apply your patch:
> > 
> > Applying: staging: r8188eu: Fix return type for implementation of
> > ndo_start_xmit
> > error: drivers/staging/r8188eu/include/xmit_osdep.h: does not exist in
> > index
> > error: drivers/staging/r8188eu/os_dep/xmit_linux.c: does not exist in index
> > Patch failed at 0001 staging: r8188eu: Fix return type for
> > implementation of ndo_start_xmit
> > 
> > 
> > Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> > 
> > branch staging-testing
> > 
> > Do you know why?
> > 
> > Bye Philipp
> > .
> 
> Hi Philipp,
> 
> It seems that folder drivers/staging/r8188eu no longer presents on the
> branch you mentioned. However, they are still there on master branch.

As my bot says, always work against either linux-next, or the
development branch of the subsystem you are wanting to submit a patch
to.  Otherwise your patch will be rejected as it can not be applied for
obvious reasons.

thanks,

greg k-h
