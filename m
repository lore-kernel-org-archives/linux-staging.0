Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F2341044;
	Sat,  7 Feb 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471425; cv=none; b=Sx2X1Jlt7lH582Lt8/AL46bmQoUJlEPtuIw+CRfL9tBawS7W4RXrXAcyNIJWsWxawrYig+/s684wbl8MFQUsN6fG2b+78Ejwa17CRrc1Lj5LdCNt0AoUDDIm6guBNkEGVhfhL4ESgqNpWN9aB4hD7us9t9d7WUV4F+HMjN+BReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471425; c=relaxed/simple;
	bh=waKnZAx8r2jfxT0C3bCF7x9i3QOM+h3W8d2dJAz2chM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTYjDfedW1afVDnEOBA2dmYxu12UUS+O/xoB/R1nf6TL2yUHbkLPXXDu08qpcfIaUWbLqpmFEjlKKV29Us3hKer8Pl9f+SF6CtoVxrASaKJVW69TI3MiKHXLiG+QUWrsFLVSXw/eV95YkJiP7rt5R9lSZBF6RR0mVeVurkBF/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hSQWXxID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hSQWXxID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1F7C116D0;
	Sat,  7 Feb 2026 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471425;
	bh=waKnZAx8r2jfxT0C3bCF7x9i3QOM+h3W8d2dJAz2chM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSQWXxIDRmSWotArOir94dF4HwQSFU8WwujJ1a5lhv81otNTsOx/OnxSN1Ghp3J6z
	 KUM/6O+vq/3MlQ1tHHtMKersiviqi/XvDPi5d0Qt7Z8b+ek6chk7W4nnUgDELpXPPu
	 B+U/QWYV1ze1hBr6B3SjtCzvz6rPDb7aMI3STxks=
Date: Sat, 7 Feb 2026 14:37:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] [PATCH v3] staging: greybus: gbphy: Replace sprintf()
 with sysfs_emit()
Message-ID: <2026020730-superhero-secrecy-877a@gregkh>
References: <20260205033408.86340-1-neelb2403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205033408.86340-1-neelb2403@gmail.com>

On Wed, Feb 04, 2026 at 10:34:08PM -0500, Neel Bullywon wrote:
> Replace sprintf() with sysfs_emit() in the protocol_id_show() sysfs
> attribute function. This code is safe as-is, but replace
> sprintf() with sysfs_emit() because we are trying to get rid of calls
> to sprintf() as part of kernel hardening; sysfs_emit() is more
> appropriate in this context.
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
> This was compile-tested only (no VM/hardware used)
> 
> Changes in v2:
> - Subject: change to imperative "Replace" (was "Replaced").
> - Wording and line breaks adjusted in the commit body for clarity.
> 
> Changes in v3:
> - Clarify what "safe" means (buffer is PAGE_SIZE) per Dan Carpenter's
>   suggestion.
> - Reflow lines to avoid awkward breaks.
> ---
>  drivers/staging/greybus/gbphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 60cf09a302a7..55f132b09cee 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> -	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
> +	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);

For new sysfs files, using sysfs_emit() is fine, but for existing ones,
using sprintf() is also ok, just leave them as-is please.

thanks,

greg k-h
