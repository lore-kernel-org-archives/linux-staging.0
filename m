Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17361110;
	Wed, 26 Oct 2022 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666786345; bh=+Q65ej4JbwX8/itgBgDtPbMGphOFzFFUFnr24Fd4cLk=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=VfFSJOBoE07AoDGnkVZnFqc6YJ2iOvd/++LbyxLfn//mgLqgzAkzCQOgNjADGUMH7
	 1s6TU1S0Wmj5dy+kIJBX8wm1L8W8EEgsHqY9xmX01BjCRh2HjsOygo9/ChZShaonSt
	 WbsnK+iz9gOcqeKFKvoKcYRDp0laiz2xNemVycl8=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Wed, 26 Oct 2022 14:12:25 +0200 (CEST)
X-EA-Auth: Gb9BbW2DushtZY9y0WTWPXm2IyyjglMHKF1ws0Yj96dIpgjoe9MDRDAQW9WmguCQT0dJxWQeOcNI7IVVUZ+jGc5awbtui1df
Date: Wed, 26 Oct 2022 17:42:23 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8192u: remove unnecessary function
 implementation
Message-ID: <Y1kkJ7VNCuBfikGI@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666754500.git.drv@mailo.com>
 <a15fe9f6167e76e4422d303ceafbd4d9b432dd13.1666754500.git.drv@mailo.com>
 <Y1kPlLyo7sb8OfFx@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1kPlLyo7sb8OfFx@kroah.com>

On Wed, Oct 26, 2022 at 12:44:36PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 26, 2022 at 08:57:48AM +0530, Deepak R Varma wrote:
> > Current implementation of function ieee80211_tkip_null simply returns
> > back to the caller without any useful instruction executions. This makes
> > the function call and its implementation unnecessary and should be
> > removed.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/rtl8192u/ieee80211/ieee80211.h            | 3 ---
> >  drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 6 ------
> >  drivers/staging/rtl8192u/ieee80211/ieee80211_module.c     | 3 ---
> >  3 files changed, 12 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > index 9cd4b1896745..00c07455cbb3 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > @@ -232,8 +232,6 @@ struct cb_desc {
> >
> >  #define ieee80211_ccmp_null		ieee80211_ccmp_null_rsl
> >
> > -#define ieee80211_tkip_null		ieee80211_tkip_null_rsl
> > -
> >  #define free_ieee80211			free_ieee80211_rsl
> >  #define alloc_ieee80211			alloc_ieee80211_rsl
> >
> > @@ -2256,7 +2254,6 @@ void ieee80211_ps_tx_ack(struct ieee80211_device *ieee, short success);
> >  void softmac_mgmt_xmit(struct sk_buff *skb, struct ieee80211_device *ieee);
> >
> >  /* ieee80211_crypt_ccmp&tkip&wep.c */
> > -void ieee80211_tkip_null(void);
> >
> >  int ieee80211_crypto_init(void);
> >  void ieee80211_crypto_deinit(void);
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> > index 7b120b8cb982..9bfd24ad46b6 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
> > @@ -716,9 +716,3 @@ void ieee80211_crypto_tkip_exit(void)
> >  {
> >  	ieee80211_unregister_crypto_ops(&ieee80211_crypt_tkip);
> >  }
> > -
> > -void ieee80211_tkip_null(void)
> > -{
> > -//    printk("============>%s()\n", __func__);
> > -	return;
> > -}
> > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> > index b94fe9b449b6..3f93939bc4ee 100644
> > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
> > @@ -159,9 +159,6 @@ struct net_device *alloc_ieee80211(int sizeof_priv)
> >  		ieee->last_packet_time[i] = 0;
> >  	}
> >
> > -/* These function were added to load crypte module autoly */
> > -	ieee80211_tkip_null();
> > -
>
> Ah, but this was created on purpose, did you now break the module
> autoloading here?  Is this built as a separate module or is it all one
> big module?

Looks like a one big module on the kernel I built post this change. I looked
into the modules.dep file for dependencies. I was able to load the driver
r8192u_usb using modprobe without any issues.

Let me know if I should be looking at something else to validate your concern.

>
> You need to explain why this does not change functionality in your
> changelog text.

Okay. I will work on it and send in a revision.

>
> thanks,
>
> greg k-h
>


