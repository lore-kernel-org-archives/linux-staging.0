Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5871
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 09:03:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8944761107;
	Tue, 27 Apr 2021 09:03:34 +0000 (UTC)
Date: Tue, 27 Apr 2021 11:03:32 +0200
From: Greg KH <greg@kroah.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-staging@lists.linux.dev,
	Harald Arnesen <harald@skogtun.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix monitor netdev
 register/unregister
Message-ID: <YIfTZKtMcMAB2e4k@kroah.com>
References: <20210426212801.3d902cc9e6f4.Ie0b1e0c545920c61400a4b7d0f384ea61feb645a@changeid>
 <YIeuW57v5/qPwlzY@kroah.com>
 <aad26597fc709dd67bf010b60590120148bc16c6.camel@sipsolutions.net>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aad26597fc709dd67bf010b60590120148bc16c6.camel@sipsolutions.net>

On Tue, Apr 27, 2021 at 10:53:58AM +0200, Johannes Berg wrote:
> On Tue, 2021-04-27 at 08:25 +0200, Greg KH wrote:
> > 
> > > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > @@ -2579,7 +2579,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
> > >  	mon_wdev->iftype = NL80211_IFTYPE_MONITOR;
> > >  	mon_ndev->ieee80211_ptr = mon_wdev;
> > > 
> > > -	ret = register_netdevice(mon_ndev);
> > > +	ret = cfg80211_register_netdevice(mon_ndev);
> > 
> > Is this now a requirement for all wireless drivers?
> 
> Yes and no. It must only be called from within a "please add an
> interface" method. Otherwise, register_netdevice() must still be called.
> 
> > If so, do other drivers/staging/ drivers need to also be fixed up?
> 
> Not as far as I can tell, this is the only wireless staging driver that
> even calls register_netdevice(). Not sure why I missed this, I had
> audited all of those calls across the tree. But looking a second time
> always shows more I guess, sorry about that.
> 
> There's another call to register_netdevice() here but I don't think
> that's affected, however, it's obviously utterly broken in the first
> place:
> 
>         if (!rtnl_is_locked())
>                 unregister_netdev(cur_pnetdev);
>         else
>                 unregister_netdevice(cur_pnetdev);
> 
> *sigh*.

Sorry, these staging wireless drivers are really getting annoying.
Maybe I need to turn an intern onto them to just get them fixed up and
out of here to be a 'real' driver.

> > I'm guessing this will be going through the wireless tree, so:
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I don't care much, since unfortunately it's already too late and the
> breakage is released in 5.12. I'll pick it up through my tree since I
> broke it (and probably should add a Cc stable tag.)

Great, thanks for taking it that way and doing this fix, much
appreciated.

greg k-h
