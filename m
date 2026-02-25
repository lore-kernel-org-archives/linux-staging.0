Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245D25A655;
	Wed, 25 Feb 2026 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032486; cv=none; b=l4GfuyW+kLryDpqqEau+88i/jXCCUaRneXF9PJsXxI2/Bg5xmW7G1GDIvO4L2YI369aEtHOlv9ypJ6APk810zYPo4yzs6EpjCXdSJ4ftZD0Z9d2WWZjGqK/13aqfHpwSOtRmZZ8M5vlZsagIMDkjM0wsE/Jst8bAKAFdVH3SfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032486; c=relaxed/simple;
	bh=H/hsPYBcmp+U3ucUBHSB/cwL2n1dXFt5MNLM3A9yopA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdqMLlAFOAgeUSI+SBr8xDlrfH1LxixHVUVbt2mCm6il8c14BjmveEVjSQIxzWpBIRMxIz5MlVFx9GWxO11oPHGwsYOEopiBmcumRILxrdbrjVzXJ7n9Fx+89jzWAGcj2BEixlk3JafCmbSSIlD4LM61dHXOPmUd4mJQ7pQOcDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TqIDzW7n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TqIDzW7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE88C116D0;
	Wed, 25 Feb 2026 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772032485;
	bh=H/hsPYBcmp+U3ucUBHSB/cwL2n1dXFt5MNLM3A9yopA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqIDzW7n1YDDaePIsXlr/UT1jkH1oPA2cRs0v7yHGYwH5emS7C/ZySZ5Ps0j26u+f
	 q8YtnT4dC2i5ClkUIcf6DmDpiu8AIe+KuoGjuGutviFx24YwsgKDKPRNgRY4qduHJm
	 Xlc0ml9Bd4pHeMTJ1QHym9FklB51yEbeDjrUoNQU=
Date: Wed, 25 Feb 2026 07:14:37 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/21] staging: rtl8723bs: os_dep: fix line lengths in
 ioctl_cfg80211.c
Message-ID: <2026022516-huddle-diffuser-8219@gregkh>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
 <20260224132748.12336-11-luka.gejak@linux.dev>
 <aZ6dfxhSxcc5_TZf@stanley.mountain>
 <2026022520-flanked-effects-14cc@gregkh>
 <D8C30CEE-9D76-4C31-BDAB-B4A4D430CDBF@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8C30CEE-9D76-4C31-BDAB-B4A4D430CDBF@linux.dev>

On Wed, Feb 25, 2026 at 04:08:02PM +0100, Luka Gejak wrote:
> On February 25, 2026 3:56:50 PM GMT+01:00, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >On Wed, Feb 25, 2026 at 09:58:07AM +0300, Dan Carpenter wrote:
> >> On Tue, Feb 24, 2026 at 02:27:37PM +0100, luka.gejak@linux.dev wrote:
> >> > From: Luka Gejak <luka.gejak@linux.dev>
> >> > 
> >> > Break long lines exceeding 100 characters to comply with kernel coding
> >> > style.
> >> > 
> >> > Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> >> > ---
> >> >  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 ++++++++++++------
> >> >  1 file changed, 94 insertions(+), 40 deletions(-)
> >> > 
> >> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> >> > index 51725c302458..c04af493f24d 100644
> >> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> >> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> >> > @@ -127,8 +127,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
> >> >  	if (!spt_band)
> >> >  		goto exit;
> >> >  
> >> > -	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
> >> > -	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
> >> > +	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) +
> >> > +			      sizeof(struct ieee80211_supported_band));
> >> > +	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
> >> > +			     sizeof(struct ieee80211_channel) * n_channels);
> >> >  	spt_band->band = band;
> >> >  	spt_band->n_channels = n_channels;
> >> >  	spt_band->n_bitrates = n_bitrates;
> >> > @@ -207,7 +209,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
> >> >  }
> >> >  
> >> >  #define MAX_BSSINFO_LEN 1000
> >> > -struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork)
> >> > +struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter,
> >> > +					     struct wlan_network *pnetwork)
> >> >  {
> >> >  	struct ieee80211_channel *notify_channel;
> >> >  	struct cfg80211_bss *bss = NULL;
> >> > @@ -248,7 +251,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
> >> >  		u32 wpsielen = 0;
> >> >  		u8 *wpsie = NULL;
> >> >  
> >> > -		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
> >> > +		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
> >> > +		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
> >> > +
> >> 
> >> No spaces in the middle of a declaration block, please.
> >
> >Wait, that's not described in the changelog either!
> >
> >I'll go just drop this whole series, thanks Dan for the better review
> >than I gave it.  I'll blame the jet-lag...
> >
> >thanks,
> >
> >greg k-h
> 
> Hi Greg, 
> What about 13 patches already in staging-testing?

I just now dropped them all, sorry.

Please rebase your whole series and resubmit.

thanks,

greg k-h
