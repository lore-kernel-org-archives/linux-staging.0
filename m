Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72F2F90C9;
	Mon,  3 Aug 2026 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785736355; cv=none; b=AyckVD/3sCEbOiVw0Z8rKsrSN/GfDSAWtkh+GAhbl7OyBolSx3ZwmpqVlWC8ocCd/aVgDCF6chOPaDFqRL4MExoi8wqdLBsmqnkflydFIwH0DnRV2C4bovHo4W3dY8FczuplkQfBJqteb/DfzgW79GExQSyLfaIF6uGDhPJkcSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785736355; c=relaxed/simple;
	bh=KxqUuudAGeWgxyqRIwAZNjdv+szJSR1u/W2WJxHTIgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WC71z2e3gUt8P/ok3TDdiSMSez3NLHNnkpPn2ZuAVUx1aQMaOJGt6n0tnfoiUSnJAs8tto5BulPyX+r91NdIn/nnsptW9CPTC/5lF0sIWxh+XtBAtFkwas95HO4ri0Z6/LtCR4Ch9cNspr93ih8oYjCdTmJcG2XfsWJwISYlxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Eq59+Esx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Eq59+Esx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3291F000E9;
	Mon,  3 Aug 2026 05:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785736353;
	bh=NqRQV1MlmYw9jIfgzR1U8byRUET9K3xJGNhFMShwfR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eq59+Esxtc8SaT5lsOpag5VOCq5hq5N1Pk7Cv9W8T5QfsfpXuI9cJzE05D+RNvq6H
	 7xqFtnsDXqyizfYl7UZ/p0vMqebmw1Y1ZrBHkCl3CT+wKeGgPNV15JYel2zEQ2Xwmj
	 /pVgXxZXB3m5cQB+uZwGo+ruMTnRegCE5Y9LYNWY=
Date: Mon, 3 Aug 2026 07:51:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: validate HT capability IE
 length before use
Message-ID: <2026080344-deacon-sequence-cb0a@gregkh>
References: <20260802153509.44263-1-ali@iusegentoo.com>
 <20260802153509.44263-2-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802153509.44263-2-ali@iusegentoo.com>

On Sun, Aug 02, 2026 at 03:35:08PM +0000, Ali Ahmet Memis wrote:
> Four sites locate the HT capability element with rtw_get_ie() and then
> read through it without checking that the element is long enough:
> 
> 	p = rtw_get_ie(..., WLAN_EID_HT_CAPABILITY, &len, ...);
> 	if (p && len > 0) {
> 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
> 		ht_cap_info = le16_to_cpu(pht_cap->cap_info);
> 
> rtw_get_ie() only bounds the element against the end of the IE buffer, so
> len is whatever the sender put in the length byte. A beacon or probe
> response carrying a one byte HT capability element passes len > 0 and the
> driver then reads two bytes of cap_info, and in rtw_update_ht_cap() the
> ampdu_params_info byte after that, from beyond the element.
> 
> An HT capability element is a fixed 26 bytes, so require that much before
> dereferencing it. The frames come from the air, so the length is not
> under local control.
> 
> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

What tool did you use to find and fix these and how were they tested?

thanks,

greg k-h
