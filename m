Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C62371D15;
	Mon, 27 Apr 2026 03:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261843; cv=none; b=u8q1sRt9Elf1jERausFvqGpqlfDZkrPxSZWAItthYus/YrUumOa7kIfpGQn60Z07dcN9dDj+oG+ebp0zplV/iOCkqsf8GRtdhG2Y/mehqkzRABQ6s8kmHUaoVemhj2SMZ8uMkt4fFlaDOJYgUhLGdwnJj/LTVmrtNL8w47JfShU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261843; c=relaxed/simple;
	bh=A2ewXW1HcakhDqpCpsNr4rBP6dOqwoqgepB12gm3VBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/hdjflzEO2+OMJT9T/VUXamKpyW2AJ7O1pbcTtonZzKZ8o6wI+05J0Wb9kSFwEV2LvE+AWo+y7oSGO/ZaDefTO2ZHWW5jNI6/q0Kur5CZuzp2OaLfKfQCcHI0YExybKWg9m/2F3tb0UXP8nv3RbnHibYidSR8wCwKkTm7UZBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VqhU1uww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VqhU1uww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E86C2BCB5;
	Mon, 27 Apr 2026 03:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261843;
	bh=A2ewXW1HcakhDqpCpsNr4rBP6dOqwoqgepB12gm3VBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqhU1uwwJL2NlDB268n1p5yts91ZjcwgqgI8Nwt9iEeTXrh1KoqTHImreHwfKu45g
	 vOKvwu01lbqGLHXqynXpRk3gKDM21xrOX5l8GTiTVNnYhr7qWJQtEotiF/BxA2+Y6P
	 RouxpjPa7Yv6ILNILeGEsyny0WqwdhNbhBrkfrDE=
Date: Sun, 26 Apr 2026 21:26:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Alexandru Hossu <hossu.alexandru@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <2026042630-tightness-runner-2121@gregkh>
References: <20260420140807.152739-1-hossu.alexandru@gmail.com>
 <DHYWSUFIWZIM.3C0KFC5EYNHB5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHYWSUFIWZIM.3C0KFC5EYNHB5@linux.dev>

On Tue, Apr 21, 2026 at 04:40:17PM +0200, Luka Gejak wrote:
> On Mon Apr 20, 2026 at 4:08 PM CEST, Alexandru Hossu wrote:
> > HT_caps_handler() iterates pIE->length bytes and writes into
> > HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
> > HT_caps_element).  Because pIE->length is a raw u8 from an over-the-air
> > 802.11 AssocResponse frame and is never validated, a malicious AP can set
> > it up to 255, causing up to 229 bytes of out-of-bounds writes into
> > adjacent fields of struct mlme_ext_info.
> >
> > The parallel function HT_info_handler() already carries the correct guard:
> >
> >   if (pIE->length > sizeof(struct HT_info_element))
> >           return;
> >
> > Apply the same pattern to HT_caps_handler().
> >
> > Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > index 6a7c09db4..b75e7f4f8 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> > @@ -934,6 +934,9 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
> >  	if (phtpriv->ht_option == false)
> >  		return;
> >  
> > +	if (pIE->length > sizeof(struct HT_caps_element))
> > +		return;
> > +
> >  	pmlmeinfo->HT_caps_enable = 1;
> >  
> >  	for (i = 0; i < (pIE->length); i++) {
> 
> Hi Alexandru,
> this fix has been made already by Greg HK therefore this patch is 
> unnecessary. You can see his patch at [1].
> Best regards,
> Luka Gejak
> 
> [1]: https://lore.kernel.org/linux-staging/2026041408-grill-mahogany-d1e3@gregkh/

Yeah, and we both got it wrong, if we do this, this will break things on
some systems according to the ai review bot.  So we need to just
truncate the data, not abort.

Alexandru, want to fix this up in your version and send it?  If so, I'll
drop mine.

thanks,

greg k-h
