Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4223AEF5F;
	Wed, 25 Feb 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031418; cv=none; b=gEB6RRo102tWRn1jxK6/57j2v/Xhaf/AunM1k5StYOtfoSSs0v6XeqjhcpozGKlfG/GRXMOoD05dvqTMibXvFc3uQIepFeOxjbGv1zayH+77Dc1mUoMysgCKoZvCQ24elBHEft9s4pQdd/b1FFjsGN0vp0u9khr+OFTERzp4RRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031418; c=relaxed/simple;
	bh=ZSUsFjhD/22eyzS6j1rhY9Pr/GqvGjpmnUpLSwOXTpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEfQ4tYndXUeeWVwEqE6qjQJ4DQqpE1jCHjfnWcMarAioTSTYZ0R8PaDDAEQ7TCcxXVtz7ZhvK8EiDgtD7Ua+d3fHmT1CL4XoRcg9F4KbjHFtWoZDod13tlTuY49M6Zdp03hFa5C6RLJ5X81zMWoZ2UTIBepziYej4UUJZNEh9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Uhf2xftD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Uhf2xftD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5808C116D0;
	Wed, 25 Feb 2026 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772031418;
	bh=ZSUsFjhD/22eyzS6j1rhY9Pr/GqvGjpmnUpLSwOXTpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhf2xftD0zeJNgyCrigXYdWBm8+YcW8BJZSNmgH+aUcdGWoFN6BclvFVXZJntC9WJ
	 ypVOn+B9tBqhHEs98iaewvQb+dRoL1YfFFSp9c4GdM1ezrrTKjb1IfGnWjh12RmMs9
	 QuedjzTn2l4qEInwfXKjhBjP7ZDGjlvZQyThQv04=
Date: Wed, 25 Feb 2026 06:56:50 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: luka.gejak@linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/21] staging: rtl8723bs: os_dep: fix line lengths in
 ioctl_cfg80211.c
Message-ID: <2026022520-flanked-effects-14cc@gregkh>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-11-luka.gejak@linux.dev>
 <aZ6dfxhSxcc5_TZf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ6dfxhSxcc5_TZf@stanley.mountain>

On Wed, Feb 25, 2026 at 09:58:07AM +0300, Dan Carpenter wrote:
> On Tue, Feb 24, 2026 at 02:27:37PM +0100, luka.gejak@linux.dev wrote:
> > From: Luka Gejak <luka.gejak@linux.dev>
> > 
> > Break long lines exceeding 100 characters to comply with kernel coding
> > style.
> > 
> > Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> > ---
> >  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 ++++++++++++------
> >  1 file changed, 94 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 51725c302458..c04af493f24d 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -127,8 +127,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
> >  	if (!spt_band)
> >  		goto exit;
> >  
> > -	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
> > -	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
> > +	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) +
> > +			      sizeof(struct ieee80211_supported_band));
> > +	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
> > +			     sizeof(struct ieee80211_channel) * n_channels);
> >  	spt_band->band = band;
> >  	spt_band->n_channels = n_channels;
> >  	spt_band->n_bitrates = n_bitrates;
> > @@ -207,7 +209,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
> >  }
> >  
> >  #define MAX_BSSINFO_LEN 1000
> > -struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork)
> > +struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter,
> > +					     struct wlan_network *pnetwork)
> >  {
> >  	struct ieee80211_channel *notify_channel;
> >  	struct cfg80211_bss *bss = NULL;
> > @@ -248,7 +251,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
> >  		u32 wpsielen = 0;
> >  		u8 *wpsie = NULL;
> >  
> > -		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
> > +		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
> > +		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
> > +
> 
> No spaces in the middle of a declaration block, please.

Wait, that's not described in the changelog either!

I'll go just drop this whole series, thanks Dan for the better review
than I gave it.  I'll blame the jet-lag...

thanks,

greg k-h
