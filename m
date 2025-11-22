Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03478217722
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 06:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763794211; cv=none; b=s8tW3oigsHhpn0NOk+YfVXE4lnpgiToEcFWpV1itKgf4OMkZ6FmLe8zsW/sAhPBaTix+QanwgrE5m7NYZ+O2SONGXJz7yUBi5jpwBkHB3ej6Mezphvb3o7x8QWlfMK5UBhH9gVLJ3xv9Ml4cQmTd4eVSj+6GpwMDhxJdfOA5ghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763794211; c=relaxed/simple;
	bh=1EqPdpjn5u5pgrcN59q14C+lgyYSNGim9LgreGwJsUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiTrPju4Sse9TCVm5ekaivHtSlmrsT8+FmCYtPUd7k726Un4kMSo1B3jtN7jfpmjaWv2CLZU/vaBO/X4a7BzAdsxugurEHQx/tA1Blb5egGFHdRLMKsnxnk2xp6AcZY6JRzNrGOfa/pHC7xMO+5huYEp6ooz8DRCJe08Qo6BeZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hXdMDA/m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hXdMDA/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6954C4CEF5;
	Sat, 22 Nov 2025 06:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763794210;
	bh=1EqPdpjn5u5pgrcN59q14C+lgyYSNGim9LgreGwJsUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXdMDA/mAZnc1pO88XasDJY7OqaNZEASnoial+pcNQJeyjRlU8UlYXbOEQ52DcoAm
	 3YOvCrchexd65ofFEvBEjTglC7s7cJGWFlSiFER5o0h45S8wQxh8O7D6GelZAaflvI
	 EtteYLGG+qXwuXQYDA87E5A0Q9rpDnC8jE+BCRBw=
Date: Sat, 22 Nov 2025 07:50:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: most: video: replace BUG_ON() with
 WARN_ON_ONCE()
Message-ID: <2025112227-presume-protegee-2499@gregkh>
References: <20251121190909.115556-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121190909.115556-1-pavankumaryalagada@gmail.com>

On Fri, Nov 21, 2025 at 02:09:09PM -0500, Pavan Kumar Yalagada wrote:
> checkpatch.pl recommends replacing BUG_ON() with WARN_ON_ONCE()
> to avoid a kernel panic.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 32f71d9a9cf7..3a622bd597e6 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -575,7 +575,7 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	WARN_ON_ONCE(!list_empty(&video_devices));

But this doesn't handle the fact that the system is now unstable.
Please fix the root cause of this, do not paper over the problem.

thanks,

greg k-h
