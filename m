Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77253ED111;
	Wed,  4 Feb 2026 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207102; cv=none; b=QYDZSp8wr0hNvKAq1ZQYrl+aEyw5kroQGIpXu31txveqywJBtGMetcUAJxebmM5LLHy0Q3KLc6AJjYkUX1tPNrqg9r9WGK3NPE1wjj5HbS0nSGTn9aP+zfHxeIgC1uN6aC/yaNCKdLqzBpb5PoLWj22nJqCWZvCDqN3un9Ufbuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207102; c=relaxed/simple;
	bh=DjY1VdukoE56ICyhAPoSRJQKp5tZ1gz2AYOHTJvX69s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofHMX5kxe7bp/ILeKZ5Jh4kSsJOCP9DLhlILu/N9rZOFGVwLMRMvvB8CkoPpR+gDFuqLvZTzNY2oqKWgPoHveU11/ymgY19uw03k+HFwOfXuaeLpVYlfV1KjA2RagrQhrkk+oLaRetKBardi6tBT9hrznJMD5lMaif88F98loAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rXoaN/N6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rXoaN/N6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F39C4CEF7;
	Wed,  4 Feb 2026 12:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770207102;
	bh=DjY1VdukoE56ICyhAPoSRJQKp5tZ1gz2AYOHTJvX69s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXoaN/N6QjNsW2nmQfx0EYGSDOTaX9jbmcZFOuNUZ0jJMnydPfx/O74F2JEsY4JBB
	 f57ujNGTUFyCyo2OXhoK6s5hcaX+K1wzxpU5YWL2M305OrSaUU8JgnHo20eMevz027
	 P2cbQ0XoKO7peXoY7pYhPzjhXNE9Lu4+KPBDaG4I=
Date: Wed, 4 Feb 2026 13:11:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: gbphy: replace sprintf() with
 sysfs_emit()
Message-ID: <2026020424-reporter-essential-a96f@gregkh>
References: <20260204101342.71267-1-neelb2403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204101342.71267-1-neelb2403@gmail.com>

On Wed, Feb 04, 2026 at 05:13:42AM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit() in the protocol_id_show() sysfs
> attribute function. This code is safe, as replacing sprintf() with
> sysfs_emit() gets rid of calls to sprintf()
> as part of kernel hardening and sysfs_emit() is more appropriate in
> this context.
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
> This was compile-tested only (no VM/hardware used)
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
>  }
>  static DEVICE_ATTR_RO(protocol_id);
>  
> -- 
> 2.44.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
