Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB4329391;
	Mon,  9 Mar 2026 05:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035047; cv=none; b=MC9XJ0/ei5jEz5tMhnu+tsnLQN/S5+3JhtkfuECt3Vjpjw022Cm59+i2zRxi91yc0UNX03hC9p2hDgeW57g7O/fKb+oIZSuI59Sf5LOFcGQA1I0QYgwc6EcmTPe9D0X4wY+1hb8sU5pVam1b8m112P/ETZCYR9UJC4MAKJ1Axbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035047; c=relaxed/simple;
	bh=v46omtRNGFEp0dWhrR7WA7S9Szdai/ObPXifQOfSi+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRJoPyIJYR9aqTkVq5C38RXtpsg20SrcwAsqFZ0srqPF9EvjjwoJTjl/tgP9NWm9fwCSp9bpZhGZZi8oOiiIpdgr5VFHGWhMP9hQsR+iJ6eGdEfXXu9o5rR1BDW+tJ1pzi056Y/NCLDVpY8SzhPlzUbbmMp8hwG4nSeZM8prvng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jv4qbTRJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jv4qbTRJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E273C4CEF7;
	Mon,  9 Mar 2026 05:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773035046;
	bh=v46omtRNGFEp0dWhrR7WA7S9Szdai/ObPXifQOfSi+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jv4qbTRJqX957HdlIuVs5wAMSKcyXSnpVBSicWaN5eZDU8X6lwHduV6tTequNIHyQ
	 FFq08UifKb4XX7lPFIbm4XdsqxooPQBNYSwBW1Xg7QcAK0ZT3ZHXIdBDM3VlsmgreG
	 dyt74rnM2rJ8Fdg2ZQpWrFkKKr0JJortji/XQUsg=
Date: Mon, 9 Mar 2026 06:43:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mustafa Karamanli <mbarancemkaramanli@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix typos in driver_usage.txt
Message-ID: <2026030935-earthworm-sloping-4aa4@gregkh>
References: <20260309051558.614246-1-mbarancemkaramanli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309051558.614246-1-mbarancemkaramanli@gmail.com>

On Mon, Mar 09, 2026 at 05:15:58AM +0000, Mustafa Karamanli wrote:
> Signed-off-by: Mustafa Karamanli <mbarancemkaramanli@gmail.com>
> ---
>  drivers/staging/most/Documentation/driver_usage.txt | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
> index 2fa8dea1da4d..f1b6977f4543 100644
> --- a/drivers/staging/most/Documentation/driver_usage.txt
> +++ b/drivers/staging/most/Documentation/driver_usage.txt
> @@ -101,11 +101,11 @@ following components are available
>  	   Userspace can access the driver by means of character devices.
>  
>  	2) Networking
> -	   Standard networking applications (e.g. iperf) can by used to access
> +	   Standard networking applications (e.g. iperf) can be used to access
>  	   the driver via the networking subsystem.
>  
>  	3) Video4Linux (v4l2)
> -	   Standard video applications (e.g. VLC) can by used to access the
> +	   Standard video applications (e.g. VLC) can be used to access the
>  	   driver via the V4L subsystem.
>  
>  	4) Advanced Linux Sound Architecture (ALSA)
> @@ -121,7 +121,7 @@ The driver is to be configured via configfs. Each loaded component kernel
>  object (see section 1.3) registers a subsystem with configfs, which is used to
>  configure and establish communication pathways (links) to attached devices on
>  the bus. To do so, the user has to descend into the component's configuration
> -directory and create a new directory (child config itmes). The name of this
> +directory and create a new directory (child config items). The name of this
>  directory will be used as a reference for the link and it will contain the
>  following attributes:
>  
> @@ -129,7 +129,7 @@ following attributes:
>  	  configure the buffer size for this channel
>  	- subbuffer_size
>  	  configure the sub-buffer size for this channel (needed for
> -	  synchronous and isochrnous data)
> +	  synchronous and isochronous data)
>  	- num_buffers
>  	  configure number of buffers used for this channel
>  	- datatype
> @@ -229,7 +229,7 @@ packets within one USB transaction. This renders
>  bytes for padding.
>  
>  Note that at least (2 * subbuffer_size) bytes for isochronous data or
> -(subbuffer_size * packts_per_xact) bytes for synchronous data need to
> +(subbuffer_size * packets_per_xact) bytes for synchronous data need to
>  be put in the transmission buffer and passed to the driver.
>  
>  Since adapter drivers are allowed to change a chosen configuration to best
> -- 
> 2.43.0
> 
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
