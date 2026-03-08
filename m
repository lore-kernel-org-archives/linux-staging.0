Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91E27F73A;
	Sun,  8 Mar 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995553; cv=none; b=uD2cAJr72w2hz0jT+MCeTFqoyug8YpqX+CCSsv9XidMfUxX5GAzutEHKkJHRqt8RmYKjHsgCHFRzEvkGsVR01oYW85X86eKQru3yaBs8Xm7r2MCJLpVcRzI8A6UCQAbEPRmPjEum/SsqlgMReWaEk6m8/ZpkblNFut7hJwjKx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995553; c=relaxed/simple;
	bh=bg53KkJ3xs/Pa/cMe2uFjv8Wm36v+L/NreiS7Er332I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu87gES+mWj17ReQYARhVzPMW8jpE8BDn5CgUmndf7nhApO0/kO7fVi2CeYA1CqcxOjYk5jm4AINdRoJYCdPRcE5EA0/0VoDXTj3qKCuRyhDmX/KBrqM2oeNloMZBbh+MWfY4zgFdMHIMNABKVI+yfXnpvb6ZoNMwnePXeStDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HKpH2ylA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HKpH2ylA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBDAC116C6;
	Sun,  8 Mar 2026 18:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772995553;
	bh=bg53KkJ3xs/Pa/cMe2uFjv8Wm36v+L/NreiS7Er332I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKpH2ylAQpbqIfOj4JmQaUqNHfrFsw0x3m+hrHAvH2HwKeOl3vQkqKsmp+syf9fNB
	 PWVIckcN0d/Xyscx5Q14h9t0gCNhQN628T5eNKOle5/rECjf095ZSkQMYGWD1vsx4b
	 K93gguVGrKVl0qdlnP8E0M0OaZk9VbPbDsRzVc2U=
Date: Sun, 8 Mar 2026 19:45:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Iman Reihanian <reihanianm@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Iman Reihanian <ireihani@uci.edu>
Subject: Re: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE
Message-ID: <2026030816-universe-deodorant-e706@gregkh>
References: <20260306011740.971756-1-ireihani@uci.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306011740.971756-1-ireihani@uci.edu>

On Thu, Mar 05, 2026 at 05:17:40PM -0800, Iman Reihanian wrote:
> BUG_ON causes a kernel panic if the condition is true, which is
> too severe for this cleanup check on module exit. Replace it with
> WARN_ON_ONCE to emit a warning and allow the system to continue.
> 
> Signed-off-by: Iman Reihanian <ireihani@uci.edu>
> ---
>  drivers/staging/most/video/video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf..279ec98aa70e 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -577,7 +577,7 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	WARN_ON_ONCE(!list_empty(&video_devices));

This really doesn't "solve" anything, does it?  If panic-on-warn is
enabled, you still crashed the machine :(

How about fixing the root cause if this could ever happen?

thanks,

greg k-h
