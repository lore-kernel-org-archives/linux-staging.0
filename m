Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41843914E1;
	Mon, 27 Apr 2026 03:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261844; cv=none; b=G+a6Q8shKoLLofqG2OmT4156JRw8FX0wawKTCpXIeulpIBWXZ4/9wPx+h7WFb2F8g4VeHA6X1sU1txjtIOwqJg0gf19XQeQEaYPujthTu0vA4Iic3fUXxot7wyw6cHM4S7BWd31in6Wwn2Bqde/+NPCUz450nKMYBSzDfGlz/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261844; c=relaxed/simple;
	bh=M1YnN1XMSmOxD0rwTWEsdmuCwmGJgDBoI9yvfBcS9Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUkiLQFxGEBknp9sKe2+KnvwRrDw0BT52CiUnwHEDZMreDK/FHEaa9c7baBGI0QwADvfIKKI3p03GIM7Zg6+/4MG4uCdHwVg6PcKlLFjJ5Z1ZxhNe/QMl8DcRJ5mOXEq/TDA65C1zmdm/UUCsxeUM10gww7R03/WlNqmMmAgQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YLCjwGPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YLCjwGPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C1DC2BCB9;
	Mon, 27 Apr 2026 03:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261843;
	bh=M1YnN1XMSmOxD0rwTWEsdmuCwmGJgDBoI9yvfBcS9Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLCjwGPPtP5G08L2N+l16izC0nUFRoX3Pyos6dL2XKmA1nw0udQ4HpzGLaVZQJxaE
	 C8a/W1pN3W1JACSAnzK5xwzqbBbGW7lqisG1KU/MrxTZJBPUhJ3YnpbsuSZ8FFHRhj
	 FjExgz4x62+qe8CSXgOeHxcutjeuROH6IqJ5nTWE=
Date: Sun, 26 Apr 2026 21:27:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Message-ID: <2026042612-twiddle-disparate-ebef@gregkh>
References: <2026041408-grill-mahogany-d1e3@gregkh>
 <DHT3IJS5RI4B.1GG2CZL3B47RU@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHT3IJS5RI4B.1GG2CZL3B47RU@linux.dev>

On Tue, Apr 14, 2026 at 08:39:59PM +0200, Luka Gejak wrote:
> On Tue Apr 14, 2026 at 7:19 PM CEST, Greg Kroah-Hartman wrote:
> > HT_caps_handler() loops up to pIE->length, the IE length byte taken
> > directly from an over-the-air association response, and uses the counter
> > to index pmlmeinfo->HT_caps.u.HT_cap[26].  A malicious AP can supply an
> > HT capabilities IE with a length byte up to 255, AND-writing into
> > adjacent fields of struct mlme_ext_info.  This is reachable in station
> > mode (the default) via OnAssocRsp.
> >
> > HT_info_handler() already rejects oversized IEs so do the same thing in
> > HT_caps_handler() to resolve this.
> >
> > Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> > Assisted-by: gregkh_clanker_t1000
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > index 3242978da36c..a2e016c6a01f 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > @@ -932,6 +932,9 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
> >  	if (phtpriv->ht_option == false)
> >  		return;
> >  
> > +	if (pIE->length > sizeof(pmlmeinfo->HT_caps))
> > +		return;
> > +
> >  	pmlmeinfo->HT_caps_enable = 1;
> >  
> >  	for (i = 0; i < (pIE->length); i++) {
> 
> Good catch. Trusting pIE->length blindly from an unauthenticated 
> association response is a classic oob write vector. Since HT_cap is 
> fixed-size within the mlme_ext_info struct, this is a clear remote heap
> corruption risk if a malicious AP is in range.
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

And it's wrong, as per the AI review :(

Also, you have trailing whitespace on your review comments :)

thanks,

greg k-h
