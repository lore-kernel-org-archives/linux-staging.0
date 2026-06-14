Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F1286409;
	Sun, 14 Jun 2026 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781417820; cv=none; b=FQ3/xBP4JMROJsHIndERPlBmcbdv74vg4FTnpqyZ4Q5lA+N3Qy5S3NhY8ohkgmPiiRmcvPx0bBdrFksqCS6umN8Xbiws6saBLi0Mm8xTbIpF4Gb5x2Rr2Q2T39BDrGPEcXmOQUBjZULjy37s19eXtHTI216k2LK6wvEHAaFnS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781417820; c=relaxed/simple;
	bh=tTXukyxmR/QEFHUZtiPjecesUhln2peh6mQgp8aFgYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COLuGxPjGv4rt1jdX3IJ2vcCCOFOUdVuizOkJb6nqkVsxyDUZ/ijHqGxBacpm4U5HUQ7VJQhQVtkFfN4QSi1wiTnZ+22RNi2PWnDykDj1snLVzwrgqUXopb5YoK4ap9mBMd3b+7WyRkAZjC/GhBvOij5H09HEST/01JyvVrnmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xNVfOH2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xNVfOH2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51741F000E9;
	Sun, 14 Jun 2026 06:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781417819;
	bh=QhrrSv7+L/wtrm3S9Xq9MeuOnyrapERYSLT899yp4JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xNVfOH2zmYFruH3V/pCvbfwwywc9Vsq+x8xr25pLoDonWLSBR/aCmFEKKNPoziYwH
	 09+mQUcOJwNlnuhxQ0luLNSG+jS4hbj/l39/JEGCaEEjhCw30YiVxWJ8MVB39EHFsD
	 sxBsN6TQHR05DR8SyYtkq3zIDAAbiagSzpx9nxm4=
Date: Sun, 14 Jun 2026 08:15:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: abdelnasser hussein <abdelnasserhussein11@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: greybus: audio: check sscanf() result
 directly
Message-ID: <2026061419-bunkmate-cinch-b506@gregkh>
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>

On Sun, Jun 14, 2026 at 09:08:57AM +0300, abdelnasser hussein wrote:
> Smatch warns:
> 
>   drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
>   warn: sscanf doesn't return error codes
> 
> sscanf() returns the number of successfully matched input items, not a
> negative error code. Compare the return value directly with the expected
> number of conversions instead of storing it in ret as an error code.
> 
> Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
> widget id is validated earlier in the function, so the remaining branch
> can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
> about a potentially uninitialized variable.

When you say "also" that implies it should be a separate patch.

> 
> Reported-by: kernel test robot <lkp@intel.com>

lkp didn't report the smatch warning :(

> Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/
> 
> Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

No list of what changed from previous versions?

thanks,

greg k-h
