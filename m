Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBDE71
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 08:54:04 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1lbJTk-000d6L-09; Tue, 27 Apr 2021 10:54:00 +0200
Message-ID: <aad26597fc709dd67bf010b60590120148bc16c6.camel@sipsolutions.net>
Subject: Re: [PATCH] staging: rtl8723bs: fix monitor netdev
 register/unregister
From: Johannes Berg <johannes@sipsolutions.net>
To: Greg KH <greg@kroah.com>
Cc: linux-wireless@vger.kernel.org, linux-staging@lists.linux.dev, Harald
	Arnesen <harald@skogtun.org>
Date: Tue, 27 Apr 2021 10:53:58 +0200
In-Reply-To: <YIeuW57v5/qPwlzY@kroah.com>
References: 
	<20210426212801.3d902cc9e6f4.Ie0b1e0c545920c61400a4b7d0f384ea61feb645a@changeid>
	 <YIeuW57v5/qPwlzY@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned

On Tue, 2021-04-27 at 08:25 +0200, Greg KH wrote:
> 
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -2579,7 +2579,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
> >  	mon_wdev->iftype = NL80211_IFTYPE_MONITOR;
> >  	mon_ndev->ieee80211_ptr = mon_wdev;
> > 
> > -	ret = register_netdevice(mon_ndev);
> > +	ret = cfg80211_register_netdevice(mon_ndev);
> 
> Is this now a requirement for all wireless drivers?

Yes and no. It must only be called from within a "please add an
interface" method. Otherwise, register_netdevice() must still be called.

> If so, do other drivers/staging/ drivers need to also be fixed up?

Not as far as I can tell, this is the only wireless staging driver that
even calls register_netdevice(). Not sure why I missed this, I had
audited all of those calls across the tree. But looking a second time
always shows more I guess, sorry about that.

There's another call to register_netdevice() here but I don't think
that's affected, however, it's obviously utterly broken in the first
place:

        if (!rtnl_is_locked())
                unregister_netdev(cur_pnetdev);
        else
                unregister_netdevice(cur_pnetdev);

*sigh*.

> I'm guessing this will be going through the wireless tree, so:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I don't care much, since unfortunately it's already too late and the
breakage is released in 5.12. I'll pick it up through my tree since I
broke it (and probably should add a Cc stable tag.)

johannes

