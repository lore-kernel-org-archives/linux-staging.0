Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5641A904;
	Wed, 15 Jul 2026 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121553; cv=none; b=hXWhitApF5mDfMTv2nC3HscgWYwOA7LhZopoemoCoN7mr4U1fSsi/1KBsOSqDNArmTPnp+dQQ+HDycwKrf2eaUW7gsZpN55osD1FKCm/LW4+lalZLXBdmF9p9CNnmLvoXe7dndb0jFQcPx7qMNqcW0pjze1yaZDd2+FUzfB1NsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121553; c=relaxed/simple;
	bh=JTBwCTJAPGMUkcve/awc3UfqXzmgS5JkVz+mLID++0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6UiR30nCiIeq9p4ACoz2UBnKWAiwgpGSTjdTB4PM5TA7xK/NFvRo8PPHHyR9vHTPyK2MeRu+/n47ace4gOA5JXZ/9lhD21egjNFLEvNHx9FlaScKFmULD8MT2Ty3ULLKB5wsTgITrkKi3G/Iahhga6wi4rjYpZb9RcI2koSGgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LIN/4CZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LIN/4CZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EC71F000E9;
	Wed, 15 Jul 2026 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784121550;
	bh=P5oeHcqsUzhF6HiidyqAl4jHFCJq+Ajwt31+IgDRaBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LIN/4CZ5fS1uR5gZVfKZNgALJM3JTSG90K4CEh4V1RuhI7cQ8r06qR6TRAmpd50i5
	 Y318VSu06MlFg1UjgjS86emxXig/vKD2577L92xkbLm+8dTEKZYGpMo++2pW6leY0R
	 8+zOCnDZ+8TW7J7hmizU9NTxHW4izHOdc3qw+48w=
Date: Wed, 15 Jul 2026 15:19:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arsenii Pashchenko <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/61] staging: rtl8723bs: remove redundant
 rtw_ap_set_group_key wrapper
Message-ID: <2026071525-headband-sushi-9a4d@gregkh>
References: <20260715124829.90290-1-ulijg308@gmail.com>
 <20260715124829.90290-2-ulijg308@gmail.com>
 <2026071547-tightness-grueling-4dd0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071547-tightness-grueling-4dd0@gregkh>

On Wed, Jul 15, 2026 at 03:15:41PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 15, 2026 at 07:47:29PM +0700, Arsenii Pashchenko wrote:
> > Eliminate the redundant rtw_ap_set_group_key() wrapper function by
> > calling rtw_ap_set_key() directly with the set_tx parameter set to 1.
> > This reduces boilerplate code and cleans up the driver interface.
> > 
> > Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ap.c           | 7 +------
> >  drivers/staging/rtl8723bs/include/rtw_ap.h        | 2 +-
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++--
> >  3 files changed, 8 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > index 065850a9e..a6640cd7a 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > @@ -1195,7 +1195,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
> >  	return res;
> >  }
> >  
> > -static int rtw_ap_set_key(struct adapter *padapter,
> > +int rtw_ap_set_key(struct adapter *padapter,
> >  			  u8 *key,
> >  			  u8 alg,
> >  			  int keyid,
> > @@ -1258,11 +1258,6 @@ static int rtw_ap_set_key(struct adapter *padapter,
> >  	return res;
> >  }
> >  
> > -int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid)
> > -{
> > -	return rtw_ap_set_key(padapter, key, alg, keyid, 1);
> > -}
> > -
> >  int rtw_ap_set_wep_key(struct adapter *padapter,
> >  		       u8 *key,
> >  		       u8 keylen,
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_ap.h b/drivers/staging/rtl8723bs/include/rtw_ap.h
> > index 83e835eb6..cdd9f291f 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_ap.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_ap.h
> > @@ -22,7 +22,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr);
> >  void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr);
> >  
> >  u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta);
> > -int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid);
> > +int rtw_ap_set_key(struct adapter *padapter, u8 *key, u8 alg, int keyid, u8 set_tx);
> >  int rtw_ap_set_wep_key(struct adapter *padapter, u8 *key, u8 keylen, int keyid, u8 set_tx);
> >  
> >  void associated_clients_update(struct adapter *padapter, u8 updated);
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 1484336d7..ce76a8586 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -604,7 +604,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
> >  
> >  			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
> >  
> > -			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
> > +			rtw_ap_set_key(padapter, param->u.crypt.key,
> > +						   psecuritypriv->dot118021XGrpPrivacy,
> > +						   param->u.crypt.idx, 1);
> 
> Ok, first patch of the series, this isn't correct.
> 
> I'm all for cleanups, but remember, drivers/staging/ is here to get
> experience with kernel development.  Sending a 60+ series as your first
> contribution to the kernel isn't the best way to start out.
> 
> Take your time, don't use a LLM, and fix issues one at a time and then
> batch up patches, maybe 5 at a time and send them out, get reviews, fix
> them up, wait for them to be accepted, and learn the process.
> 
> As-is, with the very first patch in this series being incorrect, I can't
> do anything with these at all as-is.

As for _why_ this patch is wrong, there's the obvious "coding style is
incorrect" which is easy to see.  The real problem is that it doesn't
actually make anything "simpler" at all.  You are perputating an
incorrect api here.  Think about why you are setting a value to 1, and
what that does and if that makes sense at all.  Walk it back and see if
the variable is always set to the same value, why is that variable
needed at all?  And if it's not needed, why is the function parameter
needed?

Unwind the mess, and work to clean things up properly, by learning and
understanding the code, not by throwing a fuzzy-text-matching-tool at
the thing.  If we wanted that type of cleanup, we would have done that
ages ago, that's not the point of this kernel code at all.

thanks,

greg k-h
