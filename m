Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1BA3CD8AC
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844896; cv=none; b=Y/a4y7kDn+EMWRCcm1d6VWWd1ubbVvDkLM7lAibVtAk6lGzKdq9d1ZdKt755rDutRbWCJXAD6m/DFeryukhr0ydkuSIFQJj2XE7TS/M0qLelPXbeat4wlfCIBJQtXR1PtRRkx5ZmBcXYt6eebRh7+jYwOvY77urpSezW1etNNjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844896; c=relaxed/simple;
	bh=mgM1w6yn4qoMauYLb28mMuE+PYe6zTL6yTfGDTgZ0r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL1n4QDYRdM5Swk93DrchgLU7mwhDaXKkICoPgf/OCloOzSayaBtnj1leDPEVYd5bEkhcQbs82J+sdwQi+34qcFqrwFj6QIUuDYdmnZvTYmV+2I1IxS3rB7JmJ+40BW/6ZbA+2Kfb6yNTALKX0EjJsUew4Zccxy+/a85LfGBnjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XE7uJPwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XE7uJPwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4DBC2BCB0;
	Fri, 15 May 2026 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778844895;
	bh=mgM1w6yn4qoMauYLb28mMuE+PYe6zTL6yTfGDTgZ0r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XE7uJPwv5y3L3dM5/5n/LX+93pakPSiT0Pi2tOqE50XRK9o21i7mF7H6Gdj1fZaKM
	 rl5VZ1epKZFWJAqH2QYLIa4HUMO+AvDbLl/PstLo11L9gU8sBn/aPOJLMCrJoMJeiK
	 SU8H62htgt47yPCoPtAx8AoKPArdn36X8euqvzek=
Date: Fri, 15 May 2026 13:35:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Message-ID: <2026051526-impatient-feminine-17f7@gregkh>
References: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com>

On Fri, May 15, 2026 at 03:42:03AM -0700, Alexandru Hossu wrote:
> Hi Greg,
> 
> Here is the fix.
> 
> Alexandru
> 
> ---
> 
> The loop in HT_caps_handler() iterates up to pIE->length times, but
> HT_cap[] is only 26 bytes. pIE->length comes from the HT Capability IE
> in the association response and can be up to 255. This lets a rogue AP
> write up to 229 bytes past the array using a bitwise AND into adjacent
> struct fields.
> 
> Clamp the iteration count to the array size.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 4f41f88908d7..e271d1e395a5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -935,7 +935,8 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
> 
>  	pmlmeinfo->HT_caps_enable = 1;
> 
> -	for (i = 0; i < (pIE->length); i++) {
> +	for (i = 0; i < min_t(unsigned int, pIE->length,
> +			       sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
>  		if (i != 2) {
>  			/* Commented by Albert 2010/07/12 */
>  			/* Got the endian issue here. */

How does this compare with this patch:
	https://lore.kernel.org/r/2026041408-grill-mahogany-d1e3@gregkh

or the others sent recently tothe staging list to fix this "issue" that
the LLM tools keep tripping over?

thanks,

greg k-h
