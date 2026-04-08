Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01F4382F2A;
	Wed,  8 Apr 2026 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649122; cv=none; b=Z1tFEI8rBP4LSuKiQjnf5787H4+Bz3C3i8psufNiBcfR6HsjoQYl6bFXG+LvHQo1n9t0ZoN5KM+IlUnqIRgWspnnQRl7Zln7wRnII7VJuZqLVY7gq9SnRBXmZ71G72WGd+gPPPSB3E8ZN6AplPVTnO7NdusKdzVEWAJXx3YARM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649122; c=relaxed/simple;
	bh=f5+iajwNrFbY3g5MAR6FV64I8GmAC7KkQRUa6NYfyVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0/U6LmG8yxO2x4/LXilmBynXX1RxVqvzFYOqxM28kgq9KKMHWK0uGf7GgUD7mv1tI+0lLq9o61OLXckoIkvjbbV3ghRM7+AvTvCKDwlrZ9SM8aPGR6Lz1YWnbp/Ud4d985IWtGUBbXWtvZUbcQn8sr1mP1wZ2XH41jafKLSYdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gUNXnFlT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gUNXnFlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C64C19424;
	Wed,  8 Apr 2026 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775649122;
	bh=f5+iajwNrFbY3g5MAR6FV64I8GmAC7KkQRUa6NYfyVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUNXnFlTMHPrMcYyRtxijLxPBc5M0HfjY/nsM5dOSQiMyHbu4iO8Q1OwWbkZ/YXH+
	 fzWC5YeStqrkB0UlMD59rCgJ/iVfQGs49hhDowwXlF4hL80SrDDXZufzO0vDw0Yp18
	 xCC+C29ztev7Qyediw6mPzRos1L4btWAfpoNpK1o=
Date: Wed, 8 Apr 2026 13:51:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gabriel Rondon <grondon@gmail.com>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: video: replace BUG_ON() with pr_warn()
 in comp_exit()
Message-ID: <2026040838-washbowl-handbrake-ae03@gregkh>
References: <20260408112818.95174-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408112818.95174-1-grondon@gmail.com>

On Wed, Apr 08, 2026 at 12:28:18PM +0100, Gabriel Rondon wrote:
> Replace BUG_ON(!list_empty(&video_devices)) with an explicit check
> and pr_warn() in the module exit function.
> 
> BUG_ON() is deprecated as it crashes the entire kernel on assertion
> failure (see Documentation/process/deprecated.rst). WARN_ON() is
> also inappropriate here since it crashes the system when
> panic-on-warn is enabled. Use pr_warn() to log the unexpected
> condition without any risk of crashing.
> 
> This is the last remaining BUG_ON() in the staging/most subsystem,
> following the dim2 series that replaced five BUG_ON() calls.
> 
> Signed-off-by: Gabriel Rondon <grondon@gmail.com>
> ---
> Changes since v1:
> - Use pr_warn() instead of WARN_ON() to avoid crash with panic-on-warn
>   (Greg Kroah-Hartman)
> 
>  drivers/staging/most/video/video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf..c5425c207552 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -577,7 +577,8 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	if (!list_empty(&video_devices))
> +		pr_warn("video_devices list not empty on exit\n");

How can this ever happen?  Why not fix that to ensure it can never
happen, and then this check can just be removed entirely?

thanks,

greg k-h
