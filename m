Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D0635C1B2;
	Mon, 27 Apr 2026 03:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261816; cv=none; b=oXWZzzt/bpYXHd/XFvSVXREEKMliNXX9JstN6u3RRAvoTBB4VsS4iHIgNAvDNKHgASoLmQfxNAsIVT/yQpT3LkWGdlDR6MAozFWOuuqMJbMm6ZrvS4vpAjdSCyzdEXDWY2aZwLA1pcSKWGuTyqunzrFG9hE+/ulG7C5e69Kd5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261816; c=relaxed/simple;
	bh=sVrfq+ITFiFijoz5j+1LgMYCET3TGwgEcBgOxYTRh/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqTjaNN7LARkEgpsSJLUIEsEuitRTI1/ESQcxQGLfKScIVQnS877Ge5hsxelFzfaR9nbXEPOfvLGq0xhT7YKiV1Cnw/DoPBo3VaDF1jOMc5oUut/xL1SclyrU07jyyPFOW9t0P66+HhWRJvpidWTO4gpKAFoBnukTC32+NQKP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J1ssNPXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J1ssNPXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6B6C19425;
	Mon, 27 Apr 2026 03:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261816;
	bh=sVrfq+ITFiFijoz5j+1LgMYCET3TGwgEcBgOxYTRh/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1ssNPXJPL+PnUCzOPPnp+iquMJbzIyNKB/fK0cxp5jxUoNdGo/twEcV9miLeE1cn
	 CLGkMMaHOw9o/hdQV/vh0pk8vY3IpT0J0MQHYYyP+OOTDPsT6RDhQJ9QZTyq2Lhchw
	 WfKZzmwTRGz2BuYTfJMyT4psOfm/RDhcyemYvazU=
Date: Sun, 26 Apr 2026 20:47:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ajith P V <ajithpv.linux@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: replace BUG_ON() in comp_exit
Message-ID: <2026042658-reword-cornbread-79a3@gregkh>
References: <20260416163334.80699-1-ajithpv.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416163334.80699-1-ajithpv.linux@gmail.com>

On Thu, Apr 16, 2026 at 04:33:34PM +0000, Ajith P V wrote:
> Replace BUG_ON() with WARN_ON() and pr_err inside comp_exit().
> 
> BUG_ON() is risky and not recommended to use in kernel.
> It should replace with proper handlers such as WARN()-family
> (see Documentation/process/deprecated.rst).
> 
> Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf..78cbf367c308 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -577,7 +577,8 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	if (WARN_ON(!list_empty(&video_devices)))
> +		pr_err("video_devices list not empty during module exit\n");
>  }
>  
>  module_init(comp_init);
> -- 
> 2.43.0
> 

This was sent before you:
	https://lore.kernel.org/r/20260412222318.65045-1-grondon@gmail.com

which fixes it properly.  Also see all the other times replacing
BUG_ON() with WARN_ON() has been rejected by me in the past, so this
wouldn't be ok either.

thanks,

greg k-h
