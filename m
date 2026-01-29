Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8D7385EFE;
	Thu, 29 Jan 2026 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696006; cv=none; b=QxH+QC0hDuW74i35ZA0SJAVT0tQXwL7SqgTyqZggVFDi7KhA00XndWRZTszRrFzax5Er4i08kECt+0uDvOIgv7qzAYT3c0ABRWWLFtVdW3yfH+v5rkXpzXuWAFt3vUkGeaUA7492dn36rHNP9eExvQhudrTk49CjpYSfYyJHRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696006; c=relaxed/simple;
	bh=tbAj3PLO+CvrBMOEH/jQSx84vQpnP3I7whyRofokbko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GANItGXcC3/nwO1bzm3hHz6byo/JTxqpHEyEWhuEybymkwhYr72ZNCSsZ8Rj/f9U3YAYiO0iKm5NIy+8XJHo9ov3l7qbFerasILKig7xV+5J762UvnbiwdYHvKRMYgCWTXMm/hcGgTno5i2DgMp5vpoCqD0YPWom3cIgpOLmkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pHgEmuZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pHgEmuZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C33C19422;
	Thu, 29 Jan 2026 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769696006;
	bh=tbAj3PLO+CvrBMOEH/jQSx84vQpnP3I7whyRofokbko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHgEmuZK8YiHjf+0EL+JO4zpnT+VKNNkrTOnSRXun1lq7QtmnyjO5uU7+Kp4PaNe+
	 f8EcDxahur6hxN0TmnqNgWd3B/Y7IJAxDVuVBeYYoyns+XGaB76Y7QNTyegwtgZ5mA
	 32sZNFichD/DEQrQXTBpKJ+QFwpWG0Q5gqXotgBk=
Date: Thu, 29 Jan 2026 15:13:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: straube.linux@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] staging: rtl8723bs: fix out-of-bounds check in
 rtw_restruct_wmm_ie
Message-ID: <2026012925-emblaze-barrel-46fc@gregkh>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
 <20260129132352.14615-5-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129132352.14615-5-lukagejak5@gmail.com>

On Thu, Jan 29, 2026 at 02:23:51PM +0100, Luka Gejak wrote:
> Add a length check before accessing the OUI in WMM
> IE to prevent potential out-of-bounds reads.

Is this really a bugfix?  if so, it needs to go first, and be tagged for
stable trees.

> Use memcmp() for better readability.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> 
> Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index c4f58106b3bd..18a70879f78f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2000,7 +2000,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
>  	while (i < in_len) {
>  		ielength = initial_out_len;
>  
> -		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
> +		if (i + 5 < in_len && in_ie[i] == 0xDD &&
> +		!memcmp(&in_ie[i + 2], "\x00\x50\xf2\x02", 4)) {

Very odd indentation :(

Also, why invert the i+5 check?  And the memcmp check is now messier
than the original.

And is that where you are saying this is a security fix?  If so, it's
just a read, not a write, so what is the security issue?

thanks,

greg k-h
