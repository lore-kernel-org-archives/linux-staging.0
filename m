Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F94CE1F
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709574648; cv=none; b=fHACFLzx3ZGxeZWYQe1Zc3MQLmxu4R174JXu+Ixjc0DOtNoCP+zGMVKSn7Jyh94Yu1avcGOSZ4qs0Tb50bUxkazpbTJ0IZB9ECk9V8RyLM0TYNKKybQtqKeFvJpWQq5GGV9bmWlP6Tieu/uKEpzdFVxjtCJY2vTQxQocI483XJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709574648; c=relaxed/simple;
	bh=QuF3C2Ed/MyiUFsrC++f95lj8oD/Ue/7jwUSPDN3/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIFYx1GGKcI33HUASRybYOvdP0RjFdXfD3kc36xtKNTKrPZBkIo96+WL0bwlCM/JjXG+5GMdkzIZn0eH1E/wkLb+vNupBHQ0aQ3shdJ5fYW0Y+f5Z/9LllAG2QJG18D6Ob/6bO2dDyE/qif5UvKuVL3+hKqC/aD/2YoPWHlvTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F89MnUkZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F89MnUkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E91C433C7;
	Mon,  4 Mar 2024 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709574648;
	bh=QuF3C2Ed/MyiUFsrC++f95lj8oD/Ue/7jwUSPDN3/0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F89MnUkZEschcAHRbnVx9CPJxPmTynkTsz8uHaBa9IqvOT13ixjNm+/q0qr0eFz1x
	 /NvsUckBcqm3UPO/tPOt5fDCanppymL66wpNTYmedKscFLGuxugEqHHo6PuAEoctVU
	 fyRviS6vnwYQF44ruv1zZ2GoKissQ4H+WK/PJTVw=
Date: Mon, 4 Mar 2024 18:50:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: forest@alittletooquiet.net, linux-staging@lists.linux.dev
Subject: Re: [PATCH V3] Staging: octeon: match parentheses alignment
Message-ID: <2024030422-backstage-derby-a1e4@gregkh>
References: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
 <20240304144937.34283-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304144937.34283-1-dorine.a.tipo@gmail.com>

On Mon, Mar 04, 2024 at 02:49:37PM +0000, Dorine Tipo wrote:
> Correct parameter alignment in cvmx_spi_restart_interface().
> 
> This patch aligns the parameters with the opening parenthesis for better
> readability and adherence to coding style guidelines.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 3e7b92cd2e35..44cced319c11 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
>  }
>  
>  static inline int cvmx_spi_restart_interface(int interface,
> -					cvmx_spi_mode_t mode, int timeout)
> +					     cvmx_spi_mode_t mode, int timeout)
>  {
>  	return 0;
>  }
> -- 
> 2.25.1
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
