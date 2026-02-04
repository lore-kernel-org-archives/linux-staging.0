Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985837E311;
	Wed,  4 Feb 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770199082; cv=none; b=QkkTxWlzIaS0rudFbQynXxsUDMyBcwAiEtd9JVhlRcjkzGNAylouhr4NBGCGZagN3w3EgVw28W4jN+JzVk5Lpz0zePD9ktulYbvLZvf8UDANlS5JoHpPxnHxsqDUH6YSxuKAl7RreLeCg6bsYit5XUgYSJ4qlBGZx20JpqXu1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770199082; c=relaxed/simple;
	bh=Dy/oBIylftkIMsmry8sUlfQaxEKcGA8RoWC6GC9S/3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PM1Hyq4fW6vWGsKNhKLQF+zLJC4xIlvf2UCIGwFgVFcFyXLMpOu2lqcP0I41T3PC1PU6XmDu2znUdNPvK2+MuvXH+hI7VU2u58fsL2KhbgYXsJm3UuYOC+h/7vPHLWH5ZtDMkjaCTUyGcaAwfKHt5gY+sgcxfn2OZ/IsIUDSriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kV/xbVES; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kV/xbVES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D961C4CEF7;
	Wed,  4 Feb 2026 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770199081;
	bh=Dy/oBIylftkIMsmry8sUlfQaxEKcGA8RoWC6GC9S/3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kV/xbVES+lhe50tqvAa5vsIjR3pSlfqtV/9Xb45Q9oakb76myLZVbkDzXkTgu55hE
	 LJ/XTMQQCBAU4sd6BBkQ87Ei5tYkoaCmg20LcQw48KUuItb6vtjNC+WOrQ1+5FS+el
	 KKdoyXDp6JQkPBDAl/fyYMw70Xsi31JSI1XlewlU=
Date: Wed, 4 Feb 2026 10:57:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gbphy: replaced sprintf() with
 sysfs_emit()
Message-ID: <2026020423-handwash-employed-2176@gregkh>
References: <20260203212254.90855-1-neelb2403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203212254.90855-1-neelb2403@gmail.com>

On Tue, Feb 03, 2026 at 04:22:54PM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit in the protocol_id_show() sysfs
> attribute func to prevent any potential buffer overflows
> 
> This is to ensure a kernel-wide migration to safer string formatting
> functions for sysfs handlers
> 
> This was compile-tested only (no VM/hardware used)
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
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

As Dan said, this really isn't a needed change.  sysfs_emit() is great
for new sysfs files, but for existing ones, sprintf() is just fine.

thanks,

greg k-h
