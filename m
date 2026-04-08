Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC50277CB8;
	Wed,  8 Apr 2026 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645325; cv=none; b=SoobzSB9XsoJrsi+y/xb6De4H62sUcJv+6EWg58/C2A+0kC+2PIPISAJti1PgKX8gRAzi05+j+idCUlrn4F+2lYtw49Pqsk2Oa9y591v5dCzTJgLfbcnYcHND2lq+q6gjfmuKLdAYJJpU6GIbQY9M3xxD7hMzQgAbdhrbGeAdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645325; c=relaxed/simple;
	bh=YgEKI8RVHPen2/51mnFYBJjPmwq3cLMdBhq+sh4djl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC9GEw//2SQtiGEi1tYj1aYgtKrIhOaaKKeavZoz/2x6WPTj9HWdpqKXgNQnGv4Xr3Ew/mARPcCDtd85Ed6N1iUN8/1Yaee+JuykVvBEZPpO1KR9owSgVU3hoO5ox502MMrQfw0egjyHpnB5I/OQzM4fEXUIF9slG7U8Ls3dRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O6SwflSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O6SwflSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8F4C19421;
	Wed,  8 Apr 2026 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775645325;
	bh=YgEKI8RVHPen2/51mnFYBJjPmwq3cLMdBhq+sh4djl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6SwflSIyl5tMiC7hgmFQFLRIHW9nWyqLuqI3SyWoXH9p8ZMan1+9dDjSqd0cglpI
	 9o6OvHuaWRq5UBPe2sNMPoMWagIx0dekHuGCNUnwa8cXX8l6ynWenkqy/T+tuwtLPo
	 6unzIYTydkHASuzlBzwiqks6/G8Y+5v7Ji0K1s4Q=
Date: Wed, 8 Apr 2026 12:48:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gabriel Rondon <grondon@gmail.com>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: replace BUG_ON() with WARN_ON() in
 comp_exit()
Message-ID: <2026040813-astronomy-aqua-975b@gregkh>
References: <20260408090024.51814-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408090024.51814-1-grondon@gmail.com>

On Wed, Apr 08, 2026 at 10:00:24AM +0100, Gabriel Rondon wrote:
> Replace BUG_ON(!list_empty(&video_devices)) with WARN_ON() in the
> module exit function. BUG_ON() is deprecated as it crashes the entire
> kernel on assertion failure (see Documentation/process/deprecated.rst).
> WARN_ON() logs the unexpected condition without bringing down the
> system.
> 
> This is the last remaining BUG_ON() in the staging/most subsystem,
> following the dim2 series that replaced five BUG_ON() calls.
> 
> Signed-off-by: Gabriel Rondon <grondon@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf..17cdbea2e55a 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -577,7 +577,7 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	WARN_ON(!list_empty(&video_devices));

WARN_ON() also crashes the system when panic-on-warn is enabled (as it
is in a few billion Linux systems...)

So please handle this properly, don't crash.

thanks,

greg k-h
