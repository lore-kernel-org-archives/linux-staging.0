Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C933BE170;
	Mon,  9 Mar 2026 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072065; cv=none; b=UGyouWfiSFeVwCoRwWKI9DoMwDtszGTnYSyxceJSwxM9h0TByWjwgJE8U4nNT7Tl8fjIURRDwdR5AmIprnjUZTRHTDrqLYmHBWunRPAnXxD7VX1ZUUGH90Q8PgexTy2mlQ7/bKGBVabmsRPiHsMsw1IDKqjkeHIHrkXhKpOucLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072065; c=relaxed/simple;
	bh=IE9WebPwM0H2hsf0PtuLr6OKUQnwp8TSBClNFONnIm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7N0ulfJteAoRFZ+bg399oJLhnKNPJKk7ZSBCz7xPcfxs2b/Eh44j8XbVaegqrgX0jK0RGH/GGWzIda6zN0C+16YKcrdyuud1OgHflw1j7QATKw1UpFMh+PfxRLRbf0SyN1+UQ2G1myHlvHwdUWPP6Rjtmj4Cn6BTttPKv34PNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EljGov8W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EljGov8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C396C2BCB0;
	Mon,  9 Mar 2026 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072064;
	bh=IE9WebPwM0H2hsf0PtuLr6OKUQnwp8TSBClNFONnIm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EljGov8Wf3cOf1rmSmip9QB0KfNGZWaG2nZ0cNnuOxsmUD3VOz5NBLI8dN8PWaEcr
	 uG/uMNEeBkUdmPRtrGrpbNPdLdPsjP9F8JXvuc5dDnXcTLx8g5HrjgFtu44KbBJQ4b
	 e92g4LYDwsaTMafmMXAt9PK0vnApqkWd38MGq5vg=
Date: Mon, 9 Mar 2026 17:01:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sluisr <luistermc789@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, sluisr <contact@sluisr.com>
Subject: Re: [PATCH] staging: greybus: loopback: remove unused macro argument
Message-ID: <2026030950-brunette-dizzy-1b18@gregkh>
References: <20260309004444.20283-1-contact@sluisr.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309004444.20283-1-contact@sluisr.com>

On Sun, Mar 08, 2026 at 06:44:44PM -0600, sluisr wrote:
> This patch fixes the checkpatch.pl warning:
> WARNING: Argument 'conn' is not used in function-like macro
> 
> The gb_dev_loopback_ro_attr macro accepted a 'conn' argument which was
> never used in its expansion. The argument was removed from the macro
> definition and its invocation.
> 
> Signed-off-by: sluisr <contact@sluisr.com>
> ---
>  drivers/staging/greybus/loopback.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index aa9c73cb0..855d5051c 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
>  }									\
>  static DEVICE_ATTR_RW(field)
>  
> -#define gb_dev_loopback_ro_attr(field, conn)				\
> +#define gb_dev_loopback_ro_attr(field)				\
>  static ssize_t field##_show(struct device *dev,		\
>  			    struct device_attribute *attr,		\
>  			    char *buf)					\
> @@ -305,7 +305,7 @@ gb_dev_loopback_rw_attr(us_wait, d);
>  /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
>  gb_dev_loopback_rw_attr(iteration_max, u);
>  /* The current index of the for (i = 0; i < iteration_max; i++) loop */
> -gb_dev_loopback_ro_attr(iteration_count, false);
> +gb_dev_loopback_ro_attr(iteration_count);
>  /* A flag to indicate synchronous or asynchronous operations */
>  gb_dev_loopback_rw_attr(async, u);
>  /* Timeout of an individual asynchronous request */
> -- 
> 2.53.0
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
